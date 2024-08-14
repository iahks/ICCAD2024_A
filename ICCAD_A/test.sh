for i in {0..75}; do
    filename="genlib${i}.genlib"
    
    # Check if the file exists
    if [ -f "$filename" ]; then
        # Compare this file with other files with higher indices
        for j in $(seq $((i + 1)) 37); do
            comparefile="genlib${j}.genlib"
            
            # Check if the compare file exists
            if [ -f "$comparefile" ]; then
                # Compare content of files
                if cmp -s "$filename" "$comparefile"; then
                    echo "Duplicate found: $filename and $comparefile"
                    # Remove the duplicate file
                    rm "$comparefile"
                    echo "Deleted: $comparefile"
                fi
            fi
        done
    fi
done