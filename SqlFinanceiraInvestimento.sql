--TPATIVO--

CREATE TABLE tpativo(
       cd_tpativo number(6) not null,
       ds_tpativo varchar2(60),
        constraint pk_tpativo PRIMARY KEY (cd_tpativo))     
           
--ATIVO--

CREATE TABLE ativo(
   cd_ativo number(6) not null,
   ds_ativo varchar2(60),
   ds_sgativo varchar2(6),
   nm_cnpj varchar2(14),
   cd_tpativo number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_ativo PRIMARY KEY (cd_ativo),
     constraint fk_ativo_tpativo FOREIGN KEY (cd_tpativo)
                REFERENCES tpativo (cd_tpativo))
     
CREATE SEQUENCE sq_ativo
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
       
--ATIVOSALDO--

CREATE TABLE ativosaldo(
   cd_ativo number(6) not null,
   nm_qtde number(6),
   cd_usuario number(6) not null,
    constraint pk_ativosaldo PRIMARY KEY (cd_ativo, cd_usuario))
       
--POUPANCA--

CREATE TABLE poupanca(
       cd_poupanca number(6),
       nm_variacao varchar2(10),
       vl_saldo number(12,2),
       cd_conta number(6),
       cd_usuario number(6),
         constraint pk_poupanca PRIMARY KEY (cd_poupanca),
         constraint fk_poupanca_poupanca FOREIGN KEY (cd_conta)
            REFERENCES conta (cd_conta))
            
CREATE SEQUENCE sq_poupanca
       START WITH 1
       INCREMENT BY 1
       NOCACHE;

--POUPANCATRANSACAO--

CREATE TABLE pouptrans(
       cd_pouptrans number(6) not null,
       vl_transacao number(12,2),
       dt_transacao date,
       cd_gptrans number(6) not null,
       cd_poupanca number(6) not null,
       cd_usuario number(6) not null,
          constraint pk_pouptrans PRIMARY KEY (cd_pouptrans),
          constraint fk_pouptrans_gptrans FOREIGN KEY (cd_gptrans)
             REFERENCES gptrans (cd_gptrans),
          constraint fk_pouptrans_poupanca FOREIGN KEY (cd_poupanca)
             REFERENCES poupanca (cd_poupanca))
             
CREATE SEQUENCE sq_pouptrans
       START WITH 1
       INCREMENT BY 1
       NOCACHE; 
          
--POUPANCAAPLICACAO--

CREATE TABLE poupaplic(
       cd_poupaplic number(6) not null,
       vl_saldo number(12,2),
       dt_saldo date,
       cd_poupanca number(6) not null,
       cd_usuario number(6) not null,
          constraint pk_poupaplic PRIMARY KEY (cd_poupaplic),
          constraint fk_poupaplic_poupanca FOREIGN KEY (cd_poupanca)
             REFERENCES poupanca (cd_poupanca))
             
CREATE SEQUENCE sq_poupaplic
       START WITH 1
       INCREMENT BY 1
       NOCACHE;           
           
--RENDAFIXA--

CREATE TABLE rendafixa(
   cd_rendafixa number(6) not null,
   ds_rendafixa varchar2(60),
   vl_aplicado number(12,2),
   vl_taxa number(12,2),
   dt_aplicacao date,
   dt_vencimento date,
   cd_indice number(6) not null,
   cd_tpativo number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_rendafixa PRIMARY KEY (cd_rendafixa),
     constraint fk_rendafixa_indice FOREIGN KEY (cd_indice)
                REFERENCES indice (cd_indice),
     constraint fk_rendafixa_tpativo FOREIGN KEY (cd_tpativo)
                REFERENCES tpativo (cd_tpativo))

CREATE SEQUENCE sq_rendafixa
       START WITH 1
       INCREMENT BY 1
       NOCACHE;       
                       
--TIPOPROVENTO--

CREATE TABLE tpprovento(
       cd_tpprovento number(6) not null,
       ds_tpprovento varchar2(60),
       constraint pk_tpprovento PRIMARY KEY (cd_tpprovento))      

--FUNDOIMOBILIARIOPROVENTO--

CREATE TABLE fdimprov(
   cd_fdimprov number(9) not null,
   cd_ativo number(6) not null,
   dt_pagamento date,
   dt_precobase date,
   vl_provento number(12,3),
   vl_database number(12,3),
   cd_tpprovento number(6) not null,
   cd_usuario number(6) not null,
      constraint pk_fiiprov PRIMARY KEY (cd_fdimprov),
      constraint fk_fiiprov_ativo FOREIGN KEY (cd_ativo)
                 REFERENCES ativo (cd_ativo),
      constraint fk_fiiprov_tpprovento FOREIGN KEY (cd_tpprovento)
                 REFERENCES tpprovento(cd_tpprovento))
                 
CREATE SEQUENCE sq_fdimprov
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
             
--ACAOPROVENTO--

