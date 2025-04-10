###TAREFA###

CREATE TABLE tarefa(
  cd_tarefa number(6) not null,
  ds_tarefa varchar2(60),
  nm_valor number(12,2),
  tp_tempo number(6),
  cd_usuario number(6) not null,
  constraint pk_tarefa PRIMARY KEY (cd_tarefa))
  
CREATE SEQUENCE sq_tarefa
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  
###DIARIO###

CREATE TABLE diario(
  dt_diario date,
  nm_valor number(12,2),
  cd_tarefa number(6),
  cd_usuario number(6) not null)

CREATE TABLE diariomes(
  dt_diario date,
  nm_valor number(12,2),
  cd_tarefa number(6),
  cd_usuario number(6) not null)
         