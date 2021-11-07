#!/bin/bash -x

#Script to allow our web admin users to perform some 'yum' checks
# Usage: ./web_admin.sh <action> <package>
# check-updates: No package tp specify package name
# check-installed: Please specify a package name
# check-available: Please specify a package name

# define our variables
# script inputs
ARG1=$1
ARG2=$2
#  other variables
YUM=usr/bin/yum

#let's go!
set -x
if [ "$ARG1" = "check-updates" ] ; then
    $YUM check-update >> web_admin.log 
    YUM_RESULT=$?
            case $YUM_RESULT in
                    100)
                            echo "Updates available"
                            exit 111
                            ;;
                    0)
                            echo "No updates available"
                            exit 112
                            ;;
                    1)
                            echo "Error!"
                            exit 113
                            ;;
            esac
set +x
elif [ "$ARG1" = "check-installed" ] ; then
        $YUM list --installed $ARG2 >>web_admin.log 2>&1
        YUM_RESULT=$?
                case $YUM_RESULT in
                    0)
                            echo "Package is installed!"
                            exit 114
                            ;;


"web_admin.sh" 72L, 1449C
