#!/bin/bash

function func::confirm {
  # $1 是要确认的操作说明字符串
  read -p "$1 (y/n): " answer
  # 判断用户输入的是否为 y，如果是，则返回 0，否则返回 1
  [[ "$answer" == "y" || "$answer" == "Y" ]] && return 0 || return 1
}