#!/bin/bash

function help {
  echo -e "
  本脚本 $(basename $0) 使用方式如下：

  ./scp.sh -h # 查看帮助

  ./scp.sh # 进入交互式命令，分别输入 [options]、[source file]、[target file]，最后确认是否执行 scp 命令
  "
}

if [ "$1" = "-h" ]; then
  help
  exit 0
fi