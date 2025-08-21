create database if not exists CRUD;
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

insert into marca values (0, "Tecmanta", "Cath", 55998877665);
insert into marca values (1, "VOOR", "Pieto", 15557699014);
insert into marca values (2, "Tuci", "Emila", 11092587621);
insert into marca values (3, "Pings", "Micel", 88234526191);
insert into marca values (4, "Baltmor", "Annm", 35812976181);

insert into categoria values(0, "Eletronicos", "A1");
insert into categoria values(1, "Veiculos", "F8");
insert into categoria values(2, "Cosmeticos", "B7");
insert into categoria values(3, "Alimentos", "C2");
insert into categoria values(4, "Beleza", "D5");

insert into fornecedor values(0, "Tecnologia Manta", "Tecmanta", 12345678904444, "Prae - Almen - Tremu - SA - 31228421", "Almen", "Tremu", "SA", 31228421, 99882431223);
insert into fornecedor values(1, "Veiculos Off-On Road", "VOOR", 12309874651029, "Micha - Mong - Haeiko - KH - 12981243", "Mong", "Haeiko", "KH", 12981243, 81029376102);
insert into fornecedor values(2, "Tuci Inc.", "Tuci", 36120896123412, "Orlean - Albe - Lorman - BT - 81720991", "Albe", "Lorman", "BT", 81720991, 98152378650);
insert into fornecedor values(3, "Pingster", "Pings", 14141414141414, "Roux - Rhodion - Lun - MY - 10235421", "Rhodion", "Lun", "MY", 10235421, 11111111111);
insert into fornecedor values(4, "Baltmor B.", "Baltmor", 12344321098756, "Razu - Bharn - Ushnk - ZN - 52980923", "Almen", "Tremu", "SA", 52980923, 2174096328905);

insert into vendedor values(0, "Maro", 1850.00, 87903223101, 98076523181);
insert into vendedor values(1, "Lugi", 2000.00, 902367891, 98761234560);
insert into vendedor values(2, "Peaco", 1710.00, x, x);
insert into vendedor values(3, "x", x.00, x, x);
insert into vendedor values(4, "x", x.00, x, x);
