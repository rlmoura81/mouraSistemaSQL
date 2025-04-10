###TIPOCONTA###

CREATE TABLE tipoconta(
  cd_tpconta number(6) not null,
  ds_tpconta varchar2(20),
    constraint pk_tpconta PRIMARY KEY (cd_tpconta));

###BANCO###

CREATE TABLE banco (
	cd_banco number(6) not null,
	ds_banco varchar2 (35),
	nm_banco number(6),
  cd_usuario number(6) not null,
	  constraint pk_banco PRIMARY KEY (cd_banco));
  
CREATE SEQUENCE sq_banco
	START WITH 1
	INCREMENT BY 1
	NOCACHE;

###CONTA###

CREATE TABLE conta(
	cd_conta number(6) not null,
  nm_agencia varchar2(10),
	nm_conta varchar2(15),
	cd_banco number(6),
	cd_usuario number(6),
  cd_tpconta number(6),
		constraint pk_conta PRIMARY KEY (cd_conta),
		constraint fk_conta_banco FOREIGN KEY (cd_banco)
			REFERENCES banco (cd_banco),
    constraint fk_conta_tpconta FOREIGN KEY (cd_tpconta)
      REFERENCES tipoconta (cd_tpconta))
           
CREATE SEQUENCE sq_conta
	START WITH 1
	INCREMENT BY 1
	NOCACHE;      
    
###CONTASALDO###

CREATE TABLE contasaldo(
   cd_conta number(6) not null,
   vl_saldo number(12,2),
   cd_usuario number(6) not null,
     constraint pk_contasaldo PRIMARY KEY (cd_conta),
     constraint fk_contasaldo_conta FOREIGN KEY (cd_conta)
       REFERENCES conta (cd_conta))
       
###DESPESA###

CREATE TABLE despesa(
	cd_despesa number(6) not null,
	ds_despesa varchar2(45),
	nm_valor number(12,2),
	cd_categoria number(6),
	cd_presserv number(6),
	cd_usuario number(6),
		constraint pk_despesa PRIMARY KEY (cd_despesa),
		constraint fk_despesa_categoria FOREIGN  KEY (cd_categoria)
			REFERENCES categoria(cd_categoria),
		constraint fk_despesa_presserv FOREIGN KEY (cd_presserv)
			REFERENCES presserv (cd_presserv))

CREATE SEQUENCE sq_despesa
	START WITH 1
	INCREMENT BY 1
	NOCACHE;
          
###INDICE###

CREATE TABLE indice(
   cd_indice number(6) not null,
   ds_indice varchar2(10),
     constraint pk_indice PRIMARY KEY (cd_indice))

###INDICEVALOR###

CREATE TABLE indicevalor(
   cd_indicevl number(6) not null,
   vl_mes number(12,3),
   dt_vlatualizado date,
   cd_indice number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_indicevalor PRIMARY KEY (cd_indicevl),
     constraint fk_indicevalor_indice FOREIGN KEY (cd_indice)
       REFERENCES indice (cd_indice))
      
CREATE SEQUENCE sq_indicevl
   START WITH 1
   INCREMENT BY 1
   NOCACHE;
       
###GRUPOTRANSACAO###

CREATE TABLE gptrans(
   cd_gptrans number(6) not null,
   ds_gptrans varchar2(20),
     constraint pk_gptrans PRIMARY KEY (cd_gptrans))

###TIPOTRANSACAO###

CREATE TABLE tptrans(
   cd_tptrans number(6) not null,
   ds_tptrans varchar2(20),
   cd_gptrans number(6) not null,
     constraint pk_tptrans PRIMARY KEY (cd_tptrans),
     constraint fk_tptrans_gptrans FOREIGN KEY (cd_gptrans)
       REFERENCES gptrans (cd_gptrans))
              
###MOEDA###

CREATE TABLE moeda(
   cd_moeda number(6) not null,
   ds_moeda varchar2(10),
   constraint pk_moeda PRIMARY KEY (cd_moeda))
   
###MOEDAVALOR###

CREATE TABLE moedavalor(
   cd_moedavl number(6) not null,
   vl_moeda number(12,3),
   dt_valor date,
   cd_moeda number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_moedavalor PRIMARY KEY (cd_moedavl),
     constraint fk_moedavalor_moeda FOREIGN KEY (cd_moeda)
       REFERENCES moeda (cd_moeda))

