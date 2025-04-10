--TIPO CONTA--

SELECT cd_tpconta, ds_tpconta
  FROM tipoconta
       
INSERT INTO tipoconta (cd_tpconta, ds_tpconta)
     VALUES (1, 'CORRENTE')
       
INSERT INTO tipoconta (cd_tpconta, ds_tpconta)
     VALUES (2, 'POUPAN�A')
       
INSERT INTO tipoconta (cd_tpconta, ds_tpconta)
     VALUES (3, 'INVESTIMENTO')       
       
--BANCO--

SELECT cd_banco, ds_banco, nm_banco, cd_usuario
  FROM banco

--CONTA--

SELECT cd_conta, nm_agencia, nm_conta, cd_banco, cd_tpconta, cd_usuario
  FROM conta
 WHERE cd_usuario = 1
 ORDER BY cd_conta DESC
       
--CONTA SALDO--

SELECT cd_conta, vl_saldo, cd_usuario
  FROM contasaldo
 WHERE cd_usuario = 1

SELECT ds_banco, nm_conta, conta.cd_conta, vl_saldo, ds_tpconta
  FROM banco, conta, contasaldo, tipoconta
 WHERE banco.cd_banco = conta.cd_banco
   AND conta.cd_conta = contasaldo.cd_conta
   AND banco.cd_usuario = conta.cd_usuario
   AND conta.cd_tpconta = tipoconta.cd_tpconta
   AND conta.cd_usuario = 1
ORDER BY ds_banco
        
UPDATE contasaldo 
   SET vl_saldo = 31.37
 WHERE cd_conta = 5
   AND cd_usuario = 1
                                    
--DESPESA--

SELECT cd_despesa, ds_despesa, nm_valor, cd_categoria, cd_presserv, cd_usuario
  FROM despesa
 WHERE cd_usuario = 1
 ORDER BY cd_despesa
       
SELECT SUM(nm_valor)
  FROM despesa
 WHERE cd_usuario = 1
                 
SELECT categoria.cd_categoria, SUM(nm_valor)
  FROM despesa, categoria
 WHERE despesa.cd_categoria = categoria.cd_categoria
   AND despesa.cd_usuario = 1
 GROUP BY categoria.cd_categoria, ds_categoria
 ORDER BY ds_categoria
                                       
--INDICE--

SELECT cd_indice, ds_indice
  FROM indice
       
INSERT INTO indice (cd_indice, ds_indice)
     VALUES (1, 'IPC-A')
       
INSERT INTO indice (cd_indice, ds_indice)
     VALUES (2, 'SELIC')
       
INSERT INTO indice (cd_indice, ds_indice)
     VALUES (3, 'POUPANCA')
       
INSERT INTO indice (cd_indice, ds_indice)
     VALUES (4, 'IGP-M')

--INDICE VALOR--

SELECT cd_indicevl, vl_mes, dt_vlatualizado, cd_indice, cd_usuario
  FROM indicevalor
 ORDER BY cd_indicevl   

SELECT cd_indicevl, vl_mes, dt_vlatualizado, cd_indice, cd_usuario
  FROM indicevalor   
 WHERE cd_indice = 3
 ORDER BY dt_vlatualizado DESC
                     
--GRUPO TRANSACAO--

SELECT cd_gptrans, ds_gptrans 
  FROM gptrans
 ORDER BY cd_gptrans
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (1, 'Cr�dito')
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (2, 'D�bito')
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (3, 'Aplica��o')
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (4, 'Resgate')
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (5, 'Compra')
       
INSERT INTO gptrans (cd_gptrans, ds_gptrans)
     VALUES (6, 'Venda')
       
--TIPO TRANSACAO--

SELECT cd_tptrans, ds_tptrans, cd_gptrans
  FROM tptrans
 ORDER BY cd_tptrans
       
INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (1, 'Dep�sito', 1)

INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (2, 'Cr�dito em conta', 1)

INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (3, 'D�bito em conta', 2)
       
INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (4, 'DOC/TED', 2)
       
INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (5, 'PIX', 2)
                     
INSERT INTO tptrans (cd_tptrans, ds_tptrans, cd_gptrans)
     VALUES (6, 'Trans. Eletr�nica', 2)
       
--MOEDA--

SELECT cd_moeda, ds_moeda
  FROM moeda
       
INSERT INTO moeda (cd_moeda, ds_moeda)
     VALUES (1, 'Real BR')

INSERT INTO moeda (cd_moeda, ds_moeda)
     VALUES (2, 'Dolar US')
       
INSERT INTO moeda (cd_moeda, ds_moeda)
     VALUES (3, 'Euro UE')
       
INSERT INTO moeda (cd_moeda, ds_moeda)
     VALUES (4, 'Peso ARG')
       
--MOEDA VALOR--

SELECT cd_moedavl, vl_moeda, dt_valor, ds_moeda, cd_usuario
  FROM moedavalor, moeda
 WHERE moedavalor.cd_moeda = moeda.cd_moeda
 ORDER BY dt_valor, ds_moeda
       
--TIPO RENDA--

SELECT cd_tprenda, ds_tprenda
  FROM tprenda

INSERT INTO tprenda (cd_tprenda, ds_tprenda)
     VALUES (1, 'ALUGUEL')
              
INSERT INTO tprenda (cd_tprenda, ds_tprenda)
     VALUES (2, 'ATIVO')
       
