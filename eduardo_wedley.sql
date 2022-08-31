CREATE DATABASE "eduardo_wedley";
USE "eduardo_wedley";

CREATE TABLE tipo_usuario ( 
cod_tipuser int NOT NULL AUTO_INCREMENT, 
desc_tipuser varchar(250), 
PRIMARY KEY (cod_tipuser) );

CREATE TABLE midia ( 
titulo_midia varchar(100) not null, 
caminho_midia varchar(50) not null, 
cod_midia int not null, 
cod_postagem int not null, 
PRIMARY KEY (cod_midia) 
);

CREATE TABLE ong ( 
email_ong varchar(100) not null UNIQUE, 
telefone_ong char(14) not null, nome_ong varchar(100) not null, 
cod_ong int not null, 
PRIMARY KEY (cod_ong) 
);

CREATE TABLE postagem ( 
titulo_postagem varchar(100) not null, 
categoria varchar(100), 
cod_postagem int not null PRIMARY KEY AUTO_INCREMENT, 
texto_postagem varchar(1000), 
cod_usuario int unique not null, 
cod_ong int unique not null, FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong) 
);

CREATE TABLE voluntario ( 
cod_ong int unique not null, 
cod_usuario int unique not null, 
dt_voluntario DATE, 
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong) 
);

CREATE TABLE doacao ( 
cod_ong int unique not null, 
cod_usuario int unique not null, 
dt_doacao date, 
valor_doacao decimal(10,2), 
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong) 
);

CREATE TABLE comenta (
cod_postagem int unique not null,
cod_usuario int unique not null,
dathora_coment timestamp,
texto_coment varchar(250),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem)
);

CREATE TABLE curtir (
cod_postagem int unique not null,
cod_usuario int unique not null,
dathora_curtir timestamp,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem)
);

CREATE TABLE usuario (
idade int not null,
nome varchar(100) not null,
email varchar(250) unique not null,
cod_usuario int not null PRIMARY KEY,
telefone varchar(15) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE postagem ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE doacao ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE comenta ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE curtir ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);

INSERT INTO tipo_usuario(cod_tipuser, desc_tipuser)
VALUES
(1, 'Freemium'),
(2, 'Premium');

INSERT INTO usuario(idade, nome, email, cod_usuario, telefone, cod_tipuser)
VALUES
(18, "Carlos", "carlos@gmail.com", 1, "+559960678771", 1),
(19, "Joana", "joana@gmail.com", 2, "+559960678772", 2),
(21, "Cleiton", "Cleiton@gmail.com", 3, "+559989678771", 1),
(24, "Manuela", "manu@gmail.com", 4, "+558860678771", 2),
(26, "João", "joao@gmail.com", 5, "+555560678771", 1),
(20, "Arthur", "tui@gmail.com", 6, "+558860678331", 1),
(31, "Lígia", "ligia@gmail.com", 7, "+558860998771", 2),
(29, "Cléber", "cleber@gmail.com", 8, "+558860600761", 1),
(27, "Kathiane", "kathiane@gmail.com", 9, "+558860600761", 2),
(23, "Eron", "eron@gmail.com", 10, "+558860611761", 1);

INSERT INTO ong(email_ong, telefone_ong, nome_ong, cod_ong)
VALUES
('mano1@gmail.com', "+559960678771", "Projeto Golfinho", 1),
('mano2@gmail.com', "+559960655771", "Projeto Lontra", 2),
('mano3@gmail.com', "+559000678716", "Projeto Tamar", 3),
('mano4@gmail.com', "+559960678901", "Projeto Golfinho", 4),
('mano5@gmail.com', "+559440618771", "Projeto Tigre Branco", 5),
('mano6@gmail.com', "+559960612771", "Projeto Panda Vermelho", 6),
('mano7@gmail.com', "+559960678771", "Projeto Leão", 7),
('mano8@gmail.com', "+5599606787081", "Projeto Baleia Jubarte", 8),
('mano9@gmail.com', "+559850678771", "Projeto Baleia Azul", 9),
('mano10@gmail.com', "+559100678101", "Projeto Golfinho", 10);

INSERT INTO voluntario (cod_ong,cod_usuario, dt_voluntario) 
VALUES

