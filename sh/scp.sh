#!/bin/bash

function help {
cat <<EOF
  SCP命令的语法如下：

  scp [选项] [源文件] [目标地址]

  # 选项：
  • -h：使用说明
  • -P <port>：指定远程服务器的端口号，默认为 22。
  • -p：保留原始文件的文件属性，例如文件的创建时间、修改时间和权限等。
  • -q：启用静默模式，不显示进度信息，只显示错误和警告信息。
  • -r：递归地复制整个文件夹及其内容。
  • -C：启用 gzip 压缩选项，在传输过程中压缩文件，加快传输速度。
  • -i：使用用户名和密码登录远程主机，不使用公钥验证。
  • -o：传递 SSH 客户端选项，用于配置 SSH 会话。
  • -S：指定用于控制对等连接的 UNIX 套接字。

  # 示例：

  # 将本地文件 file.txt 复制到远程主机 remote-host 的 /home/user 目录下：
  scp file.txt user@remote-host:/home/user

  # 将远程主机 remote-host 的 /home/user/file.txt 复制到本地 /tmp 目录下：
  scp user@remote-host:/home/user/file.txt /tmp

  # 递归复制本地目录 myfolder 到远程主机 remote-host 的 /home/user 目录下：
  scp -r myfolder user@remote-host:/home/user

  # 从远程主机 remote-host 的 /home/user/myfolder 目录下递归复制文件到本地 /tmp 目录下，并显示详细信息：
  scp -r -v user@remote-host:/home/user/myfolder /tmp
EOF
}

_default_port=22
_src_file=""
_target_file=""

if [ "$1" = "-h" ]; then
  help
  exit 0
else
  echo -e "Error: invalid option $1 \r\n"
  help
  exit 1
fi