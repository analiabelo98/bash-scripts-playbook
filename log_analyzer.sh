#!/bin/bash

#Check if at least one argument is provided
if [ $# -lt 1 ]; then
	echo "Usage: $0 <logfile> [search_term]"
	exit 1
fi

LOGFILE=$1

#Set default search term to 'error' if not provided
SEARCH_TERM=${2:-"error"}

#output
OUTPUT_FILE="log_analysis_$(date +%F).txt"

echo "Analyzing log file: $LOGFILE"
echo "Searching for: $SEARCH_TERM"
echo "Saving result to: $OUTPUT_FILE"
echo "--------------------" >> "$OUTPUT_FILE"

#Search and count matchES
MATCHES=$(grep -i "$SEARCH_TERM" "$LOGFILE" | tee -a "$OUTPUT_FILE" | wc -l)

#print summary
echo "found $MATCHES matches for '$SEARCH_TERM'"
echo "results saved to $OUTPUT_FILE"


