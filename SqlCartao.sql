###CARTAOBANDEIRA###

CREATE TABLE cartaobandeira(
   cd_cartaobandeira number(6) not null,
   ds_cartaobandeira varchar2(20),
     constraint pk_cartaobandeira PRIMARY KEY (cd_cartaobandeira))
       
###CARTAO###

CREATE TABLE cartao(
   cd_cartao number(6) not null,
   nm_cartao varchar2(16),
   nm_limite number(12,2),
   dt_validade date,
   cd_cartaobandeira number(6) not null,
   cd_banco number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_cartao PRIMARY KEY (cd_cartao),
     constraint fk_cartao_banco FOREIGN KEY (cd_banco)
       REFERENCES banco (cd_banco),
     constraint fk_cartao_cartaobandeira FOREIGN KEY (cd_cartaobandeira)
       REFERENCES cartaobandeira(cd_cartaobandeira))
                 
CREATE SEQUENCE sq_cartao
   START WITH 1
   INCREMENT BY 1
   NOCACHE;
   
###CARTAOLANCAMENTO###
--Exemplo:
CREATE TABLE cartaolanc(
       cd_cartaolanc number(9) not null,
       ds_despesa varchar2(45),
       nm_valor number(12,2),
       nm_parcela number(6),
       dt_despesa date,
       cd_despesa number(6),
       cd_categoria number(6),
       cd_cartao number(6) not null,
       cd_usuario number(6) not null,
         constraint pk_cartaolanc PRIMARY KEY (cd_cartaolanc),
         constraint fk_despesa_cartaolanc FOREIGN KEY (cd_despesa)
           REFERENCES despesa (cd_despesa),
         constraint fk_categoria_cartaolanc FOREIGN KEY (cd_categoria)
           REFERENCES categoria (cd_categoria),
         constraint fk_cartao_cartaolanc FOREIGN KEY (cd_cartao)
           REFERENCES cartao (cd_cartao))

--VALIDA
--Sem fk_despesa_cartaolanc e fk_categoria_cartaolanc           
CREATE TABLE cartaolanc(
       cd_cartaolanc number(9) not null,
       ds_despesa varchar2(45),
       nm_valor number(12,2),
       nm_parcela number(6),
       dt_despesa date,
       cd_despesa number(6),
       cd_categoria number(6),
       cd_cartao number(6) not null,
       cd_usuario number(6) not null,
         constraint pk_cartaolanc PRIMARY KEY (cd_cartaolanc, cd_cartao),
         constraint fk_cartao_cartaolanc FOREIGN KEY (cd_cartao)
           REFERENCES cartao (cd_cartao))
   
###CARTAOLANCAMENTOFECHAMENTO (cartaolancf)###
   
CREATE TABLE cartaolancf(
       cd_cartaolancf number(6),
       dt_fechamento date,
       cd_cartaolanc number(6),
       ds_despesa varchar2(45),
       nm_valor number(12,2),
       nm_parcela number(6),
       dt_despesa date,
       cd_despesa number(6),
       cd_categoria number(6),
       cd_cartao number(6),
       cd_usuario number(6) not null),
--         constraint pk_cartaolancf PRIMARY KEY (cd_cartaolancf, cd_cartaolanc),
--         constraint fk_categoria_cartaolancf FOREIGN KEY (cd_categoria)
--           REFERENCES categoria (cd_categoria),
--         constraint fk_cartao_cartaolancf FOREIGN KEY (cd_cartao)
--           REFERENCES cartao (cd_cartao))

###CARTAOPARCELAMENTO (cartaoparc)###
   
CREATE TABLE cartaoparc(
       cd_parcela number(6),
       dt_parcela date,
       nm_parcelapag number(6),
       cd_cartaolanc number(6),
       ds_despesa varchar2(45),
       nm_valor number(12,2),
       nm_parcela number(6),
       dt_despesa date,
       cd_despesa number(6),
       cd_categoria number(6),
       cd_cartao number(6),
       cd_usuario number(6) not null)