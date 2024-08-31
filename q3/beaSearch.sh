#! /usr/bin/bash

result_filename="out-search.txt"
> $result_filename

divider=--------------------------------------------------
divider=$divider$divider$divider$divider
width=200
format=' %-20s | %-50s | %-25s | %s \n'
printf "$format" Name "Path" "Date" "Text line" > $result_filename


search_string=$1
search_directoryPath=$2
files=`ls "$search_directoryPath"`

for entry in $files; do    
    if [[ "$entry" != "$result_filename" ]] && [[ -f "$entry" ]] && [[ "$entry" != "beaSearch.sh" ]]; then
        result_str=""
        result_str=`grep -i "$search_string" "$entry"`
        
        if [[ -n "$result_str" ]]; then
            basename=`basename "$entry"`
            path=`pwd "$entry"` 
            date=`date -d "@$(stat -c '%Y' "$entry")" '+ %Y %b %d %T'`
            
            IFS=$'\n' read -rd '' -a result_arr <<<"$result_str"

            for (( i=0; i<${#result_arr[@]}; i++ )); do
                printf "%-"$width"s\n" "$divider" >> $result_filename
                printf "$format"  "$basename" "$path" "$date" "${result_arr[$i]%$'\r'}" >> $result_filename
            done
        fi
    fi     
done