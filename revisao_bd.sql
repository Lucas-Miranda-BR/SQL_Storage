create database if not exists pizzaria;
use pizzaria;

create table if not exists cliente(
id int primary key auto_increment,
nome varchar(50) not null,
endereco varchar(50) not null
)engine=innodb;

create table if not exists pedido(
id int primary key auto_increment,
id_cliente int,
data_hora timestamp default current_timestamp,
valor decimal(8,2) not null,
forma_paga varchar(20) not null
)engine=innodb;

create table if not exists pedido_detalhe(
id_pedido int,
id_pizza int,
subtotal decimal(8,2) not null,
borda varchar(20) not null,
formato varchar(20) not null,
quantidade int not null,
primary key (id_pedido, id_pizza)
)engine=innodb;

create table if not exists pizza(
id int primary key auto_increment,
descricao varchar(55) not null,
valor decimal(8,2)
)engine=innodb;

create table if not exists pedido_bebida(
id_pedido int,
id_bebida int,
subtotal decimal(8,2) not null,
quantidade int not null,
primary key (id_pedido, id_bebida)
)engine=innodb;

create table if not exists bebida(
id int primary key,
marca varchar(50) not null,
tamanho varchar(20) not null,
valor decimal(8,2) not null,
descricao varchar(50) not null
)engine=innodb;

create table if not exists pizza_ingrediente(
id_pizza int,
id_ingrediente int,
quantidade int not null,
primary key (id_pizza, id_ingrediente)
)engine=innodb;

create table if not exists ingrediente(
id int primary key auto_increment,
marca varchar(50) not null,
descricao varchar(50) not null
)engine=innodb;

alter table pedido add constraint fk_pedido_x_cliente foreign key pedido(id_cliente) references cliente(id);

alter table pedido_bebida add constraint fk_pedido_bebida_x_bebida foreign key pedido_bebida(id_bebida) references bebida(id);
alter table pedido_bebida add constraint fk_pedido_bebida_x_pedido foreign key pedido_bebida(id_pedido) references pedido(id);

alter table pedido_detalhe add constraint fk_pedido_detalhe_x_pedido foreign key pedido_detalhe(id_pedido) references pedido(id);
alter table pedido_detalhe add constraint fk_pedido_detalhe_x_pizza foreign key pedido_detalhe(id_pizza) references pizza(id);

alter table pizza_ingrediente add constraint fk_pizza_ingrediente_x_pizza foreign key pizza_ingrediente(id_pizza) references pizza(id);
alter table pizza_ingrediente add constraint fk_pizza_ingrediente_x_ingrediente foreign key pizza_ingrediente(id_ingrediente) references ingrediente(id);
