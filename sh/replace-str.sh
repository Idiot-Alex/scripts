#!/bin/bash

_source_str=""
_params=""
_param_keys=()
_param_values=()

function help {
  echo -e "
  本脚本 $(basename $0) 使用方式如下：

  ./$(basename $0) -h # 查看帮助

  ./$(basename $0) # 进入交互式命令，分别输入 [source string]、[key value...]，最后确认是否执行
  ./$(basename $0) 'hello #{key}' key world # 输出 hello world
  "
}

function start {
  echo -e "
  current command: replace-str [source string]、[key value...]

  1. please input the [source string] with variable, example: 
  • 'hello #{key}' # key is variable
  "
  read -p "now, input your [source string]: " _source_str

  echo -e "$_source_str"

  input_params
}

function input_params {
  read -p "please input the [key value...]: " _params

  _num=$(echo $_params | awk -F ' ' '{print NF}')

  for i in $(seq 1 $_num)
  do
    _value=$(echo $_params | awk -F ' ' "{print \$$i}")

    if [ $((i % 2)) -eq 0 ]; then
      _param_values+=("$_value")
    else
      _param_keys+=("$_value")
    fi
  done

  replace_str
}

function replace_str {
  _result_str="$_source_str"

  for i in $(seq 0 $((${#_param_keys[*]} - 1)))
  do
    _key=${_param_keys[$i]}
    _value=${_param_values[$i]}

    _result_str=$(echo $_result_str | sed "s/#{$_key}/$_value/g")
  done

  echo -e "
  final result is:

  $_result_str
  "
}

if [ "$1" = "-h" ]; then
  help
  exit 0
fi

start