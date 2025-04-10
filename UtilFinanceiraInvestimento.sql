--TPATIVO--
     
SELECT cd_tpativo, ds_tpativo
  FROM tpativo

INSERT INTO tpativo (cd_tpativo, ds_tpativo)
     VALUES (1, 'Ação')
       
INSERT INTO tpativo (cd_tpativo, ds_tpativo)
     VALUES (2, 'Fundo Imobiliário')

INSERT INTO tpativo (cd_tpativo, ds_tpativo)
     VALUES (3, 'Devenduris')
       
INSERT INTO tpativo (cd_tpativo, ds_tpativo)
     VALUES (4, 'NTN-B')
         
--ATIVO--
   
SELECT cd_ativo, ds_ativo, ds_sgativo, nm_cnpj, cd_tpativo, cd_usuario
  FROM ativo
 ORDER BY ds_sgativo
   
--Filtro para ativos.   
SELECT cd_ativo, ds_ativo, ds_sgativo, nm_cnpj, cd_tpativo, cd_usuario
  FROM ativo
 WHERE cd_tpativo = 1
 ORDER BY ds_sgativo   

--Filtro para ativos com proventos. 
SELECT ativo.cd_ativo, ds_ativo, ds_sgativo, nm_cnpj, cd_tpativo, ativo.cd_usuario
  FROM ativo, acaoprov
 WHERE acaoprov.cd_ativo = ativo.cd_ativo
   AND acaoprov.cd_tpprovento = 2
   
--Filtro para ativos com proventos e saldo. 
SELECT ativo.cd_ativo, ds_ativo, ds_sgativo, nm_cnpj, cd_tpativo, ativo.cd_usuario
  FROM ativo, ativosaldo, acaoprov
 WHERE cd_tpativo = 1
   AND nm_qtde > 0
   AND ativo.cd_ativo = ativosaldo.cd_ativo
   AND ativo.cd_ativo = acaoprov.cd_ativo
   AND acaoprov.cd_tpprovento = 2 
      
--ATIVOSALDO--

SELECT cd_ativo, nm_qtde, cd_usuario
  FROM ativosaldo

SELECT ativosaldo.cd_ativo, nm_qtde, ativosaldo.cd_usuario
  FROM ativosaldo, ativo
 WHERE ativosaldo.cd_ativo = ativo.cd_ativo
   AND ativo.cd_tpativo = 2
   AND ativosaldo.cd_usuario = 1
       
INSERT INTO ativosaldo (cd_ativo, nm_qtde, cd_usuario)
     VALUES (1, 2, 1)
       
DELETE FROM ativosaldo

--POUPANCA--
       
SELECT cd_poupanca, nm_variacao, vl_saldo, cd_conta, cd_usuario
  FROM poupanca

--POUPANCATRANSACAO--

SELECT cd_pouptrans, vl_transacao, dt_transacao, cd_gptrans, cd_poupanca, cd_usuario
  FROM pouptrans
                 
--POUPANCAAPLICACAO--    
       
SELECT cd_poupaplic, vl_saldo, dt_saldo, cd_poupanca, cd_usuario
  FROM poupaplic

SELECT cd_poupaplic, vl_saldo, dt_saldo, cd_poupanca, cd_usuario
  FROM poupaplic
 WHERE cd_poupanca = 1
                  
--RENDAFIXA--
       
SELECT cd_rendafixa, ds_rendafixa, vl_aplicado, vl_taxa, to_char(dt_aplicacao,'dd/MM/yyyy'),to_char(dt_vencimento,'dd/MM/yyyy'), cd_indice, cd_tpativo, cd_usuario
  FROM rendafixa
 ORDER BY ds_rendafixa      
          
--TIPOPROVENTO--
       
SELECT cd_tpprovento, ds_tpprovento 
  FROM tpprovento

SELECT cd_tpprovento, ds_tpprovento 
  FROM tpprovento
 WHERE cd_tpprovento = 2
       
SELECT DISTINCT tpprovento.cd_tpprovento, ds_tpprovento 
  FROM tpprovento, acaoprov
 WHERE tpprovento.cd_tpprovento = acaoprov.cd_tpprovento
       
