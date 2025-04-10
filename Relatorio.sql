--RELFIN000001 - RELATORIO DE CONTAS - SALDO ATUAL / CREDITO E DEBITO
SELECT  conta.cd_conta, vl_saldo, sum(vl_credito), sum(vl_debito)
       FROM conta, contasaldo, tipoconta, movcx
       WHERE conta.cd_conta = contasaldo.cd_conta
         AND conta.cd_conta = tipoconta.cd_tpconta
         AND conta.cd_tpconta = 1
         AND conta.cd_conta = movcx.cd_conta
         AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL) 
         AND conta.cd_usuario = 1
       GROUP BY conta.cd_conta, vl_saldo

--RELFIN000002 - RELATORIO DE DESPESA NO CAIXA POR GRUPO NO MES ATUAL         
SELECT movcx.cd_despesa, vl_debito
       FROM movcx, grupo, categoria, despesa
       WHERE categoria.cd_grupo = grupo.cd_grupo
         AND categoria.cd_grupo = 2
         AND despesa.cd_categoria = categoria.cd_categoria  
         AND movcx.cd_despesa = despesa.cd_despesa       
         AND movcx.cd_categoria = categoria.cd_categoria
         AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL)
         AND movcx.cd_usuario = 1

--RELFIN000003 - RELATORIO DE DESPESA NO CARTAO POR CATEGORIA  
SELECT categoria.cd_categoria, SUM(nm_valor)
       FROM cartaolanc, categoria
       WHERE cd_cartao = 1
         AND cartaolanc.cd_categoria = categoria.cd_categoria
         AND cartaolanc.cd_usuario = 1
       GROUP BY categoria.cd_categoria, ds_categoria
       ORDER BY ds_categoria  
         
--RELFIN000004 - RELATORIO DE CATEGORIA POR GRUPO EM CARTAO LANCAMENTOS       
SELECT categoria.cd_categoria, sum(nm_valor)
       FROM cartaolanc, grupo, categoria
       WHERE categoria.cd_grupo = grupo.cd_grupo
         AND grupo.cd_grupo = 1
         AND categoria.cd_categoria = cartaolanc.cd_categoria
         AND categoria.cd_usuario = 1
       GROUP BY categoria.cd_categoria

--RELFIN000005 - RELATORIO DE CATERIA EM CAIXA
SELECT categoria.cd_categoria, sum(vl_debito)
     FROM movcx, categoria
     WHERE cd_conta = 1
       AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL)
       AND movcx.cd_categoria = categoria.cd_categoria
       AND movcx.cd_usuario = 1
     GROUP BY categoria.cd_categoria, ds_categoria
     ORDER BY ds_categoria
                  
--RELFIN000006 - RELATORIO DE CATEGORIA POR GRUPO EM CAIXA   
SELECT categoria.cd_categoria, sum(vl_debito)
       FROM movcx, grupo, categoria
       WHERE categoria.cd_grupo = grupo.cd_grupo
         AND grupo.cd_grupo = 2
         AND categoria.cd_categoria = movcx.cd_categoria
         AND categoria.cd_usuario = 1
       GROUP BY categoria.cd_categoria