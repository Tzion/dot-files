#!/bin/bash

# Function to escape special shell characters
escape_shell_chars() {
    echo "$1" | sed -e 's/\\/\\\\/g' -e 's/\t/\\t/g' -e 's/\n/\\n/g' -e 's/\r/\\r/g' -e 's/"/\\"/g' -e "s/'/\\'/g" -e 's/`/\\`/g' -e 's/\$/\\$/g' -e 's/!/\\!/g' -e 's/{/\\{/g' -e 's/}/\\}/g'
}

# Function to make clipboard content shell-friendly
make_clipboard_shell_friendly() {
    # Get clipboard content
    if command -v pbpaste &> /dev/null; then
        # macOS
        CLIPBOARD_CONTENT=$(pbpaste)
    elif command -v xclip &> /dev/null; then
        # Linux with xclip installed
        CLIPBOARD_CONTENT=$(xclip -selection clipboard -o)
    else
        echo "Clipboard utility not found. Please install xclip (Linux) or check your macOS pbpaste command."
        return 1
    fi

    # Escape special characters
    ESCAPED_CONTENT=$(escape_shell_chars "$CLIPBOARD_CONTENT")

    # Output the escaped string
    echo "$ESCAPED_CONTENT"
}