SELECT DISTINCT tpprovento.cd_tpprovento, ds_tpprovento 
  FROM tpprovento, fdimprov
 WHERE tpprovento.cd_tpprovento = fdimprov.cd_tpprovento

INSERT INTO tpprovento (cd_tpprovento, ds_tpprovento)
     VALUES (1, 'RENDIMENTOS DE CLIENTE')

INSERT INTO tpprovento (cd_tpprovento, ds_tpprovento)
     VALUES (2, 'JUROS S/ CAPITAL DE CLIENTES')
       
INSERT INTO tpprovento (cd_tpprovento, ds_tpprovento)
     VALUES (3, 'DIVIDENDOS DE CLIENTES')
       
--FUNDOIMOBILIARIOPROVENTO--
                        
SELECT cd_fdimprov, fdimprov.cd_ativo, ds_ativo, dt_pagamento, vl_provento, dt_precobase, vl_database, fdimprov.cd_tpprovento,fdimprov.cd_usuario
  FROM fdimprov, ativo, tpprovento
 WHERE fdimprov.cd_ativo = ativo.cd_ativo 
   AND fdimprov.cd_tpprovento = tpprovento.cd_tpprovento
             
SELECT MAX(dt_pagamento)
  FROM fdimprov, ativo
 WHERE fdimprov.cd_ativo = ativo.cd_ativo
   AND ativo.cd_ativo = 3

SELECT cd_fdimprov, fdimprov.cd_ativo, ds_ativo, dt_pagamento, vl_provento, dt_precobase, vl_database, fdimprov.cd_tpprovento,fdimprov.cd_usuario
  FROM fdimprov, ativo, tpprovento
 WHERE fdimprov.cd_ativo = ativo.cd_ativo
   AND fdimprov.cd_tpprovento = tpprovento.cd_tpprovento
   AND ativo.cd_ativo = 1
   AND dt_pagamento = (SELECT MAX(dt_pagamento)
                         FROM fdimprov, ativo
                        WHERE fdimprov.cd_ativo = ativo.cd_ativo
                          AND ativo.cd_ativo = 1)

--Valor e data de provento.         
SELECT fdimprov.cd_ativo, dt_pagamento, vl_provento
  FROM fdimprov, ativo, tpprovento
 WHERE fdimprov.cd_ativo = ativo.cd_ativo
   AND fdimprov.cd_tpprovento = tpprovento.cd_tpprovento   
   AND dt_pagamento = (SELECT MAX(dt_pagamento)
                         FROM fdimprov, ativo
                        WHERE fdimprov.cd_ativo = ativo.cd_ativo
                          AND ativo.cd_ativo = 3)

--Calculo de valor de provento por FII.             
SELECT ativosaldo.cd_ativo, nm_qtde, nm_qtde*fdimprov.vl_provento AS vl_total
  FROM ativosaldo, ativo, fdimprov
 WHERE ativosaldo.cd_ativo = ativo.cd_ativo
   AND ativo.cd_ativo = fdimprov.cd_ativo
   AND ativo.cd_tpativo = 2
   AND ativosaldo.cd_usuario = 1
   AND dt_pagamento = (SELECT MAX(dt_pagamento)
                         FROM fdimprov, ativo
                        WHERE fdimprov.cd_ativo = ativo.cd_ativo
                          AND ativo.cd_ativo = ativosaldo.cd_ativo)
                                    
SELECT ativosaldo.cd_ativo, nm_qtde, nm_qtde*fdimprov.vl_provento AS vl_total
  FROM ativosaldo, ativo, fdimprov
 WHERE ativosaldo.cd_ativo = ativo.cd_ativo
   AND ativo.cd_ativo = fdimprov.cd_ativo
   AND ativo.cd_ativo = 3
   AND ativosaldo.cd_usuario = 1
   AND dt_pagamento = (SELECT MAX(dt_pagamento)
                         FROM fdimprov, ativo
                        WHERE fdimprov.cd_ativo = ativo.cd_ativo
                          AND ativo.cd_ativo = ativosaldo.cd_ativo)
                                                               
