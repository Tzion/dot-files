#!/bin/bash
NEW_TAB=false
for arg in "$@"; do
    [[ "$arg" == "-n" || "$arg" == "--new" ]] && NEW_TAB=true
done
# Strip flags from positional args
ARGS=()
for arg in "$@"; do [[ "$arg" != -* ]] && ARGS+=("$arg"); done

if [[ ${#ARGS[@]} -lt 3 ]]; then
    echo "Usage: $(basename "$0") [-n] SYMBOL DATE TIME [INTERVAL]"
    echo "  $(basename "$0") LUV 25-02-12 12:33 3"
    echo "  $(basename "$0") LUV 2025-02-12 1233"
    echo "  $(basename "$0") LUV 25-02-12 12:33    (defaults to 3min)"
    echo "  $(basename "$0") -n LUV 25-02-12 12:33  (force new tab)"
    echo ""
    echo "Flags:"
    echo "  -n, --new    Open in a new tab (default: reuse existing TradingView tab)"
    exit 0
fi
SYMBOL="${ARGS[0]}" RAW_DATE="${ARGS[1]}" RAW_TIME="${ARGS[2]}" INTERVAL="${ARGS[3]:-3}"
[[ ${RAW_DATE:2:1} == "-" ]] && DATE="20${RAW_DATE}" || DATE="$RAW_DATE"
[[ "$RAW_TIME" != *":"* ]] && TIME="${RAW_TIME:0:2}:${RAW_TIME:2:2}" || TIME="$RAW_TIME"

TV_URL="https://www.tradingview.com/chart/?symbol=${SYMBOL}&interval=${INTERVAL}"

# Use trading view tab or open a new one
if $NEW_TAB; then
    open "$TV_URL"
else
    export TV_URL
    osascript <<'OPEN'
set tvURL to system attribute "TV_URL"
tell application "Arc"
    activate
    set found to false
    repeat with w in every window
        repeat with i from 1 to count of every tab of w
            if URL of tab i of w contains "tradingview.com/chart" then
                set URL of tab i of w to tvURL
                tell tab i of w to select
                set found to true
                exit repeat
            end if
        end repeat
        if found then exit repeat
    end repeat
    if not found then
        tell front window to make new tab with properties {URL:tvURL}
    end if
end tell
OPEN
fi
sleep 1.8

# Automate chart Go-To (alt+G) to jump to bar
export TV_DATE="$DATE" TV_TIME="$TIME"
osascript <<'EOF'
tell application "System Events"
    key code 5 using option down -- Alt+G
    delay 1.5
    keystroke "a" using command down
    keystroke (system attribute "TV_DATE")
    delay 0.1
    if (system attribute "TV_TIME") is not "" then
        key code 48 -- Tab
        delay 0.2
        keystroke "a" using command down
        keystroke (system attribute "TV_TIME")
    end if
    key code 36 -- Enter
    key code 36 -- Enter
end tell
EOF
