###TIPO MIDIA###

CREATE TABLE tipomidia(
  cd_tipomidia number(6) not null,
  ds_tipomidia varchar2(10),
  constraint pk_cd_tipomidia PRIMARY KEY (cd_tipomidia))
  
###STATUS###

CREATE TABLE status(
   cd_status number(6) not null,
   ds_status varchar2(20),
   constraint pk_status PRIMARY KEY (cd_status))
      
###EDITORA###

CREATE TABLE editora(
	cd_editora number(6) not null,
	ds_nome varchar2(30),
  cd_usuario number(6) not null,
	constraint pk_editora	PRIMARY KEY (cd_editora))
    
CREATE SEQUENCE sq_editora
	START WITH 1
	INCREMENT BY 1
	NOCACHE
       
###CATALOGO###
  
CREATE TABLE catalogo(
	cd_catalogo number(6) not null,
	ds_titulo varchar2(40),
	nm_numero number(6),
	nm_volume number(6),
  nm_edicao number(6),
  ds_observacao varchar2(80),
	cd_tipomidia number(6) not null,
	cd_editora number(6) not null,
  cd_status number(6) not null,
	cd_usuario number(6) not null,
	constraint pk_catalogo PRIMARY KEY (cd_catalogo),
	constraint fk_catalogo_tipomidia FOREIGN KEY (cd_tipomidia)
			REFERENCES tipomidia (cd_tipomidia),
	constraint fk_catalogo_editora FOREIGN KEY (cd_editora)
			REFERENCES editora (cd_editora),
  constraint fk_catalogo_status FOREIGN KEY (cd_status)
      REFERENCES status (cd_status),
	constraint fk_catalogo_userpessoa FOREIGN KEY (cd_usuario)
			REFERENCES usuario (cd_usuario));
      
CREATE SEQUENCE sq_catalogo
	START WITH 1
	INCREMENT BY 1
	NOCACHE


