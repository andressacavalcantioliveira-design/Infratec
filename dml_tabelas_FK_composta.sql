-- ============================================================
-- ARQUIVO: dml_tabelas_fk_simples.sql
-- SCRIPT DML: Povoamento Expandido das Tabelas Base
-- Sistema: Infratec - Segurança no Trabalho (PostgreSQL/Supabase)
-- ============================================================

-- 1. LIMPEZA DOS DADOS EXISTENTES (Garante reexecução sem erros)
TRUNCATE TABLE ocorrencia, inspecao, epi, funcionario, tipo_inspecao, usuario RESTART IDENTITY CASCADE;

-- 2. TABELA: usuario
INSERT INTO usuario (nome_sistema, email, senha) VALUES
('Infratec - Segurança no Trabalho', 'admin@infratec.com.br', '$2a$12$e8K3z01R2n3X4y5Z6a7b8uC9d0e1f2g3h4i5j6k7l8m9n0o1p2q3r'),
('Infratec - Segurança no Trabalho', 'tecnico.seg@infratec.com.br', '$2a$12$a1B2c3D4e5F6g7H8i9J0kL1m2N3o4P5q6R7s8T9u0V1w2X3y4Z5a6'),
('Infratec - Segurança no Trabalho', 'gerente.op@infratec.com.br', '$2a$12$z9Y8x7W6v5U4t3S2r1Q0pO9n8M7l6K5j4I3h2G1f0E9d8C7b6A5s4'),
('Infratec - Segurança no Trabalho', 'auditor.sst@infratec.com.br', '$2a$12$x1Y2z3A4b5C6d7E8f9G0h1I2j3K4l5M6n7O8p9Q0r1S2t3U4v5W6'),
('Infratec - Segurança no Trabalho', 'coordenador.manut@infratec.com.br', '$2a$12$m1N2o3P4q5R6s7T8u9V0w1X2y3Z4a5B6c7D8e9F0g1H2i3J4k5L6');

-- 3. TABELA: tipo_inspecao
INSERT INTO tipo_inspecao (descricao) VALUES
('Inspeção Geral de Rotina'),
('Auditoria de Uso de EPIs'),
('Vistoria de Equipamentos Contra Incêndio'),
('Análise de Risco em Trabalho em Altura'),
('Inspeção Pré-Operacional de Maquinário'),
('Vistoria de Ergonomia e Postos de Trabalho'),
('Auditoria Ambiental e Resíduos Perigosos');

-- 4. TABELA: funcionario
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario) VALUES
(1001, 'Carlos Eduardo Silva', 'Manutenção Industrial', 'Técnico de Manutenção', NULL),
(1002, 'Ana Paula Santos', 'Segurança do Trabalho', 'Técnica de Segurança', 2),
(1003, 'Roberto Oliveira', 'Produção', 'Operador de Máquinas', NULL),
(1004, 'Mariana Costa', 'Operações', 'Gerente de Operações', 3),
(1005, 'Lucas Pereira', 'Logística', 'Auxiliar de Almoxarifado', NULL),
(1006, 'Fernanda Lima', 'Segurança do Trabalho', 'Engenheira de Segurança', 4),
(1007, 'Gabriel Souza', 'Manutenção Industrial', 'Eletricista de Manutenção', 5),
(1008, 'Beatriz Rocha', 'Produção', 'Inspetora de Qualidade', NULL),
(1009, 'Rodrigo Alves', 'Logística', 'Operador de Empilhadeira', NULL),
(1010, 'Juliana Mendes', 'Recursos Humanos', 'Analista de RH', NULL);

-- 5. TABELA: epi
INSERT INTO epi (matricula, epi_nome, data_entrega_epi, validade_epi, status_epi) VALUES
(1001, 'Capacete de Segurança Aba Frontal com Carneira', '2026-01-10', '2027-01-10', 'Ativo'),
(1001, 'Óculos de Proteção Incolor Policarbonato', '2026-02-15', '2026-08-15', 'Vencido'),
(1003, 'Protetor Auditivo Tipo Concha 22dB', '2026-03-01', '2027-03-01', 'Ativo'),
(1004, 'Luva de Proteção Mecânica Nitrílica', '2026-04-10', '2026-10-10', 'Substituído'),
(1005, 'Calçado de Segurança com Biqueira de Aço', '2026-05-20', '2027-05-20', 'Ativo'),
(1007, 'Luva Isolante de Borracha para Alta Tensão', '2026-01-05', '2026-07-05', 'Vencido'),
(1007, 'Cinto de Segurança Tipo Paraquedista', '2026-02-01', '2027-02-01', 'Ativo'),
(1008, 'Protetor Auditivo de Inserção Moldável', '2026-06-12', '2026-12-12', 'Ativo'),
(1009, 'Capacete de Segurança com Jugular', '2026-03-15', '2027-03-15', 'Ativo'),
(1009, 'Luva de Vaqueta para Carga e Descarga', '2026-04-01', '2026-08-01', 'Substituído');

-- 6. TABELA: inspecao
INSERT INTO inspecao (id_tipo_inspecao, matricula_responsavel, data_inspecao, resultado_inspecao) VALUES
(1, 1002, '2026-09-10 08:30:00', 'Conforme - Setor de produção sem irregularidades visíveis.'),
(2, 1002, '2026-09-15 14:00:00', 'Não Conforme - Colaboradores operando sem óculos de proteção.'),
(3, 1002, '2026-09-20 10:15:00', 'Conforme - Extintores recarregados e vias de emergência desobstruídas.'),
(4, 1006, '2026-09-21 09:00:00', 'Não Conforme - Falta de ponto de ancoragem certificado no telhado.'),
(5, 1006, '2026-09-22 11:30:00', 'Conforme - Prensa hidráulica operando com sensor de barreira ativo.'),
(6, 1002, '2026-09-23 15:45:00', 'Conforme - Ajustes nas cadeiras da linha de montagem concluídos.'),
(7, 1006, '2026-09-24 16:20:00', 'Não Conforme - Armazenamento inadequado de solventes na manutenção.');

-- 7. TABELA: ocorrencia
INSERT INTO ocorrencia (matricula, id_inspecao, tipo_ocorrencias, gravidade, data_ocorrencia) VALUES
(1001, 2, 'Uso inadequado de EPI', 'Leve', '2026-09-15'),
(1003, NULL, 'Quase acidente durante operação de prensa', 'Média', '2026-09-18'),
(1001, NULL, 'Queda de mesmo nível em área molhada', 'Grave', '2026-09-22'),
(1007, 4, 'Trabalho em altura sem cinto de segurança', 'Grave', '2026-09-21'),
(1009, NULL, 'Colisão leve de empilhadeira em prateleira', 'Média', '2026-09-23'),
(1005, 7, 'Descarte incorreto de resíduo oleoso', 'Leve', '2026-09-24');
