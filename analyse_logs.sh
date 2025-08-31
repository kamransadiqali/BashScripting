#!/bin/bash

# Define variables at the top
LOG_DIR="/home/kamran/BashScripting/BashScripting/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/home/kamran/BashScripting/BashScripting/logs/analyse_logs_report.txt"
echo "Analysing log files" > "$REPORT_FILE"
echo "===================" >> "$REPORT_FILE"
# APP_LOG_FILE="application.log"
# SYS_LOG_FILE="system.log"

# echo "=============================================="
# echo "### Analysing log files in $LOG_DIR directory"
# echo "=============================================="

# Step 1: Find recent log files
echo -e "\nList of log files updated in last 24 hours" >> "$REPORT_FILE"
# find "$LOG_DIR" -name "*.log" -mtime -1
LOG_FILES=$(find "$LOG_DIR" -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"

# Loop through each log file
for LOG_FILE in $LOG_FILES; do
    for PATTERN in "${ERROR_PATTERNS[@]}"; do
 echo -e "\n=========================================================================" >> "$REPORT_FILE"
 echo "$LOG_FILE" >> "$REPORT_FILE" 
 echo -e "=========================================================================" >> "$REPORT_FILE"

 echo -e "\nsearching $PATTERN logs in $LOG_FILE file" >> "$REPORT_FILE"
 grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

 echo -e "\nNumber of $PATTERN logs found in $LOG_FILE file" >> "$REPORT_FILE"
 ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
 echo "$ERROR_COUNT" >> "$REPORT_FILE"

 if [ "$ERROR_COUNT" -gt 10 ]; then
    echo -e "\n ⚠️ Action required: too many "$PATTERN" errors in log file "$LOG_FILE" "
 fi
    done 
done 

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE"

# MANUAL Log Analysis Workflow
# echo -e "\n### searching ERROR logs in application logs ###"
# # Step 2: Search for errors in application log
# grep "ERROR" "$LOG_DIR"/"$APP_LOG_FILE"

# echo -e "\n### Number of errors found in application logs ###"
# # Step 3: Count errors
# grep -c "ERROR" "$LOG_DIR"/"$APP_LOG_FILE"

# echo -e "\n### The last error from application logs ###"
# # Step 4: Get most recent error
# grep "ERROR" "$LOG_DIR"/"$APP_LOG_FILE" | tail -1

# echo -e "\n### The FATAL errors from system logs ###"
# # Step 5: Check for fatal errors in system log
# grep "FATAL" "$LOG_DIR"/"$SYS_LOG_FILE"

# echo -e "\n### Number of FATAL errors in system logs ###"
# # Step 6: Count fatal errors
# grep -c "FATAL" "$LOG_DIR"/"$SYS_LOG_FILE"