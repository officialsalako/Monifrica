#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( ${CPU_USAGE%%.*} > CPU_THRESHOLD )); then
   echo "High CPU usage: $CPU_USAGE%" | mail -s "Alert: High CPU" stovsalako@gmail.com
fi

# Check memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
if (( MEMORY_USAGE > MEMORY_THRESHOLD )); then
   echo "High Memory usage: $MEMORY_USAGE%" | mail -s "Alert: High Memory" stovsalako@gmail.com
fi

# Check disk usage
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')
if (( DISK_USAGE > DISK_THRESHOLD )); then
   echo "High Disk usage: $DISK_USAGE%" | mail -s "Alert: High Disk" stovsalako@gmail.com
fi




























