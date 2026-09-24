-- ============================================================
-- ARQUIVO: dml_tabelas_fk_simples.sql
-- SCRIPT DML: Povoamento das Tabelas Base e Com FK Simples
-- Sistema: Infratec - Segurança no Trabalho (PostgreSQL/Supabase)
-- ============================================================
-- 1. TABELAS DE DOMÍNIO BASE

-- Inserção na tabela: usuario
INSERT INTO usuario (id_usuario, email, senha)
VALUES
(1, 'admin@infratec.com', '123456'),
(2, 'maria@infratec.com', 'maria123')
ON CONFLICT (id_usuario) DO NOTHING;

-- Inserção na tabela: epi
INSERT INTO epi (id_epi, epi_nome)
VALUES
(1, 'Capacete de Segurança com Jugular'),
(2, 'Luva de Raspa para Proteção')
ON CONFLICT (id_epi) DO NOTHING;

-- Inserção na tabela: tipo_inspecao
INSERT INTO tipo_inspecao (id_tipo_inspecao, descricao)
VALUES
(1, 'Inspeção de Rotina de EPI'),
(2, 'Inspeção Especial de Equipamentos')
ON CONFLICT (id_tipo_inspecao) DO NOTHING;

-- 2. TABELAS DEPENDENTES (FK SIMPLES)

-- Inserção na tabela: funcionario
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario)
VALUES
(1001, 'João Silva', 'Produção', 'Operador', 1),
(1002, 'Ana Costa', 'Manutenção', 'Soldadora', 2)
ON CONFLICT (matricula) DO NOTHING;

-- Inserção na tabela: inspecao
INSERT INTO inspecao (id_tipo_inspecao, matricula_responsavel, data_inspecao, resultado_inspecao)
VALUES
(1, 1001, '2026-08-05 10:00:00', 'Aprovado - Equipamento em boas condições'),
(2, 1002, '2026-08-05 14:30:00', 'Reprovado - Equipamento danificado');

-- Inserção na tabela: ocorrencia
INSERT INTO ocorrencia (matricula, id_inspecao, tipo_ocorrencias, gravidade, data_ocorrencia)
VALUES
(1001, 1, 'Inspeção Periódica', 'Leve', '2026-08-05'),
(1002, 2, 'Dano em Equipamento', 'Média', '2026-08-05');
