###ESPECIE###

CREATE TABLE especie(
   cd_especie number(6) not null,
   ds_especie varchar2(20),
     constraint pk_especie PRIMARY KEY (cd_especie))

###RACA###

CREATE TABLE raca(
   cd_raca number(6) not null,
   ds_raca varchar2(20),
   cd_especie number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_raca PRIMARY KEY (cd_raca),
     constraint fk_raca_especie FOREIGN KEY (cd_especie)
       REFERENCES especie (cd_especie))
            
CREATE SEQUENCE sq_raca
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
###ANIMAL###

CREATE TABLE animal(
   cd_animal number(6) not null,
   ds_nome varchar2(45),
   dt_nasc date,
   ds_sexo varchar2(10),
   cd_raca number(6) not null,
   cd_usuario number(6),
     constraint pk_animal PRIMARY KEY (cd_animal),
     constraint fk_animal_raca FOREIGN KEY (cd_raca)
       REFERENCES raca (cd_raca))
      
CREATE SEQUENCE sq_animal
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
###PRODUTO###

CREATE TABLE produto(
   cd_produto number(6) not null,
   ds_produto varchar2(50),
   nm_peso number(12,3),
   cd_usuario number(6) not null,
     constraint pk_produto PRIMARY KEY (cd_produto))
     
CREATE SEQUENCE sq_produto
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
###ANIMAL DESPESA (ANIMDESP)###

CREATE TABLE animdesp(
   cd_despesa number(6) not null,
   dt_despesa date,
   nm_nota varchar2(9),
   ds_descricao varchar2(45),
   nm_valor number(12,2),
   nm_qtde number(6),
   cd_presserv number(6),
   cd_animal number(6) not null,
   cd_produto number(6),
   cd_usuario number(6),
     constraint pk_animdesp PRIMARY KEY (cd_despesa),
     constraint fk_animdesp_animal FOREIGN KEY (cd_animal)
       REFERENCES animal (cd_animal))
       
CREATE SEQUENCE sq_animdesp
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
###TIPO HISTORICO (tphist)###

CREATE TABLE tphist(
  cd_tipo number(6) not null,
  ds_tipo varchar2(40),
    constraint pk_tshist PRIMARY KEY (cd_tipo))
    
###HISTORICO###

CREATE TABLE historico(
       cd_historico number(6) not null,
       dt_historico date,
       ds_historico varchar2(100),
       cd_presserv number(6),
       cd_animal number(6) not null,
       cd_tipo number(6),
       cd_usuario number(6) not null,
         constraint pk_historico PRIMARY KEY (cd_historico),
         constraint fk_historico_animal FOREIGN KEY (cd_animal)
           REFERENCES animal (cd_animal))
           
CREATE SEQUENCE sq_historico
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
   
   