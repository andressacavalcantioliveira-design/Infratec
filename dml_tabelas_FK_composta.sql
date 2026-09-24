-- ============================================================
-- ARQUIVO: dml_tabelas_FK_composta.sql
-- Sistema: Infratec - Segurança no Trabalho (PostgreSQL/Supabase)
-- ============================================================
-- 1. REGISTOS BASE
INSERT INTO usuario (id_usuario, email, senha)VALUES(1, 'carlos.silva@infratec.com', '$2a$12$e8Kz...hash_exemplo')ON CONFLICT (id_usuario) DO NOTHING;
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario)
VALUES
(1001, 'Carlos Silva', 'Manutenção Operacional', 'Técnico de Manutenção', 1),
(1002, 'Ana Souza', 'Inspeção de Campo', 'Técnica de Segurança', NULL)
ON CONFLICT (matricula) DO NOTHING;
INSERT INTO epi (id_epi, epi_nome)
VALUES
(1, 'Capacete de Segurança com Jugular'),
(2, 'Óculos de Proteção Incolor'),
(3, 'Luva Térmica de Proteção')
ON CONFLICT (id_epi) DO NOTHING;
-- 2. TABELAS ASSOCIATIVAS

INSERT INTO funcionario_epi (
matricula,
id_epi,
data_entrega_epi,
validade_epi,
status_epi
  ) VALUES
(1001, 1, '2026-01-15', '2027-01-15', 'Ativo'),
(1001, 2, '2026-01-15', '2026-07-15', 'Vencido'),
(1002, 3, '2026-02-10', '2027-02-10', 'Ativo'),
(1002, 1, '2025-05-20', '2026-05-20', 'Substituído');
INSERT INTO treinamento (
matricula,
data_treinamento,
situacao_treinamento,
aviso_treinamento
) VALUES
(1001, '2026-03-10', 'Concluído', 'Treinamento de integração realizado com sucesso.'),
(1002, '2026-04-05', 'Pendente', 'Aguardando confirmação de presença na turma.'),
(1001, '2026-05-12', 'Cancelado', 'Sessão reagendada devido a demandas operacionais.');