CREATE TABLE acaoprov(
   cd_acaoprov number(9) not null,
   cd_ativo number(6) not null,
   dt_pagamento date,
   dt_precobase date,
   vl_provento number(12,3),
   vl_database number(12,3),
   cd_tpprovento number(6) not null,
   cd_usuario number(6) not null,
      constraint pk_acaoprov PRIMARY KEY (cd_acaoprov),
      constraint fk_acaoprov_ativo FOREIGN KEY (cd_ativo)
                 REFERENCES ativo (cd_ativo),
      constraint fk_acaoprov_tpprovento FOREIGN KEY (cd_tpprovento)
                 REFERENCES tpprovento(cd_tpprovento))
                 
CREATE SEQUENCE  sq_acaoprov
       START WITH 1
       INCREMENT BY 1
       NOCACHE
       
--GRUPOFUNDO--

CREATE TABLE gpfundo(
   cd_gpfundo number(6) not null,
   ds_gpfundo varchar2(60),
   constraint pk_gpfundo PRIMARY KEY (cd_gpfundo))
   
--FUNDOINVESTIMENTO--

CREATE TABLE fdinvest(
   cd_fdinvest number(6) not null,
   ds_fdinvest varchar2(60),
   cd_gpfundo number(6) not null,
   cd_usuario number(6) not null,
   constraint pk_fdinvest PRIMARY KEY (cd_fdinvest),
   constraint fk_fdinvest_gpfundo FOREIGN KEY (cd_gpfundo)
              REFERENCES gpfundo (cd_gpfundo))
              
CREATE SEQUENCE sq_fdinvest
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
       
--FUNDOINVESTIMENTOAPLICACAO--

CREATE TABLE fdinvestaplic(
   cd_fdinvestaplic number(6) not null,
   vl_saldo number(12,2),
   cd_fdinvest number(6) not null,
   cd_conta number(6) not null,
   cd_usuario number(6) not null,
   constraint pk_fdinvestaplic PRIMARY KEY (cd_fdinvestaplic),
   constraint fk_fdinvestaplic_fdinvest FOREIGN KEY (cd_fdinvest)
              REFERENCES fdinvest (cd_fdinvest),
   constraint fk_fdinvestaplic_conta FOREIGN KEY (cd_conta)
              REFERENCES conta (cd_conta))
              
CREATE SEQUENCE sq_fdinvestaplic
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
                     
--FUNDOINVESTIMENTOTRANSACAO--

CREATE TABLE fdinvesttrans(
   cd_fdinvesttrans number(6) not null,
   vl_transacao number(12,2),
   dt_transacao date,
   cd_gptrans number(6) not null,
   cd_fdinvestaplic number(6) not null,
   cd_conta number(6) not null,
   cd_usuario number(6) not null,
   constraint pk_fdinvesttrans PRIMARY KEY (cd_fdinvesttrans),
   constraint fk_fdinvesttrans_gptrans FOREIGN KEY (cd_gptrans)
              REFERENCES gptrans (cd_gptrans),
   constraint fk_fdinvesttrans_fdinvestaplic FOREIGN KEY (cd_fdinvestaplic)
              REFERENCES fdinvestaplic (cd_fdinvestaplic),
   constraint fk_fdinvesttrans_conta FOREIGN KEY (cd_conta)
              REFERENCES conta(cd_conta))
              
CREATE SEQUENCE sq_fdinvesttrans
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
              
--FUNDOINVESTIMENTORENDIMENTO--

CREATE TABLE fdinvestrend(
   cd_fdinvestrend number(6) not null,
   vl_rendimento number(12,3),
   dt_rendimento date,
   cd_fdinvestaplic number(6) not null,
   cd_usuario number(6) not null,
   constraint pk_fdinvestrend PRIMARY KEY (cd_fdinvestrend),
   constraint fk_fdinvestrend_fdinvestaplic FOREIGN KEY (cd_fdinvestaplic)
              REFERENCES fdinvestaplic (cd_fdinvestaplic))
              
CREATE SEQUENCE sq_fdinvestrend
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
       
--NOTACORRETAGEM--

CREATE TABLE notacorretagem(
   cd_nota number(12) not null,
   nm_nota number(12),
   dt_nota date,
   cd_conta number(6) not null,
   cd_usuario number(6) not null,
   constraint pk_notacorretagem PRIMARY KEY (cd_nota),
   constraint fk_notacorretagem_conta FOREIGN KEY (cd_conta)
              REFERENCES conta (cd_conta))
              
CREATE SEQUENCE sq_notacorretagem
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
       
--NOTACORRETAGEMLANCAMENTO--

CREATE TABLE notalanc(
   cd_nota number(12) not null,
   cd_ativo number(6) not null,
   nm_qtde number(6),
   nm_valor number(12,3),
   cd_gptrans number(6) not null,
   cd_usuario number(6) not null,
   constraint fk_notalanc_gptrans FOREIGN KEY (cd_gptrans)
              REFERENCES gptrans(cd_gptrans))
            