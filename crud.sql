-- create database CRUD;
use CRUD;

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

create table produto(
id int primary key auto_increment,
descricao varchar(50) not null,
validade date,
quantidade int default 0,
id_marca int,
id_categoria int,
id_fornecedor int
)engine=innodb;

create table fornecedor(
id int primary key auto_increment
)engine=innodb;

create table pedido_detalhe(
id_produto int,
id_pedido int,
subtotal decimal(8,2) default 0,
quantidade int default 0
)engine=innodb;

create table marca(
id int primary key auto_increment,
id_produto int,
nome varchar(50) not null,
contato_nomeVendedor varchar(50) not null,
contato_telefoneVendedor char(11) unique
)engine=innodb;

create table categoria(
id int primary key auto_increment,
id_produto int,
descricao varchar(50) not null,
setor varchar(50) not null
)engine=innodb;

create table fornecedor(
id int primary key auto_increment,
razao_social varchar(50) not null,
nome_fantasia varchar(50) not null,
cnpj char(14) unique,
endereco varchar(50) not null,
bairro varchar(50) not null,
rua varchar(50) not null,
cep char(8) not null
)engine = innodb;

alter table categoria add constraint fk_categoriaXproduto foreign key categoria(id_produto) references produto(id);
alter table marca add constraint fk_marcaXproduto foreign key marca(id_produto) references produto(id);
alter table pedido_detalhe add constraint fk_pedido_detalheXproduto foreign key pedido_detalhe(id_produto) references produto(id);
alter table pedido_detalhe add constraint fk_pedido_detalheXpedido foreign key pedido_detalhe(id_pedido) references pedido(id);
alter table pedido add constraint fk_vendedorXpedido foreign key pedido(id_vendedor) references vendedor(id);

insert into produto(descricao, validade, quantidade) values("Mel do Abacaxi", '12-04-2037', 30);
insert into categoria(id_produto, descricao, setor) values(1, "Cosmestiveis Doces", "Doces / Salgados");
insert into marca(nome, contato_nomeVendedor, contato_telefoneVendedor) values("Meltz", "Pietro", 0055554444);
insert into pedido_detalhe values(1, 1, 5.99, 1);
insert into vendedor values(0, "Pedro", 3500.00, 99999999999, 12345678901);
insert into vendedor(nome, tel, cpf) values("Pablo", 88888888888, 09876543211);
insert into vendedor(nome, cpf) values("João", 01928374650);
insert into pedido(valor_total, id_vendedor) values(35.00, 3);
insert into pedido(valor_total, id_vendedor) values(71.40, 2);

select * from vendedor;
select * from pedido;
select * from marca;
select * from produto;
select * from pedido_detalhe;
select * from fornecedor;

delete from pedido where id = 2;
delete from produto where id = 2;

update vendedor set salario = 2500.00, tel = 10293847562 where id = 2;
update vendedor set salario = 1820.00, cpf = 9876543218, tel = 12345678900 where id = 3;
update marca set id_produto = 1, contato_telefoneVendedor = 9955554444 where id = 1;