insert into grupos values('SERVERS')
insert into maquinas values('KJSDF3331','NBTVALOURA','DATACRIACAO2','DATAULTIMOREPORT','DATAINVENTARIO','DATAENVIOINVENTARIO','ATIVO')
insert into relgrupo values(3,1)
insert into reltarefas values(2,4)
insert into softwares values('Firefox','53','Browser','\\localhost\Mozilla\firefox.exe','EXE','Mozilla','FREE','/qn /norestart')
insert into tarefas values('Atualiza Firefox',5,2,'16/06/2017 00:00:00',1)

--delete from maquinas where id = 5
select * from relgrupo
select * from maquinas
select COUNT(*) from grupos where nome_grupo = 
select COUNT(*) cont from grupos where nome_grupo = 'SERVERS'
select * from tarefas
select * from softwares
select * from reltarefas
select * from sincronismo_agente
select * from console_config
select * from grupos
insert into console_config values('tivit.corp','\\localhost\pacotes','\\localhost\pacotes\agent','tivit\antonio.rosario','Qa38igvpz')

--delete from reltarefas where fk_id_grupo = 1 and fk_id_tarefa = 2
select * from grupos
delete from grupos where id_grupo = 5

--Retorna lista de Grupos e maquinas relacionados
select  m.id,g.id_grupo,g.nome_grupo,m.Hostname from relgrupo r join grupos g on r.id_grupo = g.id_grupo join maquinas m on r.id_maquina = m.id where g.id_grupo = 1


--Retorna Grid de maquinas relacionadas a grupo
select  m.id,m.Hostname from relgrupo r join grupos g on r.id_grupo = g.id_grupo join maquinas m on r.id_maquina = m.id

--Retorna todos os dados cruzados
select m.Hostname,g.nome_grupo,t.nome_tarefa from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina


--Retorna lista de Tarefas designadas as maquinas e seus grupos
select g.nome_grupo,m.Hostname,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software) comando from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software
select * from pooltarefas

select t.nome_tarefa,g.nome_grupo from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software group by t.nome_tarefa,g.nome_grupo

--Retorna lista de Tarefas designadas as maquinas e seus grupos filtrando pelo hostname para sincronizar
select g.nome_grupo,m.Hostname,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software)comando,t.agendamento  from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software where m.Hostname = 'PCTITIOA102194'


select t.nome_tarefa,(s.Caminho_software+' '+s.Parametro_software) from dbo.tarefas t join softwares s on s.id_software = t.fk_id_software
--Retorna lista de Tarefas designadas as maquinas e seus grupos filtrando pelo hostname para sincronizar
select g.nome_grupo,m.Hostname,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software)comando,t.agendamento,'' status  from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software

select * from softwares
select * from tarefas
select * from dbo.sincronismo_agente
--delete from dbo.sincronismo_agente
update softwares set 

select * from dbo.console_config

--testes de sincronismo do agente
insert into dbo.sincronismo_agente values('10000')
update dbo.sincronismo_agente set tempo_sincronismo = 10000
alter table dbo.sincronismo_agente alter column tempo_sincronismo bigint

update maquinas set Hostname = 'PCTITIOA102194' where Hostname ='HOSTNAME1'

--query que retorna o grid de grupos
select gr.id_grupo,gr.nome_grupo 'Grupo',(select count(sv.Hostname) from (select g.nome_grupo,m.Hostname from relgrupo rg join grupos g on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina where g.id_grupo = gr.id_grupo) sv) as 'Total de Hosts',(select count(tg1.nome_grupo) from (select tg.nome_grupo from (select * from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa where g.id_grupo = gr.id_grupo) tg) tg1) as 'Tarefas Relacionadas' from grupos gr
select count(sv.Hostname) from (select g.nome_grupo,m.Hostname from relgrupo rg join grupos g on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina where g.id_grupo = 1) sv

--query que retorna lista de tarefas relacionadas a seus grupos
select * from (select tg.nome_grupo from (select * from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa ) tg) tg1

