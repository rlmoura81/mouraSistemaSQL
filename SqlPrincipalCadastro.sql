###GRUPO###

CREATE TABLE grupo(
	cd_grupo number (6) not null,
	ds_grupo varchar2 (20),
  cd_usuario number(6) not null,
	  constraint pk_grupo PRIMARY KEY (cd_grupo));

CREATE SEQUENCE sq_grupo
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
  
###CATEGORIA###

CREATE TABLE categoria (
	cd_categoria number (6) not null,
	ds_categoria varchar2 (20),
  cd_grupo number(6),
  cd_usuario number(6) not null,
	  constraint pk_categoria PRIMARY KEY (cd_categoria));
    
ALTER TABLE categoria ADD cd_grupo number(6);

CREATE SEQUENCE sq_categoria
	START WITH 1
	INCREMENT BY 1
	NOCACHE;

###PRESTADOR SERVICO###

CREATE TABLE presserv(
	cd_presserv number(6) not null,
	ds_presserv varchar2(45),
	ds_razaosocial varchar2(45),
	nm_documento varchar2(14),
  cd_usuario number(6) not null,
	  constraint pk_presserv	PRIMARY KEY (cd_presserv));
    
CREATE SEQUENCE sq_presserv
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
  
###MODULO###

CREATE TABLE modulo(
       cd_modulo number (6) not null,
       ds_modulo varchar2(20),
         constraint pk_modulo PRIMARY KEY (cd_modulo));
       
###PRESSERVMOD###

CREATE TABLE presservmod(
       cd_modulo number(6) not null,
       cd_presserv number(6) not null,
       cd_usuario number(6) not null,
       constraint pk_presservmod PRIMARY KEY (cd_modulo, cd_presserv),
       constraint fk_presserv_presservmod FOREIGN KEY (cd_presserv)
         REFERENCES presserv (cd_presserv),
       constraint fk_modulo_presservmod FOREIGN KEY (cd_modulo)
         REFERENCES modulo (cd_modulo))
         
###CATMOD###

CREATE TABLE catmod(
       cd_modulo number(6) not null,
       cd_categoria number(6) not null,
       cd_usuario number(6) not null,
       constraint pk_catmod PRIMARY KEY (cd_modulo, cd_categoria),
       constraint fk_categoria_catmod FOREIGN KEY (cd_categoria)
         REFERENCES categoria (cd_categoria),
       constraint fk_modulo_catmod FOREIGN KEY (cd_modulo)
         REFERENCES modulo (cd_modulo))

###ASSINATURA###

CREATE TABLE assinatura(
  cd_assinatura number(6) not null,
  ds_servico varchar2(45),
  ds_login varchar2(60),
  ds_senha varchar2(45),
  nm_valor number(12,2),
  tp_assinatura number(6),
  dt_validade date,
  cd_presserv number(6),
  cd_usuario number(6) not null,
  constraint pk_assinatura PRIMARY KEY (cd_assinatura))

CREATE SEQUENCE sq_assinatura
	START WITH 1
	INCREMENT BY 1
	NOCACHE;