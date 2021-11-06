create table tags
(
    id   int auto_increment
        primary key,
    name varchar(255) not null
);

insert into tags (name) values ('tag1');
insert into tags (name) values ('tag2');
insert into tags (name) values ('tag3');
insert into tags (name) values ('tag4');
insert into tags (name) values ('tag5');

create table certificates
(
    id               int auto_increment
        primary key,
    name             varchar(255) not null,
    description      varchar(255) null,
    price            int          not null,
    duration         int          not null,
    create_date      timestamp    not null,
    last_update_date timestamp    not null
);

insert into certificates (name, description, price, duration, create_date, last_update_date)
values ('certificate1', 'description1', 1005, 10, '2021-11-01 12:00:00', '2021-11-01 12:00:00');
insert into certificates (name, description, price, duration, create_date, last_update_date)
values ('certificate2', 'description2', 105, 20, '2021-10-10 16:00:00', '2021-10-11 12:30:00');
insert into certificates (name, description, price, duration, create_date, last_update_date)
values ('certificate3', 'description3', 200, 3, '2021-11-02 10:00:00', '2021-11-03 12:00:00');
insert into certificates (name, description, price, duration, create_date, last_update_date)
values ('certificate4', 'description4', 150, 15, '2021-02-11 12:00:00', '2021-10-13 12:30:00');
insert into certificates (name, description, price, duration, create_date, last_update_date)
values ('certificate5', 'description5', 250, 10, '2021-10-15 18:00:00', '2021-10-16 12:30:00');

create table certificate_tag
(
    certificate_id int not null,
    tag_id         int not null,
    primary key (certificate_id, tag_id),
    constraint certificate_tag_ibfk_1
        foreign key (certificate_id) references certificates (id),
    constraint certificate_tag_ibfk_2
        foreign key (tag_id) references tags (id)
);

create index tag_id
    on certificate_tag (tag_id);

insert into certificate_tag (tag_id, certificate_id) values (5, 2);
insert into certificate_tag (tag_id, certificate_id) values (4, 2);
insert into certificate_tag (tag_id, certificate_id) values (4, 3);
insert into certificate_tag (tag_id, certificate_id) values (2, 4);
insert into certificate_tag (tag_id, certificate_id) values (1, 4);
insert into certificate_tag (tag_id, certificate_id) values (1, 5);