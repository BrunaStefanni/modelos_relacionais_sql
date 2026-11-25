
CREATE DATABASE XPTO;

USE XPTO;

-- =========================
--  INSTITUICAO
-- =========================

CREATE TABLE Instituicao (
    id_instituicao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL
);

-- =========================
--  TIPO DE EVENTO
-- =========================

CREATE TABLE Tipo_Evento (
    id_tipo_evento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL
);

-- =========================
--  EVENTO
-- =========================

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    tema VARCHAR(200) NOT NULL,
    duracao INT NOT NULL,
    id_instituicao INT NOT NULL,
    id_tipo_evento INT NOT NULL,

    FOREIGN KEY (id_instituicao) REFERENCES Instituicao(id_instituicao),
    FOREIGN KEY (id_tipo_evento) REFERENCES Tipo_Evento(id_tipo_evento)
);

-- =========================
--  CONFERENCISTA
-- =========================

CREATE TABLE Conferencista (
    BI VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200) NOT NULL,
    habilitacoes VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

-- =========================
--  FUNCIONARIO
-- =========================

CREATE TABLE Funcionario (
    numero_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    categoria VARCHAR(100) NOT NULL
);

-- =========================
--  COLABORADOR EXTERNO
-- =========================

CREATE TABLE Colaborador_Externo (
    id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    morada VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- =========================
--  FORNECEDOR
-- =========================

CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(150) NOT NULL,
    morada VARCHAR(200) NOT NULL,
    pais_origem VARCHAR(100) NOT NULL
);

-- =========================
--  TIPO DE ARTIGO
-- =========================

CREATE TABLE Tipo_Artigo (
    cod_artigo INT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- =========================
--  ARTIGO
-- =========================

CREATE TABLE Artigo (
    id_artigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    peso FLOAT NOT NULL,
    altura FLOAT NOT NULL,
    largura FLOAT NOT NULL,
    id_tipo_artigo INT NOT NULL,
    id_fornecedor INT NOT NULL,

    FOREIGN KEY (id_tipo_artigo) REFERENCES Tipo_Artigo(cod_artigo),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- =========================
--  EVENTO - ARTIGO
-- Relacionamento N:M
-- =========================

CREATE TABLE Evento_Artigo (
    id_evento INT NOT NULL,
    id_artigo INT NOT NULL,

    PRIMARY KEY (id_evento, id_artigo),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_artigo) REFERENCES Artigo(id_artigo)
);

-- =========================
--  EVENTO - FUNCIONARIO
-- Relacionamento N:M
-- =========================

CREATE TABLE Evento_Funcionario (
    id_evento INT NOT NULL,
    numero_funcionario INT NOT NULL,

    PRIMARY KEY (id_evento, numero_funcionario),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (numero_funcionario) REFERENCES Funcionario(numero_funcionario)
);

-- =========================
--  EVENTO - COLABORADOR
-- Relacionamento N:M
-- =========================

CREATE TABLE Evento_Colaborador (
    id_evento INT NOT NULL,
    id_colaborador INT NOT NULL,

    PRIMARY KEY (id_evento, id_colaborador),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_colaborador) REFERENCES Colaborador_Externo(id_colaborador)
);

-- =========================
--  EVENTO - CONFERENCISTA
-- Relacionamento N:M
-- =========================

CREATE TABLE Evento_Conferencista (
    id_evento INT NOT NULL,
    BI VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_evento, BI),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (BI) REFERENCES Conferencista(BI)
);
