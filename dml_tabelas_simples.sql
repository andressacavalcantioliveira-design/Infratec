
-- 1. TABELA: usuario
INSERT INTO usuario (email, senha)
VALUES 
    ('admin@infratec.com', '123456'),
    ('carlos@infratec.com', '123456'),
    ('maria@infratec.com', '123456')
ON CONFLICT (email) DO NOTHING;

-- 2. TABELA: epi
INSERT INTO epi (epi_nome)
VALUES 
    ('Capacete de Segurança'),
    ('Luva de Segurança'),
    ('Óculos de Proteção');

-- 3. TABELA: tipo_inspecao
INSERT INTO tipo_inspecao (descricao)
VALUES 
    ('Inspeção de Rotina'),
    ('Inspeção Preventiva');

-- 4. TABELA: funcionario (Busca a FK de usuario via subconsulta de email)
INSERT INTO funcionario (matricula, nome_funcionario, setor, cargo, id_usuario)
VALUES 
    (1001, 'João Silva', 'Produção', 'Operador', (SELECT id_usuario FROM usuario WHERE email = 'admin@infratec.com' LIMIT 1)),
    (1002, 'Maria Oliveira', 'Segurança do Trabalho', 'Técnica de Segurança', (SELECT id_usuario FROM usuario WHERE email = 'maria@infratec.com' LIMIT 1)),
    (1003, 'Carlos Henrique', 'Manutenção', 'Técnico de Manutenção', (SELECT id_usuario FROM usuario WHERE email = 'carlos@infratec.com' LIMIT 1))
ON CONFLICT (matricula) DO NOTHING;

-- 5. TABELA: inspecao (Busca a FK de tipo_inspecao via subconsulta de descricao)
INSERT INTO inspecao (id_tipo_inspecao, matricula_responsavel, data_inspecao, resultado_inspecao)
VALUES 
    ((SELECT id_tipo_inspecao FROM tipo_inspecao WHERE descricao = 'Inspeção de Rotina' LIMIT 1), 1002, '2026-08-02 09:00:00', 'Aprovada - Todos os EPIs em conformidade'),
    ((SELECT id_tipo_inspecao FROM tipo_inspecao WHERE descricao = 'Inspeção Preventiva' LIMIT 1), 1002, '2026-08-09 14:00:00', 'Reprovada - Funcionários sem óculos de proteção'),
    ((SELECT id_tipo_inspecao FROM tipo_inspecao WHERE descricao = 'Inspeção de Rotina' LIMIT 1), 1002, '2026-08-15 11:00:00', 'Aprovada - Nenhuma irregularidade encontrada');

-- 6. TABELA: ocorrencia (Associa à matricula do funcionário e primeira inspeção disponível)
INSERT INTO ocorrencia (matricula, id_inspecao, tipo_ocorrencias, gravidade, data_ocorrencia)
VALUES 
    (1001, (SELECT id_inspecao FROM inspecao LIMIT 1), 'Queda de Material', 'Média', '2026-08-01'),
    (1003, (SELECT id_inspecao FROM inspecao LIMIT 1 OFFSET 1), 'Falta de EPI', 'Grave', '2026-08-05'),
    (1001, (SELECT id_inspecao FROM inspecao LIMIT 1 OFFSET 2), 'Inspeção Preventiva', 'Leve', '2026-08-10');
