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
cat logs/system.log
less logs/system.log
head logs/system.log
tail logs/system.log
```
#### Searching Content
```shell
# Search for errors in system log
grep "ERROR" logs/system.log
# Count errors
grep -c "ERROR" logs/system.log
grep -i "ERROR" logs/system.log
grep -n "ERROR" logs/system.log
```
#### Finding Files
```shell
find . -name "*.log"
# Find recent log files
find logs/ -name "*.log" -mtime -1
find logs/ -name "*.log" -size +100M
find logs/ -name "*.log" -exec grep -l "ERROR" {} \;
```
