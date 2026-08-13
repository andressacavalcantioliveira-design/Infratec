ddl_tabelas_simples
CREATE DATABASE SistemaEPI;
USE SistemaEPI;
--nenhuma destas tabelas tem FK - a ordem entre elas nao importa.

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(10) NOT NULL
);

CREATE TABLE treinamentos (
    id SERIAL PRIMARY KEY, 
    Item VARCHAR(100) NOT NULL,
    quantidade NUMERIC(8,2) NOT NULL,
    validade DATE NOT NULL 
);

CREATE TABLE EPIS (
    id_epi INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    fabricante VARCHAR(100),
    quantidade INT NOT NULL,
    data_validade DATE,
    data_aquisicao DATE,
    status VARCHAR(20)
);

CREATE TABLE Menu_Principal()
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    opcao VARCHAR (100) NOT NULL,
    descricao VARCHAR(255)

INSERT INTO Menu_Principal (opcao, descricao) VALUES
('Cadastrar EPI', 'Cadastrar um novo EPI no sistema'),
('Listar EPIs', 'Exibir todos os EPIs cadastrados'),
('Atualizar EPI', 'Alterar informacoes de um EPI'),
('Excluir EPI', 'Remover um EPI do sistema'),
('Registrar entrega', 'Registrar a entrega de um EPI ao funcionario'),
('Registar devolucao', 'Registar a devolucao de um EPI'),
('Consultar estoque', 'Visualizar a quantidade de EPIs disponiveis'),
('Sair', 'Encerrar  o sistema';
)



-- Tabela de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(30) NOT NULL
);

-- Tabela de Ocorencias
CREATE TABLE Ocorrencias (
    id_ocorrencia INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    data_ocorrencia DATE NOT NULL,
    status VARCHAR(30)
);

-- Tabela de Inspecoes
CREATE TABLE Inspecoes (
    id_inspecao INT AUTO_INCREMENT PRIMARY KEY,
    data_inspecao DATE NOT NULL,
    resultado VARCHAR(50),
    observacao VARCHAR(255)
);