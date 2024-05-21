-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;

-- Uso do banco de dados criado
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela tb_personagens
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Especializado em combate corpo a corpo com alta resistência.'),
('Mago', 'Utiliza magia para causar danos massivos à distância.'),
('Arqueiro', 'Ataques de longo alcance com precisão e agilidade.'),
('Assassino', 'Especializado em furtividade e ataques rápidos.'),
('Cavaleiro', 'Combate equilibrado com boa defesa e ataque moderado.');

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Arthur', 2200, 1500, 10, 1),
('Merlin', 1800, 800, 15, 2),
('Legolas', 2500, 1200, 12, 3),
('Shade', 1900, 1100, 14, 4),
('Galahad', 2000, 2000, 11, 5),
('Cassandra', 2400, 1000, 13, 3),
('Thor', 2300, 1600, 16, 1),
('Morgana', 1700, 900, 14, 2);

-- SELECT para retornar todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT para retornar todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra 'C' no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT p.*, c.nome AS classe_nome, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens da classe 'Arqueiro'
SELECT p.*, c.nome AS classe_nome, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';
