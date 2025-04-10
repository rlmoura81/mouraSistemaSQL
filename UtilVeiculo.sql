###CORES###

SELECT cd_cor, ds_cor
       FROM cores
       
INSERT INTO cores (cd_cor, ds_cor)
       VALUES (1, 'VERDE')
       
INSERT INTO cores (cd_cor, ds_cor)
       VALUES (2, 'BRANCO')
          
###COMBUSTIVEL###

SELECT cd_combustivel, ds_combustivel
       FROM combustivel
       
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
       VALUES (1, 'GASOLINA')
       
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
       VALUES (2, 'ETANOL')

INSERT INTO combustivel (cd_combustivel, ds_combustivel)
       VALUES (3, 'DIESEL')

INSERT INTO combustivel (cd_combustivel, ds_combustivel)
       VALUES (4, 'FLEX')
       
###MARCA###

SELECT cd_marca, ds_marca
       FROM marca       
       
INSERT INTO marca (cd_marca, ds_marca)
       VALUES (1, 'WILLYS')

INSERT INTO marca (cd_marca, ds_marca)
       VALUES (2, 'CHEVROLET')       
       
###MODELO###

CREATE TABLE modelo(
  cd_modelo number(6) not null,
  ds_modelo varchar2(20),
  cd_marca number(6) not null,
  cd_usuario number(6) not null,
    constraint pk_modelo PRIMARY KEY (cd_modelo),
    constraint fk_modelo_marca FOREIGN KEY (cd_marca)
       REFERENCES marca (cd_marca))
       
CREATE SEQUENCE sq_modelo
       START WITH 1
       INCREMENT BY 1
       NOCACHE;

###VEICULO###

CREATE TABLE veiculo(
   cd_veiculo number(6) not null,
   dt_anofab number(4),
   dt_anomod number(4),
   nm_renavam varchar2(11),
   nm_placa varchar2(7),
   nm_potencia number(4),
   cd_combustivel number(6),
   cd_cor number(4),
   cd_modelo number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_veiculo PRIMARY KEY (cd_veiculo),
     constraint fk_veiculo_modelo FOREIGN KEY (cd_modelo)
        REFERENCES modelo (cd_modelo))

CREATE SEQUENCE sq_veiculo
       START WITH 1
       INCREMENT BY 1
       NOCACHE;           

###VEICULO DESPESA###

SELECT cd_despesa, dt_despesa, nm_nota, ds_descricao, nm_valor, cd_presserv, cd_veiculo, cd_usuario
       FROM veicdesp
       