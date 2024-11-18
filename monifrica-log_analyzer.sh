#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"
ERROR_COUNT=$(grep -c "404" $LOG_FILE)
IP_COUNT=$(awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr)

echo "Log Analysis Report"
echo "-------------------"
echo "Total 404 Errors: $ERROR_COUNT"
echo "Top IPs:"
echo "$IP_COUNT"























