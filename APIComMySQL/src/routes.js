const express = require('express');
const routes = express.Router();

//Realizando a importação do arquivo de controller onde estão as funções das rotas propriamente ditas.
const controller = require('./Controller/controller');

//Rotas da API feitas com base na integração dos dados de API.
//Rotas para o colaborador.
routes.get("/listarColaboradores", controller.listarColaboradores);
routes.get("/verificarSeExisteColaborador/:cpfPessoa", controller.verificarSeExisteColaborador);
routes.post("/adicionarColaborador", controller.adicionarColaborador);
routes.put("/atualizarColaborador/:cpfPessoa", controller.atualizarColaborador);
routes.delete("/excluirColaborador/:cpfPessoa", controller.excluirColaborador);

//Rotas para o cargo.
routes.get("/listarCargos", controller.listarCargos);

// //Rotas para as ideias.
routes.post("/adicionarIdeia", controller.adicionarIdeia);
// routes.get("/listarIdeias", controller.listarIdeias);

//Fazendo a exportação do routes que é o documento que contém todas as rotas da API em questão.
module.exports = routes;
