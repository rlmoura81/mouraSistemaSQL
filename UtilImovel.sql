###TIPO IMOVEL###

SELECT cd_tpimovel, ds_tpimovel
       FROM tipoimovel
       
INSERT INTO tipoimovel (cd_tpimovel, ds_tpimovel)
       VALUES (1, 'APARTAMENTO')

INSERT INTO tipoimovel (cd_tpimovel, ds_tpimovel)
       VALUES (2, 'CASA')
              
###IMOVEL###  

SELECT cd_imovel,	nm_matricula, nm_metragem, nm_valor, ds_descricao, cd_tpimovel, cd_cidade, cd_usuario
       FROM imovel
       WHERE cd_usuario = 1

###IMOVEL DESPESA###

SELECT cd_despesa, dt_despesa, nm_nota, ds_descricao, nm_valor, cd_presserv, cd_imovel, cd_usuario
       FROM imovdesp