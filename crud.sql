create database if not exists CRUD;
use CRUD;

create table if not exists vendedor(
id int primary key auto_increment,
nome varchar(50) not null,
salario decimal(8,2) default 0,
cpf char(11) unique,
tel char(11) unique
)engine=innodb;

create table if not exists pedido(
id int primary key auto_increment,
data_ped timestamp default current_timestamp,
valor_total decimal(8,2) default 0,
id_vendedor int
)engine=innodb;

create table if not exists produto(
id int primary key auto_increment,
descricao varchar(50) not null,
preco decimal(8,2) default 0,
validade date,
quantidade int default 0,
id_marca int,
id_categoria int,
id_fornecedor int
)engine=innodb;

create table if not exists pedido_detalhe(
id_produto int,
id_pedido int,
subtotal decimal(8,2) default 0,
quantidade int default 0,
primary key (id_pedido, id_produto)
)engine=innodb;

create table if not exists marca(
id int primary key auto_increment,
nome varchar(50) not null,
contato_nomeVendedor varchar(50) not null,
contato_telefoneVendedor char(11) unique
)engine=innodb;

create table if not exists categoria(
id int primary key auto_increment,
descricao varchar(50) not null,
setor varchar(50) not null
)engine=innodb;

create table if not exists fornecedor(
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

insert into marca values (1, "Tecmanta", "Cath", 55998877665);
insert into marca values (2, "VOOR", "Pieto", 15557699014);
insert into marca values (3, "Tuci", "Emila", 11092587621);
insert into marca values (4, "Pings", "Micel", 88234526191);
insert into marca values (5, "Baltmor", "Annm", 35812976181);

insert into categoria values(1, "Eletronicos", "A1");
insert into categoria values(2, "Veiculos", "F8");
insert into categoria values(3, "Cosmeticos", "B7");
insert into categoria values(4, "Alimentos", "C2");
insert into categoria values(5, "Beleza", "D5");

insert into fornecedor values(1, "Tecnologia Manta", "Tecmanta", 12345678904444, "Prae - Almen - Tremu - SA - 31228421", "Almen", "Tremu", "SA", 31228421, 99882431223);
insert into fornecedor values(2, "Veiculos Off-On Road", "VOOR", 12309874651029, "Micha - Mong - Haeiko - KH - 12981243", "Mong", "Haeiko", "KH", 12981243, 81029376102);
insert into fornecedor values(3, "Tuci Inc.", "Tuci", 36120896123412, "Orlean - Albe - Lorman - BT - 81720991", "Albe", "Lorman", "BT", 81720991, 98152378650);
insert into fornecedor values(4, "Pingster", "Pings", 14141414141414, "Roux - Rhodion - Lun - MY - 10235421", "Rhodion", "Lun", "MY", 10235421, 11111111111);
insert into fornecedor values(5, "Baltmor B.", "Baltmor", 12344321098756, "Razu - Bharn - Ushnk - ZN - 52980923", "Almen", "Tremu", "SA", 52980923, 2174096328905);

insert into produto values(1, "Notebook", 5680.99, 25-09-2036, 1, 1, 1, 1);
insert into produto values(2, "Fusca", 3750.99, 06-12-2043, 1, 2, 2, 2);
insert into produto values(3, "Bolsa", 52.99, 12-01-2036, 1, 3, 3, 3);
insert into produto values(4, "Salgadinho", 7.99, 14-07-2028, 1, 4, 4, 4);
insert into produto values(5, "Smaltie", 54.99, 17-11-2028, 1, 5, 5, 5);

insert into vendedor values(1, "Yuki", 2240.00, 87903223101, 98076523181);
insert into vendedor values(2, "Maieko", 2420.00, 902367891, 98761234560);
insert into vendedor values(3, "Sinclair", 2710.00, 12348765213, 768594026);
insert into vendedor values(4, "Emil", 2450.00, 12456787696, 87234567281);
insert into vendedor values(5, "Meursault", 2340.00, 2412543211, 7654893219);

insert into pedido values(1, default, 5680.99, 1);
insert into pedido values(2, default, 3750.99, 2);
insert into pedido values(3, default, 52.99, 3);
insert into pedido values(4, default, 7.99, 4);
insert into pedido values(5, default, 54.99, 5);

insert into pedido_detalhe values(1, 1, 5680.99, 1);
insert into pedido_detalhe values(2, 2, 3750.99, 1);
insert into pedido_detalhe values(3, 3, 52.99, 1);
insert into pedido_detalhe values(4, 4, 7.99, 1);
insert into pedido_detalhe values(5, 5, 54.99, 1);

update produto set validade = "2036-09-25" where id = 1;
update produto set validade = "2043-12-06" where id = 2;
update produto set validade = "2036-01-12" where id = 3;
update produto set validade = "2028-07-14" where id = 4;
update produto set validade = "2028-11-17" where id = 5;

select * from marca;
select * from categoria;
select * from fornecedor;
select * from produto;
select * from vendedor;
select * from pedido;
select * from pedido_detalhe;
