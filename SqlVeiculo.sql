###CORES###

CREATE TABLE cores(
   cd_cor number(6) not null,
   ds_cor varchar2(20),
     constraint pk_cor PRIMARY KEY (cd_cor))
          
###COMBUSTIVEL###

CREATE TABLE combustivel(
  cd_combustivel number(6) not null,
  ds_combustivel varchar2(20),
    constraint pk_combustivel PRIMARY KEY (cd_combustivel))
           
###MARCA###

CREATE TABLE marca(
   cd_marca number(6) not null,
   ds_marca varchar2(20),
     constraint pk_marca PRIMARY KEY (cd_marca))
       
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

CREATE TABLE veicdesp(
   cd_despesa number(6) not null,
   dt_despesa date,
   nm_nota varchar2(9),
   ds_descricao varchar2(45),
   nm_valor number(12,2),
   nm_qtde number(6),
   cd_presserv number(6),
   cd_veiculo number(6) not null,
   cd_usuario number(6),
     constraint pk_veicdesp PRIMARY KEY (cd_despesa),
     constraint fk_veicdesp_veiculo FOREIGN KEY (cd_veiculo)
       REFERENCES veiculo (cd_veiculo))
       
CREATE SEQUENCE sq_veicdesp
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   
   