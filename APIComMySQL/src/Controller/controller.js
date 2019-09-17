//Conectando com o banco de dados.
const connection = require('../ConnectionDB/connection');

//Verificando se a conexão com o banco está tudo certo.
connection.connect(function (error) {
    if (error) return console.log(error);
    return console.log("Conectado com o banco.");
});

module.exports = {

    async listarColaboradores(req, res) {
        const sql_query = "select * from Pessoa;";
        connection.query(sql_query, function (error, results) {
            if (error) return res.json({
                erro: true,
                mensagem: error
            });
            if (results == 0) return res.json({
                erro: false,
                mensagem: "Não há colaboradores cadastrados."
            });
            else {
                return res.json({
                    erro: false,
                    mensagem: "Lista dos colaboradores registrados carregada.",
                    colaboradores: results
                });
            }
        });

    },

    async verificarSeExisteColaborador(req, res) {
        const cpfPessoaValue = req.params.cpfPessoa;
        const queryVerify = `select idPessoa from Pessoa where cpfPessoa = ${cpfPessoaValue};`;
        connection.query(queryVerify, function (error, result) {
            if (error) return res.json(error);
            console.log(result);
            if (result == '') {
                return res.json({
                    cadastrado: false
                });
            } else {
                return res.json({
                    cadastrado: true
                });
            }
        });
    },

    async adicionarColaborador(req, res) {
        //Pegando os parâmetros vindo da requisição.
        const cpfPessoaValue = req.body.cpfPessoa;
        const nomeCompletoPessoaValue = req.body.nomeCompletoPessoa;
        const dataNascimentoPessoaValue = req.body.dataNascimentoPessoa;
        const sexoPessoaValue = req.body.sexoPessoa;
        const cargoPessoaValue = req.body.cargoPessoa;

        //Query de adição de novo colaborador.
        const sql_query_create = `insert into Pessoa(cpfPessoa,nomeCompletoPessoa,dataNascimentoPessoa,sexoPessoa, Cargo_idCargo) values('${cpfPessoaValue}','${nomeCompletoPessoaValue}','${dataNascimentoPessoaValue}','${sexoPessoaValue}',${cargoPessoaValue});`;

        //Conection para verificar se existe o CPF enviado no banco.
        connection.query(sql_query_create, function (error, results) {
            if (error) {
                console.log("Erro ao adicionar novo colaborador. Error" + error);
                return res.json({
                    erro: true,
                    mensagem: error
                });
            } else {
                const queryNewRegister = `select * from Pessoa where cpfPessoa = '${cpfPessoaValue}';`;
                connection.query(queryNewRegister, function (error, result) {
                    if (error) {
                        console.log('Error ao consultar novo colaborador. Error: ' + error);
                        return res.json({
                            erro: true,
                            mensagem: error
                        });
                    } else {
                        return res.json({
                            erro: false,
                            mensagem: "Colaborador cadastrado com sucesso!",
                            colaborador: result
                        });
                    }
                });
            }
        });
    },

    async atualizarColaborador(req, res) {
        //Pegando o valor do CPF que veio no parâmetro de requisição para atualizarmos a data de nascimento do estagiário.
        const cpfPessoaValue = req.params.cpfPessoa;
        const cargoPessoaValue = req.body.cargoPessoa;
        //Vamos atualizar somente o id do cargo do colaborador.
        const query_update = `update Pessoa set Cargo_idCargo = ${cargoPessoaValue} where cpfPessoa = '${cpfPessoaValue}';`
        connection.query(query_update, function (error, results) {
            if (error) {
                return res.json({
                    erro: true,
                    mensagem: error
                });
            }
            const query = `select * from Pessoa where cpfPessoa ='${cpfPessoaValue}';`;
            //Pegando a última atualização para retornar ao cliente requisitante.
            connection.query(query, function (error, results) {
                if (error) {
                    return res.json({
                        erro: true,
                        mensagem: error
                    });
                }
                return res.json({
                    erro: false,
                    mensagem: "Colaborador atualizado com sucesso!",
                    colaborador: results
                });
            });
        })
    },

    async excluirColaborador(req, res) {
        //Pegando dos parâmetros da requisição o cpf do estagiário que vamos deletar.
        const cpfPessoaValue = req.params.cpfPessoa;
        const query_delete = `delete from Pessoa where cpfPessoa = '${cpfPessoaValue}';`;
        connection.query(query_delete, function (error, results) {
            if (error) return res.json({
                error: true,
                mensagem: error
            });
            return res.json({
                erro: false,
                mensagem: `Colaborador de CPF ${cpfPessoaValue} foi deletado da base de dados.`
            });
        });
    },

    async listarCargos(req, res) {
        const sql_query = "select * from Cargo;";
        connection.query(sql_query, function (error, results) {
            if (error) return res.json({
                erro: true,
                mensagem: error
            });
            else {
                return res.json({
                    erro: false,
                    mensagem: "Lista de cargos carregada.",
                    cargos: results
                });
            }
        });
    },

    async adicionarIdeia(req, res) {
        const descricaoIdeiaValue = req.body.descricaoIdeia;
        const dataCadastroIdeiaValue = req.body.dataCadastroIdeia;
        const idPessoaValue = req.body.idPessoa;
        const queryAddIdeia = `INSERT INTO Ideia(descricaoIdeia, dataCadastroIdeia, Pessoa_idPessoa) values('${descricaoIdeiaValue}','${dataCadastroIdeiaValue}',${idPessoaValue});`;

        connection.query(queryAddIdeia, function (error, result) {
            if (error) {
                return res.json({
                    erro: true,
                    mensagem: error
                });
            } else {
                const query_new_ideia = `select * from Ideia where idIdeia = ${result.insertId};`;
                connection.query(query_new_ideia, function (error, result) {
                    if (error) {
                        return res.json({
                            erro: true,
                            mensagem: error
                        });
                    } else {
                        return res.json({
                            erro: false,
                            ideia: result,
                            mensagem: "Sugestão cadastrada com sucesso."
                        });
                    }
                });
            }
        });
    },

    async listarIdeias(req, res) {
        const sql_query = "select * from Ideia;";
        connection.query(sql_query, function (error, results) {
            if (error) return res.json({
                erro: true,
                mensagem: error
            });
            else {
                return res.json({
                    erro: false,
                    ideias: results,
                    mensagem: 'Lista de sugestões cadastradas carregadas.'
                });
            }
        });
    }

}

