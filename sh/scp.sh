#!/bin/bash

. ./func/confirm.sh

_options="-r"
_src_file=""
_target_file=""

function help {
  echo -e "
  本脚本 $(basename $0) 使用方式如下：

  ./$(basename $0) -h # 查看帮助

  ./$(basename $0) # 进入交互式命令，分别输入 [options]、[source file]、[target file]，最后确认是否执行 scp 命令
  "
}

function start {
  echo -e "
  current command: scp [options] [source file] [target file]

  1. please input the [options], and there are [options]:
  • -P <port>：指定远程服务器的端口号，默认为 22。
  • -p：保留原始文件的文件属性，例如文件的创建时间、修改时间和权限等。
  • -q：启用静默模式，不显示进度信息，只显示错误和警告信息。
  • -r：递归地复制整个文件夹及其内容。
  • -C：启用 gzip 压缩选项，在传输过程中压缩文件，加快传输速度。
  • -i：使用用户名和密码登录远程主机，不使用公钥验证。
  • -o：传递 SSH 客户端选项，用于配置 SSH 会话。
  • -S：指定用于控制对等连接的 UNIX 套接字
  "
  read -p "now, input your [options]: " _options

  echo -e "$_options"

  source_file
}

function source_file {
  read -p "please input the [source file]: " _src_file
  echo -e "$_src_file"

  target_file
}

function target_file {
  read -p "please input the [target file]: " _target_file
  echo -e "$_target_file"

  scp_func
}

function scp_func {
  cmd="scp $_options $_src_file $_target_file"
  echo -e "
  final command is:

  $cmd
  "

  if func::confirm "do you want to execute this command?"; then
    eval "$cmd"
  else
    echo "you don't want to execute this command"
  fi
}

if [ "$1" = "-h" ]; then
  help
  exit 0
fi

start