#!/bin/bash


extract_root_domain() {
    echo "$1" | sed -E 's/^(https?:\/\/)?(www\.)?([^\/]+).*$/\3/'
}


output_file="result.txt"


> "$output_file"


while IFS=',' read -r col1 col2 col3 col4 col5 col6 col7; do
    
    domain=$(echo "$col2" | sed -E 's/[^a-zA-Z0-9.-]//g')  
    if [[ "$domain" =~ \. ]]; then
        # Extract root domain and append to result.txt
        root_domain=$(extract_root_domain "$domain")
        echo "$root_domain" >> "$output_file"
    fi
done < "$1"  

echo "Root domains have been saved to $output_file"