--ACAOPROVENTO--
     
SELECT cd_acaoprov, acaoprov.cd_ativo, dt_pagamento, vl_provento, dt_precobase, vl_database, acaoprov.cd_tpprovento, acaoprov.cd_usuario
  FROM acaoprov, ativo, tpprovento
 WHERE acaoprov.cd_ativo = ativo.cd_ativo
   AND acaoprov.cd_tpprovento = tpprovento.cd_tpprovento
         
--Calculo de valor de provento por AÇÃO.             
SELECT ativosaldo.cd_ativo, nm_qtde, nm_qtde*acaoprov.vl_provento AS vl_total
  FROM ativosaldo, ativo, acaoprov
 WHERE ativosaldo.cd_ativo = ativo.cd_ativo
   AND ativo.cd_ativo = acaoprov.cd_ativo
   AND ativo.cd_tpativo = 1
   AND ativosaldo.cd_usuario = 1
   AND dt_pagamento = (SELECT MAX(dt_pagamento)
                         FROM acaoprov, ativo
                        WHERE acaoprov.cd_ativo = ativo.cd_ativo
                          AND ativo.cd_ativo = ativosaldo.cd_ativo)
         
--GRUPOFUNDO--

SELECT cd_gpfundo, ds_gpfundo
  FROM gpfundo
       
INSERT INTO gpfundo (cd_gpfundo, ds_gpfundo)
     VALUES (1, 'Pós-Fixado')
       
INSERT INTO gpfundo (cd_gpfundo, ds_gpfundo)
     VALUES (2, 'Multimercados')
       
--FUNDOINVESTIMENTO--

SELECT cd_fdinvest, ds_fdinvest, cd_gpfundo, cd_usuario
  FROM fdinvest
       
SELECT cd_fdinvest, ds_fdinvest, cd_gpfundo, cd_usuario
  FROM fdinvest
 WHERE cd_fdinvest NOT IN (SELECT cd_fdinvest 
                             FROM fdinvestaplic 
                            WHERE cd_usuario = 1)

SELECT cd_fdinvest, ds_fdinvest, cd_gpfundo, cd_usuario
  FROM fdinvest
 WHERE cd_fdinvest NOT IN (SELECT cd_fdinvest 
                             FROM fdinvestaplic 
                            WHERE cd_conta = 4)
              
--FUNDOINVESTIMENTOAPLICACAO--

SELECT cd_fdinvestaplic, vl_saldo, cd_fdinvest, cd_conta, cd_usuario
  FROM fdinvestaplic
 ORDER BY cd_fdinvestaplic DESC
                    
--FUNDOINVESTIMENTOTRANSACAO--

SELECT cd_fdinvesttrans, vl_transacao, dt_transacao, cd_gptrans, cd_fdinvestaplic, cd_conta, cd_usuario
  FROM fdinvesttrans
 WHERE cd_usuario = 1
              
SELECT cd_fdinvesttrans, vl_transacao, dt_transacao, cd_gptrans, cd_fdinvestaplic, cd_conta, cd_usuario
  FROM fdinvesttrans
 WHERE cd_fdinvestaplic = 1
   AND cd_usuario = 1
         
--FUNDOINVESTIMENTORENDIMENTO--

SELECT cd_fdinvestrend, vl_rendimento, dt_rendimento, cd_fdinvestaplic, cd_usuario
  FROM fdinvestrend
       
--NOTACORRETAGEM--

SELECT cd_nota, nm_nota, dt_nota, cd_conta, cd_usuario
  FROM notacorretagem
 ORDER BY cd_nota
       
--NOTACORRETAGEMLANCAMENTO--

SELECT cd_nota, cd_ativo, nm_qtde, nm_valor, cd_gptrans, cd_usuario
  FROM notalanc
 ORDER BY cd_nota

SELECT notalanc.cd_nota, cd_ativo, nm_qtde, nm_valor, cd_gptrans, notalanc.cd_usuario
  FROM notalanc, notacorretagem
 WHERE notalanc.cd_nota = notacorretagem.cd_nota
 ORDER BY cd_nota
 

       