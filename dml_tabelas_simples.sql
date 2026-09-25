-- ============================================================
-- ARQUIVO: dml_tabelas_simples.sql
-- SCRIPT DML: Povoamento Inicial das Tabelas Base
-- Sistema: Infratec - Segurança no Trabalho (PostgreSQL/Supabase)
-- ============================================================

-- 1. LIMPEZA DOS DADOS EXISTENTES (Evita duplicidade ao reexecutar)
DELETE FROM ocorrencia;
DELETE FROM inspecao;
DELETE FROM funcionario;
DELETE FROM tipo_inspecao;
DELETE FROM usuario;

-- 2. INSERÇÃO DE USUÁRIOS
INSERT INTO usuario (nome_sistema, email, senha) VALUES
('Infratec - Segurança no Trabalho', 'admin@infratec.com.br', '$2a$12$e8K3z01R2n3X4y5Z6a7b8uC9d0e1f2g3h4i5j6k7l8m9n0o1p2q3r'),
('Infratec - Segurança no Trabalho', 'tecnico.seg@infratec.com.br', '$2a$12$a1B2c3D4e5F6g7H8i9J0kL1m2N3o4P5q6R7s8T9u0V1w2X3y4Z5a6'),
('Infratec - Segurança no Trabalho', 'gerente.op@infratec.com.br', '$2a$12$z9Y8x7W6v5U4t3S2r1Q0pO9n8M7l6K5j4I3h2G1f0E9d8C7b6A5s4');

-- 3. INSERÇÃO DE TIPOS DE INSPEÇÃO
INSERT INTO tipo_inspecao (descricao) VALUES
('Inspeção Geral de Rotina'),
('Auditoria de EPIs'),
('Vistoria de Equipamentos contra Incêndio'),
('Análise de Risco em Trabalho em Altura');

-- 4. INSERÇÃO DE FUNCIONÁRIOS
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario) VALUES
(1001, 'Carlos Eduardo Silva', 'Manutenção Industrial', 'Técnico de Manutenção', NULL),
(1002, 'Ana Paula Santos', 'Segurança do Trabalho', 'Técnica de Segurança', 2),
(1003, 'Roberto Oliveira', 'Produção', 'Operador de Máquinas', NULL),
(1004, 'Mariana Costa', 'Operações', 'Gerente de Operações', 3);

-- 5. INSERÇÃO DE INSPEÇÕES
INSERT INTO inspecao (id_tipo_inspecao, matricula_responsavel, data_inspecao, resultado_inspecao) VALUES
(1, 1002, '2026-09-10 08:30:00', 'Conforme - Sem irregularidades detectadas no setor de produção.'),
(2, 1002, '2026-09-15 14:00:00', 'Não Conforme - Identificados colaboradores trabalhando com EPI vencido.'),
(3, 1002, '2026-09-20 10:15:00', 'Conforme - Extintores com carga atualizada e desobstruídos.');

-- 6. INSERÇÃO DE OCORRÊNCIAS
INSERT INTO ocorrencia (matricula, id_inspecao, tipo_ocorrencias, gravidade, data_ocorrencia) VALUES
(1001, 2, 'Uso inadequado de EPI', 'Leve', '2026-09-15'),
(1003, NULL, 'Quase acidente com maquinário', 'Média', '2026-09-18'),
(1001, NULL, 'Queda de mesmo nível', 'Grave', '2026-09-22');
