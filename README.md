# 安装环境

## [git](https://git-scm.com/)

在当前文件打开 `git` 命令行工具：

打开指定文件，鼠标右键，点击 `Git Bash Here`

https://blog.csdn.net/csdnliuxin123524/article/details/76183686

## [node@8.14.0](http://nodejs.cn/download/)

下载电脑系统对应的，win/linux/macOS 等

你是华硕 64 位，就下载 Windows 的 64 位的 .msi

下载完成后，双击 .msi 运行进行安装。

打开 `git`，在 `git` 命令行工具中输入 `node -v`

如果输出包含 `v...` 版本号，代表安装成功。

如果报 `node` 不存在之类的，可能是没有把 `node` 加入到 path 的系统变量中。需要添加 path 的系统变量。

## [mysql@8.0.13](https://dev.mysql.com/downloads/mysql/)

下载电脑系统对应的，win/linux/macOS 等

你是华硕 64 位，就下载 `mysql-8.0.13-winx64.zip`

下载完成后，解压，应该有名字为 `mysql` 类似的文件夹。

保险期间！在 `mysql所在的文件中/bin` 文件下打开 `git`，在 `git` 命令行工具中输入 `mysql -V` 或者 `winpty mysql -V`

如果输出包含 `v8.0.13` 代表安装成功。

如果安装或者启动还有问题，可以参考：

* https://www.jianshu.com/p/710e5861c198
* https://www.jianshu.com/p/4e62c99c3d86

另外可能是 `/usr/local/etc/my.cnf` 文件配置需要修改成：

当然具体 `windows` 的 `my.cnf` 在哪儿，结合自己电脑

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

## 设置 `mysql` 的密码 【这里很重要，因为只能执行一次】

在 `git` 命令行工具中输入 `mysql_secure_installation` 或者 `winpty mysql_secure_installation`

``` bash
# ...

Enter current password for root (enter for none): # 初次运行直接回车

# 如果遇到需要选择 validate_password.policy，如

Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: # 这里一定选 0

# ...

Set root password? [Y/n] <– 是否设置 root 用户密码，输入 y 并回车
New password: <– 设置 root 用户密码，这里为了测试，设置 `123456`
Re-enter new password: <– 再输入一次你设置的密码

# 如果下面出现代表密码设置成功

Password updated successfully!
Reloading privilege tables..
… Success!

# 下面遇到需要输入或确认的，一律输入 y 并回车
```

## 启动 `mysql`

在 `git` 命令行工具中输入 `mysqld --console` 或 `winpty mysqld --console`

如果有类似 ` Socket: '/tmp/mysqlx.sock' bind-address: '::' port: 3306` 的输出，代表启动成功。

## 查看 `mysql` 是否启动

在 `git` 命令行工具中输入，有下面三种方式可以尝试：

``` bash
# 查看 3306 端口是否占用
netstat -an|find "3306"

# 查看 3306 端口是否占用
lsof -i:3306

# 查看 mysqld
ps -ef | grep mysqld
```

如果有输出，`mysql` 正在启动

## 连接 mysql

在 `git` 命令行工具中输入 `mysql -u root -p` 或 `winpty mysql -u root -p`

``` bash
Enter password: # 输入设置的密码 123456

# 如果出现 mysql> 代表连接 mysql 成功

mysql>
```

以下出现 mysql> 的命令，皆是在此环境下输入的！

## 修改密码以及保护策略

``` bash
# 查看当前密码设置参数
mysql> SHOW VARIABLES LIKE 'validate_password%';

# 主要看 validate_password.policy 是 LOW 还是 MEDIUM

# 设置 validate_password.policy 为 LOW
mysql> set global validate_password.policy=0;
mysql> set global validate_password.length=4;

# 查看当前密码设置参数
mysql> SHOW VARIABLES LIKE 'validate_password%';

# 主要看 validate_password.policy 是 LOW 还是 MEDIUM

# 修改密码
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
```

## 添加 test 数据库

查看所有数据库，应该有 information_schema、mysql、performance_schema、sys 等

`mysql> show databases;`

查看当前所用数据库，初次连接应该是 NULL

`mysql> select database();`

创建 test 数据库

`mysql> CREATE DATABASE TEST;`

再次查看所有数据库，应该多了一个 TEST

`mysql> show databases;`

选择 test 数据库，会提示 Database changed 代表选择成功

`mysql> use TEST;`

再次查看当前所用数据库，应该是 test 了

`mysql> select database();`

设置编码

`mysql> set names utf8;`

导入 `/Books-Management-System/test/test.sql`，这里需要用绝对路径！！

`mysql> source 绝对路径/Books-Management-System/test/test.sql;`

需要补全绝对路径啊！

测试是否导入成功，会输出一个表格

`mysql> select * from websites;`

## 在 test 目录测试 node 连接 mysql

在当前项目的 test 目录下，即 `/Books-Management-System/test`，另开一个 `git` 命令行工具

安装当前 test 的 `node` 环境，输入 `npm i`

安装成功后，输入 `node test.js`，如果提示 `连接成功`，代表一切都准备好了！！！

## 正式使用 app 目录

### 导入 `app/book.sql` 同 `test/test.sql`

创建 book 数据库

`CREATE DATABASE BOOK;`

选择 book 数据库，会提示 Database changed 代表选择成功

`mysql> use TEST;`

设置编码

`mysql> set names utf8;`

导入 `/Books-Management-System/app/book.sql`，这里需要用绝对路径！！

`mysql> source 绝对路径/Books-Management-System/app/book.sql;`

需要补全绝对路径啊！

测试是否导入成功，会输出一个表格

`mysql> select * from t_admin;`

### 启动 app

在当前项目的 app 目录下，即 `/Books-Management-System/app`，另开一个 `git` 命令行工具

安装当前 app 的 `node` 环境，输入 `npm i`

安装成功后，输入 `node app.js`

浏览器输入 `localhost:9000` 访问，出现登陆界面就对了！

需要登陆，提供了 6 个初始账户，账户和密码一样，只不过密码在验证时加密了！

分别是：

| Admin_id | Admin_name | Admin_password                   | Admin_type |
| ---------|------------|----------------------------------|------------|
|        1 | root       | 63a9f0ea7bb98050796b649e85481845 | 1          |
|        2 | admin      | 21232f297a57a5a743894a0e4a801fc3 | 1          |
|        3 | book1      | 65d8db90b8b4efbc55b1a062c58f2fc1 | 2          |
|        4 | book2      | 745c723e03084d27553fb9d4037b08c1 | 2          |
|        5 | read1      | 108749512d78aa131a8eeb8d1c067ba3 | 3          |
|        6 | read2      | d40e0f3dfb94d7877f6ad4450ccdb3ed | 3          |

比如，用 root 登陆，就分别输入，账户： root 和密码： root。

如果登陆成功，代表一切都 OK 啦！可以体验功能了！

## 体验完毕，如果需要关闭 mysql

在 `git` 命令行工具中输入 `mysqladmin -u root -p shutdown` 或 `winpty mysqladmin -u root -p shutdown`
