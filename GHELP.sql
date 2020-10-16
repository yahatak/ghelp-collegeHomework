create database ghelp;
use ghelp;

create table usuario(
	id int auto_increment primary key,
    nome varchar(40) not null,
    userName varchar(40) not null,
    pass varchar(40) not null,
	email varchar(40) not null
);

create table categoria(
	id int auto_increment primary key,
    nome varchar(50)
);

insert into categoria (nome) values ('Ação e Aventura');
insert into categoria (nome) values ('Terror');
insert into categoria (nome) values ('Moba');
insert into categoria (nome) values ('FPS');
insert into categoria (nome) values ('RPG');
insert into categoria (nome) values ('Battle Royale');

create table plataforma (
	id int auto_increment primary key,
    nome varchar(20)
);

insert into plataforma (nome) values ('PC');
insert into plataforma (nome) values ('Xbox One');
insert into plataforma (nome) values ('PS4');
insert into plataforma (nome) values ('Nintendo Switch');
insert into plataforma (nome) values ('Mobile');

create table tipoPostagem(
	id int auto_increment primary key,
    tipo varchar(40)
);

insert into tipoPostagem (tipo) values ('Dùvidas');
insert into tipoPostagem (tipo) values ('Bugs');
insert into tipoPostagem (tipo) values ('Novidades');

create table postagem(
	id int auto_increment primary key,
    titulo varchar(40),
    corpo varchar(1000),
    tipo int,
    autor int,
    categoria int,
    plataforma int,
    
    foreign key(tipo) references tipoPostagem(id),
    foreign key (categoria) references categoria (id),
    foreign key (autor) references usuario (id),
    foreign key (plataforma) references plataforma(id)
);

create table resposta(
	id int auto_increment primary key,
    corpo varchar(500),
    autor int,
    idPostagem int,
    foreign key (autor) references usuario(id),
    foreign key (idPostagem) references postagem(id)
);

insert into usuario (nome, userName, pass, email) values ('Rodrigo', 'rodp', '12345', 'rodp@gmail.com');
insert into usuario (nome, userName, pass, email) values ('admin', 'admin', 'admin', 'admin');
insert into usuario (nome, userName, pass, email) values ('gisele', 'samudio', '1234', 'email');

insert into postagem (titulo, corpo, autor, categoria, tipo, plataforma) values ('Problema de conexão no LOL', 
'Olá, sempre que eu tento me conectar a uma partida de League of Legends mostra um erro de conexão e eu não sei como resolver, "Você foi desconectado" aparece sem motivo nenhum
minha conexão está otima ja que em minha chamada do discord ainda estou conectado e consigo ouvir minhas musicas no spotify normalmente. Tem algum motivo para isso estar ocorrendo somente no lol?
eu não acho que seja o servidor ja que eu não vi mais ninguem reclamando disso, talvez seja a rota ou algo assim mas não sei bem como mexer nisso, se alguem puder me ajudar eu agradeceria', 1, 3, 1, 1);
insert into postagem (titulo, corpo, autor, categoria, tipo, plataforma) values ('Erro de directx ao abrir CS:GO', 'Sempre que eu abro o csgo da o erro de directx e o meu ja esta atualizado, nao sei oq fazer', 3, 4, 2, 1);
insert into resposta (corpo, autor, idPostagem) values ('Reinicia o modem, sei la', 2, 1);
insert into resposta (corpo, autor, idPostagem) values ('troca de internet', 3, 1);

