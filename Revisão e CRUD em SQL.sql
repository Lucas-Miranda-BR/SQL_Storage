-- create database revisao;
use revisao;

create table vendedor(
id int primary key auto_increment,
nome varchar(50) not null,
salario decimal(8,2) default 0,
cpf char(11) unique,
tel char(11) unique
)engine=innodb;

create table pedido(
id int primary key auto_increment,
data_ped timestamp default current_timestamp,
valor_total decimal(8,2) default 0,
id_vendedor int
)engine=innodb;

alter table pedido add constraint fk_vendedorXpedido foreign key pedido(id_vendedor) references vendedor(id);

-- Inseir valores

insert into vendedor values(0, "Pedro", 3500.00, 99999999999, 12345678901);
insert into vendedor(nome, tel, cpf) values("Pablo", 88888888888, 09876543211);
insert into vendedor(nome, cpf) values("João", 01928374650);

-- Consulta de dados

select * from vendedor;

insert into pedido(valor_total, id_vendedor) values(35.00, 3);
insert into pedido(valor_total, id_vendedor) values(71.40, 2);

select * from pedido;

-- Apagar dados em uma tabela

delete from pedido where id=2;

-- Alterar dados de uma tabela

update vendedor set salario = 2500.00, tel = 10293847562 where id = 2;
update vendedor set salario = 1820.00, cpf = 9876543218 where id = 3;