--RENDA--
SELECT cd_renda, dt_renda, ds_renda, nm_valor, cd_tprenda, cd_usuario
  FROM renda
 WHERE cd_usuario = 1
   
SELECT cd_renda, dt_renda, ds_renda, nm_valor, cd_tprenda, cd_usuario
  FROM renda
 WHERE dt_renda BETWEEN '01/2/2023' AND '28/2/2023'
   AND cd_usuario = 1
   
DELETE FROM renda
 WHERE cd_renda = 13
   AND cd_usuario = 1
   
--MOVIMENTO CAIXA--

SELECT cd_movcx, dt_transacao, ds_descricao, vl_credito, vl_debito, nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcx
 WHERE cd_conta = 3
   AND cd_usuario = 1
 ORDER BY dt_transacao
  
SELECT cd_movcx, dt_transacao, ds_descricao, vl_credito, vl_debito, nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcx
 WHERE cd_usuario = 1
 ORDER BY dt_transacao 
       
SELECT SUM(vl_credito), SUM(vl_debito), SUM(vl_credito) - SUM(vl_debito)
  FROM movcx
 WHERE cd_conta = 3
   AND cd_usuario = 1

--SALDO TOTAL POR CONTA
SELECT cd_conta, SUM(vl_credito), SUM(vl_debito), SUM(vl_credito)-SUM(vl_debito)
  FROM movcx
 WHERE cd_usuario = 1
 GROUP BY cd_conta
 
SELECT cd_conta, SUM(vl_credito), SUM(vl_debito), SUM(vl_credito)-SUM(vl_debito)
  FROM movcx
 WHERE dt_transacao BETWEEN '01/01/2019' AND '31/01/2019'
   AND cd_usuario = 1
 GROUP BY cd_conta 
  
SELECT to_char(trunc(movcx.dt_transacao,'MON'), 'MON/YYYY') AS DATA, SUM(vl_credito), SUM(vl_debito), SUM(vl_credito)-SUM(vl_debito)
  FROM movcx
 WHERE cd_conta = 1
 GROUP BY trunc(movcx.dt_transacao,'MON')
 ORDER BY trunc(movcx.dt_transacao,'MON') 

SELECT SUM(vl_credito), SUM(vl_debito), SUM(vl_credito)-SUM(vl_debito)
  FROM movcx
 WHERE dt_transacao BETWEEN (SELECT add_months(trunc(sysdate,'mm'),-1) FROM dual) AND (SELECT last_day(add_months(trunc(sysdate,'mm'),-1)) FROM dual)
   AND cd_conta = 1
   AND cd_usuario = 1   
 GROUP BY cd_conta  

--FILTRO DE PESQUISA POR DATA       
SELECT cd_movcx, dt_transacao, ds_descricao, NVL(vl_credito,'0,00'), NVL(vl_debito,'0,00'), nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcx
 WHERE cd_conta = 1
   AND dt_transacao BETWEEN '01/11/2024' AND '30/11/2024'
   AND cd_usuario = 1
 ORDER BY dt_transacao
 
SELECT categoria.cd_categoria, SUM(NVL(vl_credito,'0,00')), SUM(NVL(vl_debito, '0,00'))
  FROM movcx, categoria
 WHERE cd_conta = 1
   AND dt_transacao BETWEEN '01/01/2023' AND '31/12/2023'
   AND movcx.cd_categoria = categoria.cd_categoria
   AND movcx.cd_usuario = 1
 GROUP BY categoria.cd_categoria, ds_categoria
 ORDER BY ds_categoria
         
--MES CORRENTE         
SELECT cd_movcx, dt_transacao, ds_descricao, vl_credito, vl_debito, nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcx
 WHERE cd_conta = 1
   AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL)
   AND cd_usuario = 1
                  
SELECT categoria.cd_categoria, SUM(NVL(vl_credito,'0,00')), SUM(NVL(vl_debito, '0,00'))
  FROM movcx, categoria
 WHERE cd_conta = 1
   AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL)
   AND movcx.cd_categoria = categoria.cd_categoria
   AND movcx.cd_usuario = 1
 GROUP BY categoria.cd_categoria, ds_categoria
 ORDER BY ds_categoria

--MES ANTERIOR
SELECT cd_movcx, dt_transacao, ds_descricao, vl_credito, vl_debito, nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcx
 WHERE cd_conta = 1
   AND dt_transacao >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1) AND dt_transacao < TRUNC(SYSDATE, 'MM')
   AND cd_usuario = 1  
         
--MOVIMENTO CAIXA LANCAMENTO FUTURO--

SELECT cd_movcxl, to_char(dt_transacao,'dd/MM/yyyy'), ds_descricao, vl_credito, nvl(vl_debito,'0,00'), nm_documento, cd_renda, cd_despesa, cd_categoria, cd_tptrans, cd_conta, cd_usuario
  FROM movcxl
 WHERE cd_usuario = 1
 ORDER BY cd_movcxl DESC
                                                                 
--ALUGUEL--
       
SELECT cd_aluguel, nm_contrato, nm_vlaluguel, nm_vladm, dt_deposito, TO_CHAR(dt_contratovenc,'dd/MM/yyyy'), cd_imovel, cd_presserv, cd_usuario
  FROM aluguel
 WHERE cd_usuario = 1
 ORDER BY nm_contrato
   