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