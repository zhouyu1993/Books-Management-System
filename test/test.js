var mysql = require('mysql')

var DBconfig = {
  host: 'localhost',
  port: '3306',
  user: 'root',
  password: '123456',
  database: 'TEST',
  insecureAuth: true,
}

var pool = mysql.createPool(DBconfig)

pool.getConnection((err, connection) => {
  if (err) {
    console.log(err)

    console.log('--------------------------连接失败--------------------------')
  } else {
    console.log(connection)

    console.log('--------------------------连接成功--------------------------')
  }
})
