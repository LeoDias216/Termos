create database if not exists sesi_extensaovsTA;

use sesi_extensaovsTA;

show tables;

-- Visualizar todos os BD
show schemas;

create table if not exists Alunos (
    Id_aluno int auto_increment primary key,
    Nome_aluno varchar(60) not null,
    CPF_aluno char(14) not null unique,
    Data_nascimento date not null,
    Data_cadastro timestamp default current_timestamp
);

-- Visualizar informações sobre os dados da tabela
describe Alunos;