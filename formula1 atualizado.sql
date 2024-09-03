-- 1. Tabela de Temporada
CREATE TABLE temporada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ano INT NOT NULL
);

-- 2. Tabela de Equipes
CREATE TABLE equipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    carro VARCHAR(255),
    pontos FLOAT DEFAULT 0
);

-- 3. Tabela de Pilotos
CREATE TABLE pilotos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    equipe_id INT,
    nacionalidade VARCHAR(100),
    pontos FLOAT DEFAULT 0,
    FOREIGN KEY (equipe_id) REFERENCES equipes(id) ON DELETE SET NULL
);

-- 4. Tabela de Carros
CREATE TABLE carros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES equipes(id) ON DELETE SET NULL
);

-- 5. Tabela de Circuito (anteriormente chamada de Corridas)
CREATE TABLE corridas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data DATE NOT NULL
);

-- 6. Tabela Tempo X Equipe
CREATE TABLE tempo_equipe (
    id_tempo INT,
    id_equipe INT,
    pontos FLOAT,
    PRIMARY KEY (id_tempo, id_equipe),
    FOREIGN KEY (id_tempo) REFERENCES temporada(id) ON DELETE CASCADE,
    FOREIGN KEY (id_equipe) REFERENCES equipes(id) ON DELETE CASCADE
);

-- 7. Tabela Tempo X Piloto (antiga Tabela de Pontuação)
CREATE TABLE tempo_piloto (
    id_tempo INT,
    id_piloto INT,
    id_equipe INT,
    pontos FLOAT,
    PRIMARY KEY (id_tempo, id_piloto, id_equipe),
    FOREIGN KEY (id_tempo) REFERENCES temporada(id) ON DELETE CASCADE,
    FOREIGN KEY (id_piloto) REFERENCES pilotos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_equipe) REFERENCES equipes(id) ON DELETE CASCADE
);

-- 8. Tabela Tempo X Circuito (antiga Tabela de Corridas)
CREATE TABLE tempo_circuito (
    id_tempo INT,
    id_circuito INT,
    data_corrida DATE NOT NULL,
    prim_colocado INT,
    seg_colocado INT,
    ter_colocado INT,
    PRIMARY KEY (id_tempo, id_circuito),
    FOREIGN KEY (id_tempo) REFERENCES temporada(id) ON DELETE CASCADE,
    FOREIGN KEY (id_circuito) REFERENCES corridas(id) ON DELETE CASCADE,
    FOREIGN KEY (prim_colocado) REFERENCES pilotos(id) ON DELETE SET NULL,
    FOREIGN KEY (seg_colocado) REFERENCES pilotos(id) ON DELETE SET NULL,
    FOREIGN KEY (ter_colocado) REFERENCES pilotos(id) ON DELETE SET NULL
);
