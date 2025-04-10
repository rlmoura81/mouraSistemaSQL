--VALOR TOTAL DE IMPOSTAO(IPTU E IPVA\LICENCIAMENTO)
SELECT sum(vl_debito)
       FROM movcx
       WHERE cd_categoria = 22 OR cd_categoria = 23
         AND dt_transacao BETWEEN (SELECT trunc(SYSDATE,'MM') FROM DUAL) AND (SELECT trunc(LAST_DAY(SYSDATE)) FROM DUAL)
         AND cd_usuario = 1

--VALORES DAS RAÇÕES
SELECT cd_produto, ds_descricao, nm_valor FROM animdesp
       WHERE cd_produto = 1 OR cd_produto = 2 OR cd_produto = 3
         AND cd_usuario = 1
         GROUP BY cd_produto, ds_descricao, nm_valor