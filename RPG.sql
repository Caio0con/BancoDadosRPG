create database RPG;
use RPG;

create table Conta(
    Idconta int primary key auto_increment,
    Nome varchar(50) not null,
    Email varchar(50) not null,
    Senha varchar(50) not null
)

create table Personagem(
    Idpersonagem int primary key auto_increment,
    NomePersonagem varchar(50) not null,
    Nivel int not null,
    Idconta int not null,
    foreign key (Idconta) references Conta(Idconta)
)

create table TipoEquipamento(
    IdTipoEquipamento int primary key auto_increment,
    NomeTipoEquipamento varchar(50) not null,
    Descricao varchar(50) not null
)

create table InventarioPersonagem(
    IdPersonagem int not null,
    IdEquipamento int not null,
    foreign key (IdPersonagem) references Personagem(IdPersonagem),
    foreign key (IdEquipamento) references TipoEquipamento(IdTipoEquipamento)
)

create table Equipamento(
    IdEquipamento int primary key auto_increment,
    NomeEquipamento varchar(50) not null,
    Forca int not null,
    Defesa int not null,
    Peso int not null,
    Descricao text(400) not null,
    IdTipoEquipamento int not null,
    foreign key (IdTipoEquipamento) references TipoEquipamento(IdTipoEquipamento)
)

create table Monstro(   
    IdMonstro int primary key auto_increment,
    NomeMonstro varchar(50) not null,
    Nivel int not null,
    Forca int not null,
    Defesa int not null,
    Vida int not null
)

create table ItensDropaveis(
    IdMonstro int not null,
    IdEquipamento int not null,
    foreign key (IdMonstro) references Monstro(IdMonstro),
    foreign key (IdEquipamento) references Equipamento(IdEquipamento)
)

create table Skills(
    IdSkill int primary key auto_increment,
    NomeSkill varchar(50) not null,
    Descricao text(400) not null,
    Dano int not null,
    IdPersonagem int not null,
    foreign key (IdPersonagem) references Personagem(IdPersonagem)
)

create table SkillsdoPersonagem(
    IdPersonagem int not null,
    IdSkill int not null,
    foreign key (IdPersonagem) references Personagem(IdPersonagem),
    foreign key (IdSkill) references Skills(IdSkill)
)




insert into Monstro (NomeMonstro, Nivel, Forca, Defesa, Vida) values
('Goblin', 1, 5, 2, 10),
('Orc', 3, 10, 5, 30),
('Dragão', 10, 50, 30, 100);


insert into Skills (NomeSkill, Descricao, Dano, IdPersonagem) values
('Bola de Fogo', 'Lança uma bola de fogo que causa dano ao inimigo', 20, 1),
('Corte Duplo', 'Ataque com duas espadas causando dano duplo', 15, 2),
('Cura', 'Recupera uma quantidade de vida do personagem', 10, 3);

insert into TipoEquipamento (NomeTipoEquipamento, Descricao) values
('Arma', 'Equipamento que aumenta o dano do personagem'),
('Armadura', 'Equipamento que aumenta a defesa do personagem'),
('Acessorio', 'Equipamento que aumenta a vida do personagem');

insert into Equipamento (NomeEquipamento, Forca, Defesa, Peso, Descricao, IdTipoEquipamento) values
('Espada', 10, 0, 5, 'Espada de ferro', 1),
('Armadura de Couro', 0, 5, 10, 'Armadura de couro', 2),
('Anel de Vida', 0, 0, 1, 'Anel que aumenta a vida do personagem', 3);

insert InventarioPersonagem (IdPersonagem, IdEquipamento) values
(1, 1),
(2, 2),
(3, 3);

insert ItensDropaveis (IdMonstro, IdEquipamento) values
(1, 4),
(2, 5),
(3, 6);