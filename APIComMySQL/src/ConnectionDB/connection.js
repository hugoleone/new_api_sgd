const mysql = require('mysql');

//A constante connection tem a função de criar conexão com o banco de dados para podermos manipulá-lo.
const connection = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '',
    database: 'db_sgd'
});

//Abaixo estamos realizando a exportação da constante connection para ficar disponível para outros arquivos da API.
module.exports = connection;
