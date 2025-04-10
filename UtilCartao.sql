###CARTAOBANDEIRA###

SELECT cd_cartaobandeira, ds_cartaobandeira
       FROM cartaobandeira   
       
INSERT INTO cartaobandeira (cd_cartaobandeira, ds_cartaobandeira)     
       VALUES (1, 'VISA')

INSERT INTO cartaobandeira (cd_cartaobandeira, ds_cartaobandeira)     
       VALUES (2, 'MASTERCARD')
       
INSERT INTO cartaobandeira (cd_cartaobandeira, ds_cartaobandeira)     
       VALUES (3, 'ELO')
                    
###CARTAO###

SELECT cd_cartao, nm_cartao, nm_limite, dt_validade, cd_cartaobandeira, cd_banco, cd_usuario
FROM cartao

SELECT cartao.cd_cartao, sum(nm_valor)
       FROM cartao, cartaolanc
       WHERE cartao.cd_cartao = cartaolanc.cd_cartao
         AND cartao.cd_usuario = 1
       GROUP BY cartao.cd_cartao

###CARTAOLANCAMENTO###

SELECT cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario 
       FROM cartaolanc
       WHERE cd_usuario = 1

SELECT cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolanc
       WHERE cd_usuario = 1
       ORDER BY dt_despesa
       
SELECT cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolanc
       WHERE nm_parcela > 1
         AND cd_cartao = 1
         AND cd_usuario = 1
       ORDER BY dt_despesa
       
SELECT cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolanc
       WHERE extract(month from dt_despesa) = 12 
         AND extract (year from dt_despesa) = 2023
         AND nm_parcela > 1
         AND cd_cartao = 1
         AND cd_usuario = 1
       ORDER BY dt_despesa

SELECT ds_categoria, sum(nm_valor)
       FROM categoria, cartaolanc
       WHERE categoria.cd_categoria = cartaolanc.cd_categoria
       GROUP BY cartaolanc.cd_categoria, ds_categoria
       
SELECT cd_categoria, sum(nm_valor)
       FROM cartaolanc
       WHERE cd_usuario = 1
       GROUP BY cd_categoria
              
###CARTAOLANCAMENTOFECHAMENTO (cartaolancf)###

SELECT cd_cartaolancf, dt_fechamento, cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolancf
       WHERE cd_usuario = 1
       ORDER BY cd_cartaolancf DESC

SELECT cd_cartaolancf, dt_fechamento, cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolancf
       WHERE dt_fechamento = '05/03/2024'
         AND cd_cartao = 1 AND cd_usuario = 1
       ORDER BY dt_despesa

SELECT cd_cartaolancf, dt_fechamento, cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaolancf
       WHERE cd_cartao = 1 AND cd_usuario = 1
       ORDER BY cd_cartaolancf DESC, dt_despesa     
       
SELECT COUNT(cd_cartaolancf), dt_fechamento
       FROM cartaolancf     
       WHERE cd_cartao = 1 AND cd_usuario = 1
       GROUP BY dt_fechamento  
       ORDER BY dt_fechamento DESC       

SELECT dt_fechamento
       FROM cartaolancf
       WHERE cd_cartao = 1
         AND cd_usuario = 1
       GROUP BY dt_fechamento
              
SELECT categoria.cd_categoria, sum(nm_valor)
       FROM cartaolancf, categoria
       WHERE cd_cartao = 1
         AND dt_fechamento = '30/03/2023'
         AND cartaolancf.cd_categoria = categoria.cd_categoria
         AND cartaolancf.cd_usuario = 1
       GROUP BY categoria.cd_categoria, ds_categoria
       ORDER BY ds_categoria
              
SELECT cd_categoria, sum(nm_valor)
       FROM cartaolancf
       WHERE cd_cartao = 1
         AND dt_fechamento = '30/03/2023'
         AND cd_categoria = 7
         AND cd_usuario = 1
       GROUP BY cd_categoria
                     
INSERT INTO cartaolancf (cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, dt_despesa, cd_despesa, cd_categoria, cd_cartao, cd_usuario)    
       (SELECT cartaolanc.cd_cartaolanc, cartaolanc.ds_despesa, cartaolanc.nm_valor, cartaolanc.nm_parcela, cartaolanc.dt_despesa, cartaolanc.cd_despesa, cartaolanc.cd_categoria, cartaolanc.cd_cartao, cartaolanc.cd_usuario
              FROM cartaolanc)
                            
UPDATE cartaolancf SET cd_cartaolancf = 1, dt_fechamento = '01/01/1900'
       WHERE cd_cartaolancf is null
       
UPDATE cartaolancf SET nm_parcela = 3, dt_despesa = '28/02/2024'
       WHERE cd_cartaolanc = 127
         AND cd_cartaolancf = 4
         AND cd_cartao = 1
         AND cd_usuario = 1

UPDATE cartaolancf SET cd_categoria = 7
       WHERE cd_cartaolanc = 127
         AND cd_cartaolancf = 4
         AND cd_cartao = 1
         AND cd_usuario = 1

###CARTAOPARCELA (cartaoparc)###
       
SELECT cd_parcela, to_char(dt_parcela,'dd/MM/yyyy'), nm_parcelapag, cd_cartaolanc, ds_despesa, nm_valor, nm_parcela, to_char(dt_despesa,'dd/MM/yyyy'), cd_despesa, cd_categoria, cd_cartao, cd_usuario
       FROM cartaoparc
       ORDER BY cd_parcela, nm_parcelapag
       
DELETE FROM cartaoparc
       WHERE dt_parcela = '29/02/2024'
         AND cd_parcela = 0
         AND cd_cartao = 1
         AND cd_usuario = 1