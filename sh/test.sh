#!/bin/bash

while [ "$1" != "" ]; do
    case $1 in
        -a | --option-a )   # 选项 -a 或 --option-a
            echo "Option A argument: $2"
            shift 2
            ;;
        -b | --option-b )   # 选项 -b 或 --option-b
            echo "Option B argument: $2"
            shift 2
            ;;
        -c | --option-c )   # 选项 -c 或 --option-c
            echo "Option C argument: $2"
            shift 2
            ;;
        * )     # 默认情况，当脚本遇到不认识的选项时
            echo "Unrecognized option: $1"
            exit 1
            ;;
    esac
done