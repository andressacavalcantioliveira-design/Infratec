INSERT INTO funcionarios (nome, setor)
VALUES ('João Silva', 'Produção');

INSERT INTO funcionarios (nome, setor)
VALUES ('Maria Oliveira', 'Segurança do Trabalho');

INSERT INTO funcionarios (nome, setor)
VALUES ('Carlos Henrique', 'Manutenção');

INSERT INTO treinamentos (item, quantidade, validade)
VALUES ('NR-35 - Trabalho em Altura', 20.00, '2027-08-10');

INSERT INTO treinamentos (item, quantidade, validade)
VALUES ('NR-10 - Segurança em Instalações Elétricas', 15.00, '2027-10-15');

INSERT INTO treinamentos (item, quantidade, validade)
VALUES ('Primeiros Socorros', 25.00, '2027-12-20');

INSERT INTO epis (nome, tipo, fabricante, quantidade, data_validade, data_aquisicao, status)
VALUES ('Capacete', 'Proteção da Cabeça', '3M', 50, '2028-01-01', '2026-01-10', 'Disponível');

INSERT INTO epis (nome, tipo, fabricante, quantidade, data_validade, data_aquisicao, status)
VALUES ('Luva de Segurança', 'Proteção das Mãos', 'Volk', 100, '2027-06-30', '2026-02-15', 'Disponível');

INSERT INTO epis (nome, tipo, fabricante, quantidade, data_validade, data_aquisicao, status)
VALUES ('Óculos de Proteção', 'Proteção dos Olhos', 'Danny', 80, '2028-03-20', '2026-03-05', 'Disponível');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Cadastrar EPI', 'Cadastrar um novo EPI no sistema');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Listar EPIs', 'Exibir todos os EPIs cadastrados');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Atualizar EPI', 'Alterar informações de um EPI');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Excluir EPI', 'Remover um EPI do sistema');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Registrar Entrega', 'Registrar a entrega de um EPI ao funcionário');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Registrar Devolução', 'Registrar a devolução de um EPI');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Consultar Estoque', 'Visualizar a quantidade de EPIs disponíveis');

INSERT INTO Menu_Principal (opcao, descricao)
VALUES ('Sair', 'Encerrar o sistema');

INSERT INTO usuarios (nome, login, senha, perfil)
VALUES ('Administrador', 'admin', '123456', 'Administrador');

INSERT INTO usuarios (nome, login, senha, perfil)
VALUES ('Carlos Souza', 'carlos', '123456', 'Supervisor');

INSERT INTO usuarios (nome, login, senha, perfil)
VALUES ('Maria Oliveira', 'maria', '123456', 'Técnico');

INSERT INTO ocorrencias (titulo, descricao, data_ocorrencia, status)
VALUES ('Queda de Material', 'Material caiu durante a operação', '2026-08-01', 'Resolvida');

INSERT INTO ocorrencias (titulo, descricao, data_ocorrencia, status)
VALUES ('Falta de EPI', 'Funcionário sem capacete', '2026-08-05', 'Em andamento');

INSERT INTO ocorrencias (titulo, descricao, data_ocorrencia, status)
VALUES ('Inspeção Preventiva', 'Necessária verificação do setor', '2026-08-10', 'Pendente');

INSERT INTO inspecoes (data_inspecao, resultado, observacao)
VALUES ('2026-08-02', 'Aprovada', 'Todos os EPIs em conformidade');

INSERT INTO inspecoes (data_inspecao, resultado, observacao)
VALUES ('2026-08-09', 'Reprovada', 'Funcionários sem óculos de proteção');

INSERT INTO inspecoes (data_inspecao, resultado, observacao)
VALUES ('2026-08-15', 'Aprovada', 'Nenhuma irregularidade encontrada');