#!/bin/bash

echo "all variables passed to script: $@"

echo "number of variables passed to script: $#"

echo "script name: $0"

echo "present working directory: $PWD"

echo "who is running the script: $USER"

echo "home directory of user: $HOME"

echo "process id of script: $$"

echo "background process id: $!"

echo "exit status of previous command: $?"