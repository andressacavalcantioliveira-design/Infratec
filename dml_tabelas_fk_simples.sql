-- DML - Inserção de dados

-- Usuários
INSERT INTO usuarios (nome, login, senha, perfil)
VALUES
('Administrador', 'admin', '123456', 'Administrador'),
('Maria Souza', 'maria', 'maria123', 'Técnico');

-- Funcionários
INSERT INTO funcionarios (nome, cpf, cargo, setor, telefone)
VALUES
('João Silva', '123.456.789-00', 'Operador', 'Produção', '(44)99999-1111'),
('Ana Costa', '987.654.321-00', 'Soldadora', 'Manutenção', '(44)99999-2222');

-- EPIs
INSERT INTO epis (nome, tipo, ca, quantidade, validade)
VALUES
('Capacete', 'Proteção da Cabeça', 'CA12345', 20, '2028-12-31'),
('Luva de Raspa', 'Proteção das Mãos', 'CA54321', 50, '2027-08-15');

-- Treinamentos
INSERT INTO treinamentos (id_funcionario, nome_treinamento, data_treinamento, validade)
VALUES
(1, 'Uso correto de EPIs', '2026-08-01', '2027-08-01'),
(2, 'Segurança no Trabalho', '2026-08-02', '2027-08-02');

-- Inspeções
INSERT INTO inspecoes (id_epi, id_funcionario, data_inspecao, resultado, observacao)
VALUES
(1, 1, '2026-08-05', 'Aprovado', 'Capacete em boas condições'),
(2, 2, '2026-08-05', 'Reprovado', 'Luva rasgada');

-- Ocorrências
INSERT INTO ocorrencias (id_inspecao, descricao, data_ocorrencia, status)
VALUES
(1, 'Inspeção realizada sem irregularidades', '2026-08-05', 'Concluída'),
(2, 'EPI substituído devido a danos', '2026-08-05', 'Resolvida');