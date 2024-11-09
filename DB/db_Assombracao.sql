create batabase db_Assombracao;
use db_Assombracao;

create table Linguagem(
    id int primary key auto_increment,
    nome varchar(50) not null,
    versao double not null
);

create table Maldicao(
    int id primary key auto_increment,
    nome varchar(25) not null,
    descricao varchar(200) not null,
    dano int not null
);

create table Entidade(
    id int primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(255) not null;
);

create table Algoritmo (
    id int primary key auto_increment,
    nome varchar(25) not null,
    descricao varchar(255) not null,
    id_linguagem int not null,
    foreign key (id_linguagem) references Linguagem(id)
    id_Monstro int not null,
    foreign key (id_Monstro) references Monstro(id)
);

create table Monstro(
    id int primary key auto_increment,
    nome varchar(50) not null,
    Historia varchar(255) not null,
    vida decimal not null,
    fraqueza varchar(50) not null,
    id_entidade decimal not null,
    foreign key (id_entidade) references Entidade(id)
    id_maldicao int not null,
    foreign key (id_maldicao) references Maldicao(id)
);

create table Inventario(
    id int primary key auto_increment,
    tamanho int not null
);

create table Inventario_item(
    id int primary key auto_increment,
    id_inventario int not null,
    foreign key (id_inventario) references Inventario(id),
    id_item int not null,
    foreign key (id_item) references Item(id)
)

create table Item(
    id int primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(255) not null
);

create table Quest(
    int id primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(255) not null,
    dificuldade int not null,
    id_algoritimo int not null,
    foreign key (id_algoritimo) references Algoritmo(id)
);

create table Heroi(
    id int primary key auto_increment,
    nome varchar(50) not null,
    vida int not null,
    id_quest int not null,
    foreign key (id_quest) references Quest(id),
    id_inventario int not null,
    foreign key (id_inventario) references Inventario(id)
);

create table Heroi_poder(
    id int primary key auto_increment,
    id_heroi int not null,
    foreign key (id_heroi) references Heroi(id),
    id_skill int not null,
    foreign key (id_skill) references Skill(id)
);

create table Skill(
    id int primary key auto_increment,
    nome varchar(50) not null,
    cooldown decimal not null,
    custo decimal not null,
    nivel int not null,
    experiencia int not null,
    descricao varchar(255) not null
);
