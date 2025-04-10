###TIPO IMOVEL###

CREATE TABLE tipoimovel(
  cd_tpimovel number(6) not null,
  ds_tpimovel varchar2(20),
  constraint pk_tpimovel PRIMARY KEY (cd_tpimovel));

###IMOVEL###  

CREATE TABLE imovel (
	cd_imovel number (6) not null,
	nm_matricula varchar2(12),
	nm_metragem number (12,2),
	nm_valor number(12,2),
	ds_descricao varchar2 (160),
	cd_tpimovel number (6) not null,
	cd_cidade number (6),
	cd_usuario number(6) not null,
		constraint pk_imovel PRIMARY KEY (cd_imovel),
    constraint fk_imovel_cidade FOREIGN KEY (cd_cidade)
       REFERENCES cidade (cd_cidade))
		
CREATE SEQUENCE sq_imovel
	START WITH 1
	INCREMENT BY 1
	NOCACHE;

###IMOVEL DESPESA###

CREATE TABLE imovdesp(
   cd_despesa number(6) not null,
   dt_despesa date,
   nm_nota varchar2(9),
   ds_descricao varchar2(45),
   nm_valor number(12,2),
   nm_qtde number(6),
   cd_presserv number(6),
   cd_imovel number(6) not null,
   cd_usuario number(6),
     constraint pk_imovdesp PRIMARY KEY (cd_despesa),
     constraint fk_imovdesp_imovel FOREIGN KEY (cd_imovel)
       REFERENCES imovel (cd_imovel))
       
CREATE SEQUENCE sq_imovdesp
   START WITH 1
   INCREMENT BY 1
   NOCACHE