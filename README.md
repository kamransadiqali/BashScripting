- Introduction
- Understanding Bash
- Check version
- Sample Log Files
- Basic Linux Commands
- Creating Your First Script
- Variables & Arrays
- Loops & Iteration
- File Operations & Conditionals


# BashScripting
Shell scripting can transform tasks that take 30-45 minutes of manual  work into automated processes that run in seconds

#### To check Bash version
```shell
 echo "Hello, Bash scripting!"
 which bash
 bash --version
```
### Sample Log Files
The sample files contain detailed log entries with timestamps, severity levels, and various system and application messages that we'll analyze in our scripts.
#### Directory Setup with sample files creation
```shell
mkdir logs
cd logs
touch application.log
touch system.log
touch logs/application.log
touch logs/system.log
```
### Basic Linux Commands
#### Viewing Files
```shell
cat /home/kamran/BashScripting/BashScripting/logs/system.log
less /home/kamran/BashScripting/BashScripting/logs/system.log
head /home/kamran/BashScripting/BashScripting/logs/system.log
tail /home/kamran/BashScripting/BashScripting/logs/system.log
```
#### Searching Content
```shell
grep "ERROR" /home/kamran/BashScripting/BashScripting/logs/system.log
grep -c "ERROR" /home/kamran/BashScripting/BashScripting/logs/system.log
grep -i "ERROR" /home/kamran/BashScripting/BashScripting/logs/system.log
grep -n "ERROR" /home/kamran/BashScripting/BashScripting/logs/system.log
```
#### Finding Files
```shell
find . -name "*.log"
find /home/kamran/BashScripting/BashScripting/logs/ -name "*.log" -mtime -1
find /home/kamran/BashScripting/BashScripting/logs/ -name "*.log" -size +100M
find /home/kamran/BashScripting/BashScripting/logs/ -name "*.log" -exec grep -l "ERROR" {} \;
```
#### MANUAL Log Analysis Workflow
```shell
# Step 1: Find recent log files
find /home/kamran/BashScripting/BashScripting/logs -name "*.log" -mtime -1
# Step 2: Search for errors in application log
grep "ERROR" /home/kamran/BashScripting/BashScripting/logs/application.log
# Step 3: Count errors
grep -c "ERROR" /home/kamran/BashScripting/BashScripting/logs/application.log
# Step 4: Get most recent error
grep "ERROR" /home/kamran/BashScripting/BashScripting/logs/application.log | tail -1
# Step 5: Check for fatal errors in system log
grep "FATAL" /home/kamran/BashScripting/BashScripting/logs/system.log
# Step 6: Count fatal errors
grep -c "FATAL" /home/kamran/BashScripting/BashScripting/logs/system.log
```
#### Create, Make Executable and Run Your First Script
```shell
touch analyse_logs.sh
vim analyse_logs.sh
chmod +x analyse-logs.sh
./analyse-logs.sh
```