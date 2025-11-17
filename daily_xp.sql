CREATE SCHEMA IF NOT EXISTS daily_xp;
SET search_path TO daily_xp;


CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario          SERIAL PRIMARY KEY,
    nome                VARCHAR(100) NOT NULL,
    email               VARCHAR(120) UNIQUE NOT NULL,
    senha_hash          VARCHAR(255) NOT NULL,
    token_login         VARCHAR(255),
    data_criacao        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS categorias (
    id_categoria        SERIAL PRIMARY KEY,
    nome                VARCHAR(60) NOT NULL,
    descricao           TEXT
);

INSERT INTO categorias (nome, descricao) VALUES
('Estudos', 'Tarefas relacionadas a estudos'),
('Saúde', 'Tarefas de bem-estar e saúde'),
('Trabalho', 'Tarefas relacionadas ao ambiente profissional'),
('Pessoal', 'Rotinas e tarefas pessoais')
ON CONFLICT DO NOTHING;


CREATE TABLE IF NOT EXISTS tarefas (
    id_tarefa           SERIAL PRIMARY KEY,
    id_usuario          INT NOT NULL,
    id_categoria        INT,
    titulo              VARCHAR(120) NOT NULL,
    descricao           TEXT,
    data_criacao        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    data_prevista       DATE,
    hora_prevista       TIME,
    data_conclusao      TIMESTAMP NULL,
    
    status              VARCHAR(20) NOT NULL DEFAULT 'pendente',
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

CREATE TABLE IF NOT EXISTS historico_tarefas (
    id_historico        SERIAL PRIMARY KEY,
    id_tarefa           INT NOT NULL,
    status_anterior     VARCHAR(20) NOT NULL,
    status_novo         VARCHAR(20) NOT NULL,
    data_mudanca        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacao          TEXT,
    
    FOREIGN KEY (id_tarefa) REFERENCES tarefas (id_tarefa)
);
