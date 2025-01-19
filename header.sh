#!/bin/bash

# The header template - Note that all right borders align at exactly the same column
read -r -d '' HEADER << 'EOF'
//==============================================================================
// |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
// |                                                                           |
// | ███████╗██╗██████╗  ────────── ZIB LIBRARY ────────                       |
// | ╚══███╔╝██║██╔══██╗                                                       |
// |   ███╔╝ ██║██████╔╝  Created: [CREATED]                         |
// |  ███╔╝  ██║██╔══██╗  Last Updated: [UPDATED]                    |
// | ███████╗██║██████╔╝                                                       |
// | ╚══════╝╚═╝╚═════╝                                                        |
// |___________________________________________________________________________|
//==============================================================================
EOF

# Function to process a single file
process_file() {
    local file="$1"
    local temp_file="$(mktemp)"
    local current_datetime="$(date '+%Y-%m-%d %H:%M:%S')"
    
    # Check if file already has a header
    if grep -q "//==============" "$file"; then
        # Get original creation datetime if it exists
        created_datetime=$(grep "Created:" "$file" | sed 's/.*Created: \([0-9-]* [0-9:]*\).*/\1/')
        if [ -z "$created_datetime" ]; then
            created_datetime="$current_datetime"
        fi
        
        # Remove existing header
        sed '/\/\/==============/,/\/\/==============/d' "$file" > "$temp_file"
    else
        # No existing header, use current datetime for creation
        created_datetime="$current_datetime"
        cat "$file" > "$temp_file"
    fi
    
    # Replace dates in header
    echo "$HEADER" | \
        sed "s/\[CREATED\]/$created_datetime/" | \
        sed "s/\[UPDATED\]/$current_datetime/" > "$file"
    echo "" >> "$file"
    
    # Append the rest of the file
    cat "$temp_file" >> "$file"
    rm "$temp_file"
    
    echo "Updated header in $file"
}

# Main script
main() {
    # Check if directory argument is provided
    local dir="${1:-.}"  # Use current directory if none specified
    
    # Find all .zig files and process them
    while IFS= read -r -d '' file; do
        process_file "$file"
    done < <(find "$dir" -type f -name "*.zig" -print0)
}

# Run the script
main "$@"
