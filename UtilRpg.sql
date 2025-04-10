###DIARIO###
  
SELECT to_char(dt_diario,'dd/MM/yyyy'), diario.cd_tarefa, diario.cd_usuario
       FROM diario, tarefa
       WHERE diario.cd_usuario = 1
         AND diario.cd_tarefa = tarefa.cd_tarefa
         ORDER BY dt_diario, ds_tarefa

SELECT to_char(dt_diario,'dd/MM/yyyy'), diario.cd_tarefa, diario.cd_usuario
       FROM diario, tarefa
       WHERE diario.cd_usuario = 1
         AND diario.cd_tarefa = tarefa.cd_tarefa
         AND dt_diario = '14/01/2024'
         ORDER BY dt_diario, ds_tarefa
                  
SELECT to_char(dt_diario,'dd/MM/yyyy'), sum(nm_valor)
       FROM diario
       WHERE cd_usuario = 1
       GROUP BY dt_diario                
         
SELECT sum(nm_valor)
       FROM diario
       WHERE cd_usuario = 1         

--FECHA DIARIO MES;       
INSERT INTO diariomes (dt_diario, nm_valor, cd_tarefa, cd_usuario)
       (SELECT dt_diario, nm_valor, cd_tarefa, cd_usuario
                      FROM diario
                      WHERE cd_usuario = 1)
       
       