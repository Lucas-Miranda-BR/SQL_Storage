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
preco decimal(8,2) default 0,
validade date,
quantidade int default 0,
id_marca int,
id_categoria int,
id_fornecedor int
)engine=innodb;

create table pedido_detalhe(
id_produto int,
id_pedido int,
subtotal decimal(8,2) default 0,
quantidade int default 0,
primary key (id_pedido, id_produto)
)engine=innodb;

create table marca(
id int primary key auto_increment,
nome varchar(50) not null,
contato_nomeVendedor varchar(50) not null,
contato_telefoneVendedor char(11) unique
)engine=innodb;

create table categoria(
id int primary key auto_increment,
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
cidade varchar(50) not null,
estado varchar(50) not null,
cep char(8) not null,
telefone char(11) unique
)engine = innodb;

alter table pedido_detalhe add constraint fk_pedido_detalheXproduto foreign key pedido_detalhe(id_produto) references produto(id);
alter table pedido_detalhe add constraint fk_pedido_detalheXpedido foreign key pedido_detalhe(id_pedido) references pedido(id);
alter table pedido add constraint fk_vendedorXpedido foreign key pedido(id_vendedor) references vendedor(id);
alter table produto add constraint fk_produtoXmarca foreign key produto(id_marca) references marca(id);
alter table produto add constraint fk_produtoXcategoria foreign key produto(id_categoria) references categoria(id);
alter table produto add constraint fk_produtoXfornecedor foreign key produto(id_fornecedor) references fornecedor(id);
