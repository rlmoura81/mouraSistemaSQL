###ESPECIE###

SELECT cd_especie, ds_especie
       FROM especie
       
INSERT INTO especie (cd_especie, ds_especie)
       VALUES (1, 'Canina')

INSERT INTO especie (cd_especie, ds_especie)
       VALUES (2, 'Felina')  
      
###ANIMAL DESPESA###

SELECT cd_despesa, dt_despesa, nm_nota, ds_descricao, nm_valor, cd_presserv, cd_animal, cd_produto, cd_usuario
  FROM animdesp
 WHERE cd_usuario = 1   
 ORDER BY cd_despesa     

DELETE FROM animdesp
 WHERE cd_despesa = 
   AND cd_usuario = 1
          
###TIPO HISTORICO###

SELECT cd_tipo, ds_tipo FROM tphist

INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (1, 'Consulta')
       
INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (2, 'Exame')
       
INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (3, 'Cio')

INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (4, 'PetShop')
       
INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (5, 'Cirurgia')       
                     
INSERT INTO tphist (cd_tipo, ds_tipo)
       VALUES (6, 'Vacina')       
                            
###HISTORICO###

SELECT cd_historico, dt_historico, ds_historico, cd_presserv, cd_animal, cd_tipo, cd_usuario
  FROM historico
