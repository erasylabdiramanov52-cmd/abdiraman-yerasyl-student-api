#!/bin/bash

LOG_FILE="logs/Abdiraman_Yerasyl_system_report.log"

{
    echo "================================="
    echo "Student: Abdiraman Yerasyl"
    echo "Student ID: 38133"
    echo "Group: IT-2310"
    echo "================================="

    echo "Date and Time:"
    date

    echo "Username:"
    whoami

    echo "Operating System:"
    cat /etc/os-release | grep PRETTY_NAME

    echo "Kernel Version:"
    uname -r

    echo "CPU Information:"
    lscpu | grep "Model name"

    echo "Memory Information:"
    free -h

    echo "Disk Usage and Available Space:"
    df -h /

    echo "================================="
} | tee "$LOG_FILE"
