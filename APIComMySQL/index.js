const express = require('express');
const app = express();
// const cors = require('cors')

//Aqui, estamos dizendo que esta API está recebendo requisições com dados vindos de JSON.
app.use(express.json());
// app.use(cors());

//Configurando as permissões de acesso as rotas via o cors.
// app.use(function (req, res, next) {
//     res.header("Access-Control-Allow-Origin", '*');
//     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, X-CSRF-Token, X-File-Name");
//     if (req.headers['x-access-token'] != '@sgd-header-token-#123321*7!') {
//         res.sendStatus(401)
//         return
//     }
//     next();
// });

//Aqui, estamos conectando ao projeto de API as rotas para tratar as requisições.
app.use('/', require("./src/routes"));

//Aqui, estamos dizendo que a aplicação está rodando na porta 3005.
app.listen("3005");