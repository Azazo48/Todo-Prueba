create database tudu;

use tudu;

create table users (
    id int auto_increment primary key,
    name varchar(255),
    email varchar(255) unique not null,
    password varchar(255)
);


create table tudus (
    id int auto_increment primary key,
    title varchar(255),
    completed boolean default false,
    user_id int not null,
    foreign key (user_id) references user(id) on delete cascade
);

create table shared_tudus (
    id int auto_increment primary key,
    todo_id int,
    user_id int,
    shared_with_id int,
    foreign key (todo_id) references tudus(id) on delete cascade,
    foreign key (user_id) references users(id) on delete cascade,
    foreign key (shared_with_id) references users(id) on delete cascade
);

insert into users (name, email, password) values ('Hassiel', 'hassielcuadrasraygoza@gmail.com', 'password');
insert into users (name, email, password) values ('Adrian', 'adrian@gmail.com', 'adrian');

insert into tudus (title, user_id)
values
("Ir a caminar", 1),
("Desayunar", 1),
("Ir a la tienda", 1),
("Ir a trabajar", 1),
("Hacer cena", 1);

insert into shared_tudus (todo_id, user_id, shared_with_id)
values(1,1,2);

select tudus.*, shared_tudus.shared_with_id
from tudus
left join shared_tudus on tudus.id = shared_tudus.todo_id
where tudus.user_id = [user_id] or shared_tudus.shared_with_id;