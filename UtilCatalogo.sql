###TIPO MIDIA###

SELECT cd_tipomidia, ds_tipomidia
       FROM tipomidia
       
INSERT INTO tipomidia (cd_tipomidia, ds_tipomidia)
       VALUES (1, 'H.Q')

INSERT INTO tipomidia (cd_tipomidia, ds_tipomidia)
       VALUES (2, 'LIVRO')         

###STATUS###
   
SELECT cd_status, ds_status FROM status
   ORDER BY cd_status
   
INSERT INTO status (cd_status, ds_status)
   VALUES (1, 'Novo')

INSERT INTO status (cd_status, ds_status)
   VALUES (2, 'Conservado')   

INSERT INTO status (cd_status, ds_status)
   VALUES (3, 'Pendente')

INSERT INTO status (cd_status, ds_status)
   VALUES (4, 'Comprar')
      
###EDITORA###

CREATE TABLE editora(
	cd_editora number(6) not null,
	ds_nome varchar2(30),
  cd_usuario number(6) not null,
	constraint pk_editora	PRIMARY KEY (cd_editora))
    
CREATE SEQUENCE sq_editora
	START WITH 1
	INCREMENT BY 1
	NOCACHE
       
SELECT cd_editora, ds_nome FROM editora
       ORDER BY ds_nome

###CATALOGO###

SELECT cd_catalogo, ds_titulo, nm_numero, nm_volume, nm_edicao, ds_observacao, cd_tipomidia, cd_editora, cd_status, cd_usuario
  FROM catalogo
 WHERE cd_usuario = 1
 ORDER BY ds_titulo, nm_numero   
   
DECLARE
num NUMBER := 1;
BEGIN
 WHILE num <= 0 
   LOOP
     INSERT INTO catalogo(cd_catalogo, ds_titulo, nm_numero, nm_volume, nm_edicao, cd_tipomidia, cd_editora, cd_status, cd_usuario)
       VALUES(sq_catalogo.nextval, 'Wolverine (Panini Comics)', num, 31, 1, 1, 3, 1, 1);
     num := num + 1;
   END LOOP;
END;

    
    
    



