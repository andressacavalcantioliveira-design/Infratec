-- ============================================================
-- ARQUIVO: dml_tabelas_fk_simples.sql
-- SCRIPT DML: Povoamento das Tabelas Base e FKs Simples
-- Sistema: Infratec - Segurança no Trabalho (PostgreSQL/Supabase)
-- ============================================================

-- 1. LIMPEZA DOS DADOS EXISTENTES
TRUNCATE TABLE ocorrencia, inspecao, epi, funcionario, tipo_inspecao, usuario RESTART IDENTITY CASCADE;

-- 2. TABELAS DE DOMÍNIO E DEPENDENTES BASE

-- 2.1. Tabela: usuario
INSERT INTO usuario (nome_sistema, email, senha) VALUES
('Infratec - Segurança no Trabalho', 'admin@infratec.com.br', '$2a$12$e8K3z01R2n3X4y5Z6a7b8uC9d0e1f2g3h4i5j6k7l8m9n0o1p2q3r'),
('Infratec - Segurança no Trabalho', 'tecnico.seg@infratec.com.br', '$2a$12$a1B2c3D4e5F6g7H8i9J0kL1m2N3o4P5q6R7s8T9u0V1w2X3y4Z5a6'),
('Infratec - Segurança no Trabalho', 'gerente.op@infratec.com.br', '$2a$12$z9Y8x7W6v5U4t3S2r1Q0pO9n8M7l6K5j4I3h2G1f0E9d8C7b6A5s4');

-- 2.2. Tabela: tipo_inspecao
INSERT INTO tipo_inspecao (descricao) VALUES
('Inspeção Geral de Rotina'),
('Auditoria de Uso de EPIs'),
('Vistoria de Equipamentos Contra Incêndio'),
('Análise de Risco em Trabalho em Altura'),
('Inspeção Pré-Operacional de Maquinário');

-- 2.3. Tabela: funcionario
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario) VALUES
(1001, 'Carlos Eduardo Silva', 'Manutenção Industrial', 'Técnico de Manutenção', NULL),
(1002, 'Ana Paula Santos', 'Segurança do Trabalho', 'Técnica de Segurança', 2),
(1003, 'Roberto Oliveira', 'Produção', 'Operador de Máquinas', NULL),
(1004, 'Mariana Costa', 'Operações', 'Gerente de Operações', 3),
(1005, 'Lucas Pereira', 'Logística', 'Auxiliar de Almoxarifado', NULL);

-- 2.4. Tabela: epi (Ajustada com os campos obrigatórios NOT NULL da tabela)
INSERT INTO epi (matricula, epi_nome, data_entrega_epi, validade_epi, status_epi) VALUES
(1001, 'Capacete de Segurança Aba Frontal com Carneira', '2026-01-10', '2027-01-10', 'Ativo'),
(1001, 'Óculos de Proteção Incolor Policarbonato', '2026-02-15', '2026-08-15', 'Vencido'),
(1003, 'Protetor Auditivo Tipo Concha 22dB', '2026-03-01', '2027-03-01', 'Ativo'),
(1004, 'Luva de Proteção Mecânica Nitrílica', '2026-04-10', '2026-10-10', 'Substituído'),
(1005, 'Calçado de Segurança com Biqueira de Aço', '2026-05-20', '2027-05-20', 'Ativo');

-- 3. TABELAS DEPENDENTES DE INSPEÇÃO E OCORRÊNCIA

-- 3.1. Tabela: inspecao
INSERT INTO inspecao (id_tipo_inspecao, matricula_responsavel, data_inspecao, resultado_inspecao) VALUES
(1, 1002, '2026-09-10 08:30:00', 'Conforme - Setor de produção sem irregularidades visíveis.'),
(2, 1002, '2026-09-15 14:00:00', 'Não Conforme - Colaboradores operando sem óculos de proteção.'),
(3, 1002, '2026-09-20 10:15:00', 'Conforme - Extintores recarregados e vias de emergência desobstruídas.');

-- 3.2. Tabela: ocorrencia
INSERT INTO ocorrencia (matricula, id_inspecao, tipo_ocorrencias, gravidade, data_ocorrencia) VALUES
(1001, 2, 'Uso inadequado de EPI', 'Leve', '2026-09-15'),
(1003, NULL, 'Quase acidente durante operação de prensa', 'Média', '2026-09-18'),
(1001, NULL, 'Queda de mesmo nível em área molhada', 'Grave', '2026-09-22');
