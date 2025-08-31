#!/bin/bash

# Define variables at the top
LOG_DIR="/home/kamran/BashScripting/BashScripting/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
# APP_LOG_FILE="application.log"
# SYS_LOG_FILE="system.log"

echo "=============================================="
echo "### Analysing log files in $LOG_DIR directory"
echo "=============================================="

# Step 1: Find recent log files
echo -e "\n### List of log files updated yersterday ###"
# find "$LOG_DIR" -name "*.log" -mtime -1
LOG_FILES=$(find "$LOG_DIR" -name "*.log" -mtime -1)
echo "$LOG_FILES"

# Loop through each log file
for LOG_FILE in $LOG_FILES; do
    for PATTERN in "${ERROR_PATTERNS[@]}"; do
#  echo -e "\n========================================================================="
#  echo "============ $LOG_FILE ============"
#  echo -e "\n========================================================================="

 echo -e "\n### searching $PATTERN logs in $LOG_FILE ###"
 grep "$PATTERN" "$LOG_FILE"

 echo -e "\n### Number of $PATTERN logs found in $LOG_FILE ###"
 grep -c "$PATTERN" "$LOG_FILE"

 # Additional commands omitted for brevity
    done
done

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