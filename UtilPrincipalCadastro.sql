###GRUPO###

SELECT cd_grupo, ds_grupo, cd_usuario
       FROM grupo
       ORDER BY cd_grupo DESC
       
###CATEGORIA###

SELECT cd_categoria, ds_categoria, cd_grupo, cd_usuario
  FROM categoria
       
###PRESTADOR SERVICO###

SELECT cd_presserv, ds_presserv, ds_razaosocial, nm_documento, cd_usuario
  FROM presserv
 ORDER BY cd_presserv     
       
SELECT presserv.cd_presserv, ds_presserv, ds_razaosocial, nm_documento, presserv.cd_usuario
  FROM presserv, modulo, presservmod
 WHERE modulo.cd_modulo = 1
   AND modulo.cd_modulo = presservmod.cd_modulo
   AND presserv.cd_presserv = presservmod.cd_presserv
 ORDER BY ds_presserv  

###MODULO###
      
SELECT cd_modulo, ds_modulo FROM modulo
       ORDER BY cd_modulo

INSERT INTO modulo (cd_modulo, ds_modulo)
       VALUES (1, 'Financeiro')

INSERT INTO modulo (cd_modulo, ds_modulo)
       VALUES (2, 'Animal')
       
INSERT INTO modulo (cd_modulo, ds_modulo)
       VALUES (3, 'Veiculo')
       
INSERT INTO modulo (cd_modulo, ds_modulo)
       VALUES (4, 'Imovel')

INSERT INTO modulo (cd_modulo, ds_modulo)
       VALUES (5, 'Catalogo')

###PRESSERVMOD###

SELECT cd_modulo, cd_presserv, cd_usuario
       FROM presservmod

SELECT modulo.cd_modulo, presserv.cd_presserv, presservmod.cd_usuario
       FROM modulo, presserv, presservmod
       WHERE modulo.cd_modulo = presservmod.cd_modulo
         AND modulo.cd_modulo = 1
         AND presserv.cd_presserv = presservmod.cd_presserv
   
###CATMOD###

SELECT cd_modulo, cd_categoria, cd_usuario
       FROM catmod
       
SELECT modulo.cd_modulo, categoria.cd_categoria, catmod.cd_usuario
       FROM modulo, categoria, catmod
       WHERE modulo.cd_modulo = catmod.cd_modulo
         AND categoria.cd_categoria = catmod.cd_categoria