--query que retorna lista de tarefas e total de grupos relacionados
select ta.nome_tarefa Tarefa,(select count(tg.nome_grupo)cont from (select g.nome_grupo from reltarefas rt join grupos g on g.id_grupo = rt.fk_id_grupo join tarefas t on t.id_tarefa = rt.fk_id_tarefa where rt.fk_id_tarefa= ta.id_tarefa) tg) 'Total de grupos' from tarefas ta
select count(tg.nome_grupo)cont from (select g.nome_grupo from reltarefas rt join grupos g on g.id_grupo = rt.fk_id_grupo join tarefas t on t.id_tarefa = rt.fk_id_tarefa where t.id_tarefa = 5) tg
select * from tarefas
--delete from tarefas where id_tarefa = 5

--Retorna lista de tarefas para o cliente que conecta ao Webservice
select * from pooltarefas where hostname = 'PCTITIOA102194' and status <> '1' and convert(date,data_inicio) = convert(date,GETDATE())
select convert(date,GETDATE())
select convert(date,data_inicio) from pooltarefas

select * from pooltarefas where hostname = 'PCTITIOA102194' and status <> 1 and convert(date,data_inicio) = convert(date,GETDATE())
--alter table pooltarefas add retorno_execucao nvarchar(1000)
--alter table select * from dbo.sincronismo_agente
update console_config set senha_usuario_adm = 'Qa38igvpz'

truncate table pooltarefas
update pooltarefas set data_inicio = '05/06/2017 00:00:00' where hostname = 'PCTITIOA102194'

update pooltarefas set status = '0' where hostname = 'PCTITIOA102194'
update pooltarefas set status = '0' where ID=1
select * from pooltarefas where hostname = 'PCTITIOA102194' and status <> 1 and convert(date,data_inicio) = convert(date,'01/06/2017 10:24:35')

select g.nome_grupo,m.Hostname,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software)comando,t.agendamento,'' status  from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software
insert into pooltarefas(hostname,grupo,nome_tarefa,nome_software,descricao,comando,status,data_inicio,data_conclusao) select m.Hostname,g.nome_grupo,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software)comando,'' status,t.agendamento,'' data_conclusao  from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software

select m.Hostname,g.nome_grupo,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software)comando,'' status,t.agendamento,'' data_conclusao  from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software

update pooltarefas set status = ''
--Retorna lista de equipamentos que não estão em um grupo em questão
select distinct(m.Hostname),m.id  from relgrupo rg join maquinas m on rg.id_maquina = m.id join grupos g on g.id_grupo = rg.id_grupo where m.id not in (select m.id from relgrupo rg join maquinas m on rg.id_maquina = m.id join grupos g on g.id_grupo = rg.id_grupo where g.id_grupo =3)
select g.nome_grupo,m.Hostname,t.nome_tarefa,s.Nome_software,s.Descricao_software,(s.Caminho_software+' '+s.Parametro_software) comando from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo join tarefas t on rt.fk_id_tarefa = t.id_tarefa join relgrupo rg on rg.id_grupo = g.id_grupo join maquinas m on m.id = rg.id_maquina join softwares s on s.id_software = t.fk_id_software where g.id_grupo =3
delete from grupos where nome_grupo = 'NOTEBOOKS'
delete from relgrupo where id_maquina =3; delete from grupos where id_grupo = 3

--Retorna lista de Tarefas e a quantidade de grupos em que a tarefa se encontra relacionado.
--select nome_tarefa,count((select fk_id_grupo from reltarefas where fk_id_tarefa=t.id_tarefa))'Total de Grupos' from tarefas 
select t.id_tarefa ,t.nome_tarefa 'Tarefa',(select COUNT(sv.fk_id_tarefa) from (select fk_id_tarefa from reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo)sv where sv.fk_id_tarefa=t.id_tarefa)'Total de Grupos',(case t.status_tarefa when '1' then 'ATIVA' else 'INATIVA' END) 'Status' from tarefas t order by t.nome_tarefa
update tarefas set status_tarefa = 1 where id_tarefa =2

--Retorna combo de softwares da tela Adicionar tarefas
select * from tarefas
select id_software,Nome_software from softwares
select * from inventarios  
 --commit auto 
 -- Antonio Rosario Teste Julio 
--Query que retorna a lista tarefas ralcionadas a grupos que NÃO estão relacionados a respectiva tarefa
select g.nome_grupo from  reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo where g.id_grupo not in (select g.id_grupo from  reltarefas rt join grupos g on rt.fk_id_grupo = g.id_grupo where g.id_grupo= 2)
