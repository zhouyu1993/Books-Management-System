# 安装 mysql

``` bash
brew info mysql@5.6

brew install mysql@5.6

mysql -V

mysqladmin -V

brew uninstall mysql

brew cleanup
```

# 设置密码

``` bash
mysql_secure_installation

# Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 这里一定选 0
```

# brew 启动/重启/停止 mysql

``` bash
brew services start mysql

brew services restart mysql

brew services stop mysql

brew services cleanup
```

# 查看 mysql 是否启动

``` bash
ps -ef | grep mysql

ps -ef | grep mysqld
```

# 停止 mysql

``` bash
kill -9 [第二个数字]
```

``` bash
mysqladmin -u root -p shutdown # 关闭 mysql
```

# 连接 mysql 数据库

``` bash
mysql -u root -p # 输入密码
```

# 修改密码

``` bash
# 查看 validate_password 密码验证插件是否安装。

mysql> SHOW VARIABLES LIKE 'validate_password%';

mysql> set global validate_password.policy=0;
mysql> set global validate_password.length=4;

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
```

# 查看有哪些数据库

``` bash
mysql> show databases;
```

# 创建并选择数据库

``` bash
mysql> CREATE DATABASE TEST; # 创建数据库

mysql> use TEST; # 选择数据库
```

# 查看当前

``` bash
mysql> # select database();

mysql> status;

mysql> show tables;
```

# 导入数据

``` bash
set names utf8; # 设置编码

source test.sql; # 导入数据库

# select * from websites; # 获取数据
```

# 删除数据库

``` bash
drop database TEST;
```

# node 连接 mysql

``` bash
# 安装 node_modules
npm install

node test.js
```

# 导出/备份数据库

``` bash
mysqldump -u root -p BOOK > backup/book.sql
```

# 设置

~/.zshrc

/etc/my.cnf

`/usr/local/etc/my.cnf`

``` bash
[client]
port = 3306
socket = /tmp/mysql.sock
default-character-set = utf8

[mysqld]
collation-server = utf8_unicode_ci
character-set-server = utf8
init-connect ='SET NAMES utf8'
max_allowed_packet = 64M
bind-address = 127.0.0.1
port = 3306
socket = /tmp/mysql.sock
innodb_file_per_table = 1
default_authentication_plugin = mysql_native_password

[mysqld_safe]
timezone = '+0:00'
log-error = /usr/local/var/log/mysql/error.log
```