(1, 1, '2022-12-18'),
(2, 2, '2022-12-18'),
(3, 3, '2022-12-18'),
(4, 4, '2022-12-18'),
(5, 5, '2022-12-18'),
(6, 6, '2022-12-18'),
(7, 7, '2022-12-18'),
(8, 8, '2022-12-18'),
(9, 9, '2022-12-18'),
(10, 10, '2022-12-18');

INSERT INTO postagem(titulo_postagem, categoria, cod_postagem, texto_postagem, cod_usuario, cod_ong)
VALUES
('Tudo bem', 'Relevantes', 1, 'Não sei como fazer', 3, 8),
('Nada bem', 'Notícias', 2, 'Tudo indo errado', 6, 10),
('Como escreve?', 'Questões', 3, 'Estou perdido', 7, 1),
('Nunca gostei mesmo', 'Divertido', 4, 'Odeio isso', 4, 2),
('Que daora', 'Opinião', 5, 'Sim, verdade', 8, 3),
('NÃO ACREDITO NISSO!', 'Relevantes', 6, 'Chocado...', 1, 4),
('Olá amigo!', 'Novo', 7, 'Perguntei?', 2, 5),
('Cachorro é melhor', 'Divertido', 8, 'Acho que não', 9, 6),
('Tá bem triste', 'Notícias', 9, 'Caiu mesmo?', 10, 7),
('Rindo', 'Novo', 10, 'O macaco subiu pra pegar banana', 5, 9);

INSERT INTO comenta
VALUES 
(1, 10, '2022-05-30 12:23:07', "Salve salve"),
(2, 2, '2022-05-30 12:23:07', "Salve salve"),
(3, 9, '2022-05-30 12:23:07', "Salve salve"),
(4, 4, '2022-05-30 12:23:07', "Salve salve"),
(5, 1, '2022-05-30 12:23:07', "Salve salve"),
(6, 5, '2022-05-30 12:23:07', "Salve salve"),
(7, 7, '2022-05-30 12:23:07', "Salve salve"),
(8, 3, '2022-05-30 12:23:07', "Salve salve"),
(9, 8, '2022-05-30 12:23:07', "Salve salve"),
(10, 6, '2022-05-30 12:23:07', "Salve salve");

INSERT INTO curtir(cod_postagem, cod_usuario, dathora_curtir)
VALUES
(1, 10, '2022-08-27 18:23:08'),
(2, 9, '2022-08-27 18:23:08'),
(3, 8, '2022-08-27 18:23:08'),
(4, 7, '2022-08-27 18:23:08'),
(5, 6, '2022-08-27 18:23:08'),
(6, 5, '2022-08-27 18:23:08'),
(7, 4, '2022-08-27 18:23:08'),
(8, 3, '2022-08-27 18:23:08'),
(9, 2, '2022-08-27 18:23:08'),
(10, 1, '2022-08-27 18:23:08');

INSERT INTO doacao(cod_ong, cod_usuario, dt_doacao, valor_doacao)
VALUES
(1, 10, '2022-03-15', '976.12'),
(2, 2, '2022-03-15', '976.12'),
(3, 9, '2022-03-15', '976.12'),
(4, 4, '2022-03-15', '976.12'),
(5, 1, '2022-03-15', '976.12'),
(6, 5, '2022-03-15', '976.12'),
(7, 7, '2022-03-15', '976.12'),
(8, 3, '2022-03-15', '976.12'),
(9, 8, '2022-03-15', '976.12'),
(10, 6, '2022-03-15', '976.12');

INSERT INTO midia(titulo_midia, caminho_midia, cod_midia, cod_postagem)
VALUES

('Midia 1', 'google.com', 1, 1),
('Midia 2', 'google.com', 2, 2),
('Midia 3', 'google.com', 3, 3),
('Midia 4', 'google.com', 4, 4),
('Midia 5', 'google.com', 5, 5),
('Midia 6', 'google.com', 6, 6),
('Midia 7', 'google.com', 7, 7),
('Midia 8', 'google.com', 8, 8),
('Midia 9', 'google.com', 9, 9),
('Midia 10', 'google.com', 10, 10);
