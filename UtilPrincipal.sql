###ESTADO###
  
INSERT INTO estado (cd_estado, ds_estado, ds_siglaestado)
       VALUES (sq_estado.nextval, 'MINAS GERAIS', 'MG')
       
INSERT INTO estado (cd_estado, ds_estado, ds_siglaestado)
       VALUES (sq_estado.nextval, 'PARANÁ', 'PR')

INSERT INTO estado (cd_estado, ds_estado, ds_siglaestado)
       VALUES (sq_estado.nextval, 'RIO DE JANEIRO', 'RJ')

SELECT cd_estado, ds_estado, ds_siglaestado
       FROM estado

###CIDADE###
  
INSERT INTO cidade (cd_cidade, ds_cidade, cd_estado)
       VALUES (sq_cidade.nextval, 'VARGINHA', 1)
       
INSERT INTO cidade (cd_cidade, ds_cidade, cd_estado)
       VALUES (sq_cidade.nextval, 'MARINGÁ', 2)
       
INSERT INTO cidade (cd_cidade, ds_cidade, cd_estado)
       VALUES (sq_cidade.nextval, 'RIO DE JANEITO', 3)
       
SELECT cd_cidade, ds_cidade, cd_estado
       FROM cidade
       
###PESSOA FISICA###

SELECT cd_pessoafisica, ds_nome, dt_nascimento, nm_cpf, nm_rg, nm_cnh, cd_cidade
   FROM pessoafisica
   ORDER BY ds_nome
                         
INSERT INTO pessoafisica (cd_pessoafisica, ds_nome, dt_nascimento,
                   nm_cpf, nm_cnh, nm_rg, cd_cidade)
                    VALUES (sq_pessoafisica.nextval, 'Raphael Lucio Moura', '21/04/1981',
                    '03323280903', '00735123318', '7325304-7-PR', 1);

###USUARIO###

/*SELECT DE VALIDAÇÃO DE USUÁRIO*/
                              
SELECT usuario.cd_usuario, usuario.ds_login, usuario.ds_Senha, pessoafisica.cd_pessoafisica FROM usuario, pessoafisica
                     WHERE usuario.cd_pessoafisica = pessoafisica.cd_pessoafisica 
                     AND usuario.ds_login = 'raphaelmoura'
                     
SELECT usuario.cd_usuario, usuario.ds_login, pessoafisica.ds_nome FROM usuario, pessoafisica
       WHERE usuario.cd_pessoafisica = pessoafisica.cd_pessoafisica
             ORDER BY cd_usuario
             
SELECT cd_usuario, ds_login, ds_senha, cd_pessoafisica
       FROM usuario

INSERT INTO usuario (cd_usuario, ds_login, ds_senha, cd_pessoafisica)
       VALUES(1, 'raphaelmoura', 'moura', 1)
              
UPDATE usuario SET ds_senha = 'valor'
               WHERE cd_usuario = cd_usuario
               
