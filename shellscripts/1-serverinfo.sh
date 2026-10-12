#!/bin/bash

# Meta data
# Author: Harsha
# Date: 13/09/2026
# Description: Server information
# version: V1

#debug mode
set -x # shows commands along with the result
set -e # exits if pipe fails
set -o pipefail

# "Hostname, Date, User and Directory Deatils"
echo " Hostname: $(hostname) "
echo " Date: $(date) "
echo " User: $(whoami) "
echo " Directory: $(pwd) "
echo " Diskspace: $(df -h /) "
echo " operating system: $(uname -o) "
echo " Kernel Release: $(uname -r) "
