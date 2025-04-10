###ESTADO###

CREATE TABLE estado (
	cd_estado number (6) not null,
	ds_estado varchar2 (25),
	ds_siglaestado varchar2 (2),
	constraint pk_estado PRIMARY KEY (cd_estado));

CREATE SEQUENCE sq_estado
	START WITH 1
	INCREMENT BY 1
	NOCACHE;

###CIDADE###

CREATE TABLE cidade (
	cd_cidade number (6) not null,
	ds_cidade varchar2 (25),
	cd_estado number (6) not null,
	constraint pk_cidade	PRIMARY KEY (cd_cidade),
	constraint fk_cidade_estado	FOREIGN KEY (cd_estado)
			REFERENCES estado (cd_estado));
			
CREATE SEQUENCE sq_cidade
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
         
###PESSOA FISICA###
	
CREATE TABLE pessoafisica (
	cd_pessoafisica number (6) not null,
	ds_nome varchar2 (45),
	dt_nascimento date,
	nm_cpf varchar2(11),
	nm_rg varchar2(15),
	nm_cnh number (11),
	cd_cidade number (6),
	constraint pk_pessoa PRIMARY KEY (cd_pessoafisica),
	constraint fk_pessoa_cidade FOREIGN KEY (cd_cidade)
			REFERENCES cidade (cd_cidade));

CREATE SEQUENCE sq_pessoafisica
	START WITH 1
	INCREMENT BY 1
	NOCACHE;

###USUARIO###

CREATE TABLE usuario (
	cd_usuario number (6) not null,
	ds_login varchar2 (25),
	ds_senha varchar2 (10),
	cd_pessoafisica number (6) not null,
	constraint pk_usuario PRIMARY KEY (cd_usuario),
	constraint fk_pessoafisica_usuario FOREIGN KEY (cd_pessoafisica)
			REFERENCES pessoafisica (cd_pessoafisica));
      
CREATE SEQUENCE sq_usuario
	START WITH 3
	INCREMENT BY 1
	NOCACHE;