CREATE SEQUENCE sq_moedavl
   START WITH 1
   INCREMENT BY 1
   NOCACHE;
   
###TIPORENDA###

CREATE TABLE tprenda(
   cd_tprenda number(6) not null,
   ds_tprenda varchar2(20),
     constraint pk_tprenda PRIMARY KEY (cd_tprenda))
   
###RENDA###

CREATE TABLE renda(
   cd_renda number(6) not null,
   dt_renda date,
   ds_renda varchar2(45),
   nm_valor number(12,2),
   cd_tprenda number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_renda PRIMARY KEY (cd_renda),
     constraint fk_tprenda_renda FOREIGN KEY (cd_tprenda)
       REFERENCES tprenda (cd_tprenda))

CREATE SEQUENCE sq_renda
   START WITH 1
   INCREMENT BY 1
   NOCACHE;
   
###MOVIMENTOCAIXA###

CREATE TABLE movcx(
   cd_movcx number(9) not null,
   dt_transacao date,
   ds_descricao varchar2(100),
   vl_credito number(12,2),
   vl_debito number(12,2),
   nm_documento varchar2(15),
   cd_renda number(6),
   cd_despesa number(6),
   cd_categoria number(6),
   cd_tptrans number(6) not null,
   cd_conta number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_movcx PRIMARY KEY (cd_movcx),
     constraint fk_tptrans_movcx FOREIGN KEY (cd_tptrans)
       REFERENCES tptrans (cd_tptrans),
     constraint fk_conta_movcx FOREIGN KEY (cd_conta)
       REFERENCES conta (cd_conta))
       
--NÃO USAR - RESTRICAO DE FK_      
CREATE TABLE movcx(
   cd_movcx number(9) not null,
   dt_transacao date,
   ds_descricao varchar2(60),
   vl_credito number(12,2),
   vl_debito number(12,2),
   nm_documento varchar2(15),
   cd_renda number(6),
   cd_despesa number(6),
   cd_categoria number(6),
   cd_tptrans number(6) not null,
   cd_conta number(6) not null,
   cd_usuario number(6) not null,
     constraint pk_movcx PRIMARY KEY (cd_movcx),
     constraint fk_renda_movcx FOREIGN KEY (cd_renda)
       REFERENCES renda (cd_renda),
     constraint fk_despesa_movcx FOREIGN KEY (cd_despesa)
       REFERENCES despesa (cd_despesa),
     constraint fk_categoria_movcx FOREIGN KEY (cd_categoria)
       REFERENCES categoria (cd_categoria),
     constraint fk_tptrans_movcx FOREIGN KEY (cd_tptrans)
       REFERENCES tptrans (cd_tptrans),
     constraint fk_conta_movcx FOREIGN KEY (cd_conta)
       REFERENCES conta (cd_conta))
       
CREATE SEQUENCE sq_movcx
       START WITH 1
       INCREMENT BY 1
       NOCACHE

###MOVIMENTOCAIXALANCAMENTO###

CREATE TABLE movcxl(
   cd_movcxl number(9) not null,
   dt_transacao date,
   ds_descricao varchar2(100),
   vl_credito number(12,2),
   vl_debito number(12,2),
   nm_documento varchar2(15),
   cd_renda number(6),
   cd_despesa number(6),
   cd_categoria number(6),
   cd_tptrans number(6) not null,
   cd_conta number(6) not null,
   cd_usuario number(6) not null)
                            
###ALUGUEL###

CREATE TABLE aluguel(
   cd_aluguel number(6) not null,
   nm_contrato varchar2(10),
   nm_vlaluguel number(12,2),
   nm_vladm number(12,2),
   dt_deposito number(6),
   dt_contratovenc date,
   cd_imovel number(6) not null,
   cd_presserv number(6),
   cd_usuario number(6) not null,
     constraint pk_aluguel PRIMARY KEY (cd_aluguel),
     constraint fk_aluguel_imovel FOREIGN KEY (cd_imovel)
                REFERENCES imovel (cd_imovel))
                
CREATE SEQUENCE sq_aluguel
       START WITH 1
       INCREMENT BY 1
       NOCACHE;
       

