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

create table tags
(
    id   int auto_increment
        primary key,
    name varchar(255) not null
);

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

create table users
(
    id         int auto_increment
        primary key,
    name       varchar(25)  not null,
    u_password varchar(255) not null,
    role       int          null
);

create table user_orders
(
    user_id        int       not null,
    certificate_id int       not null,
    price          int       null,
    date           timestamp null,
    id             int auto_increment
        primary key,
    constraint orders_certificates_id_fk
        foreign key (certificate_id) references certificates (id),
    constraint orders_users_id_fk
        foreign key (user_id) references users (id)
);

insert into users (id, name, u_password, role) values (1, 'Admin', '$2a$10$2JDPIjxlBw.iDbr1qMe6eOTl./rJw1CXyXvo2hW9RDCP6WyUY8trG', 2);
insert into users (id, name, u_password, role) values (2, 'Jamesy', 'rigdca9uYpG', 1);
insert into users (id, name, u_password, role) values (3, 'Codee', '0qoc6VXlGlB', 1);
insert into users (id, name, u_password, role) values (4, 'Harriett', '5ldN8B7OQOb', 1);
insert into users (id, name, u_password, role) values (5, 'Marve', 'Ey9dwjw19kqY', 1);
insert into users (id, name, u_password, role) values (6, 'Krisha', '05XU8Tp', 1);
insert into users (id, name, u_password, role) values (7, 'Nikita', 'xbLvjn', 1);
insert into users (id, name, u_password, role) values (8, 'Leland', 'Is7Er8RQ0Zv', 1);
insert into users (id, name, u_password, role) values (9, 'Conrad', 'gGIHGx2CNX', 1);
insert into users (id, name, u_password, role) values (10, 'Berkley', 'KyOXvAmBnXh', 1);
insert into users (id, name, u_password, role) values (11, 'Maurise', 'rrbP2HItEXJ', 1);
insert into users (id, name, u_password, role) values (12, 'Corly', 'Ov34w40', 1);
insert into users (id, name, u_password, role) values (13, 'Ervin', 'q4AwcB', 1);
insert into users (id, name, u_password, role) values (14, 'Harry', 'KZV5OToLBJ3', 1);
insert into users (id, name, u_password, role) values (15, 'Nat', 'o6CYT2e58BSY', 1);
insert into users (id, name, u_password, role) values (16, 'Tarrance', '1i0CBaFeL', 1);
insert into users (id, name, u_password, role) values (17, 'Ulrick', 'lKFOUzCO0AGS', 1);
insert into users (id, name, u_password, role) values (18, 'Sara', 'xsMKwBStGYq', 1);
insert into users (id, name, u_password, role) values (19, 'Phyllis', 'tqkxa8XHWU17', 1);
insert into users (id, name, u_password, role) values (20, 'Catlin', 'HzheBcIdPC8', 1);
insert into users (id, name, u_password, role) values (21, 'Sena', 'vO8kybTi65', 1);
insert into users (id, name, u_password, role) values (22, 'Kain', 'x216ZmPQXRh', 1);
insert into users (id, name, u_password, role) values (23, 'Reinaldos', 'mMJriP0QsiId', 1);
insert into users (id, name, u_password, role) values (24, 'Waring', 'kX7pGlG', 1);
insert into users (id, name, u_password, role) values (25, 'Juliana', 'KssB06RfVrj', 1);
insert into users (id, name, u_password, role) values (26, 'Ruthy', 'DAV1iL3JT', 1);
insert into users (id, name, u_password, role) values (27, 'Frederik', 'AB4099', 1);
insert into users (id, name, u_password, role) values (28, 'Dale', 'ZZxq8GOFZl', 1);
insert into users (id, name, u_password, role) values (29, 'Romola', 'IQfPrCgjb', 1);
insert into users (id, name, u_password, role) values (30, 'Monah', '9HUFUQgfgi', 1);
insert into users (id, name, u_password, role) values (31, 'Doro', 'PaGjykN8n', 1);
insert into users (id, name, u_password, role) values (32, 'Brenn', 'PqzFv4', 1);
insert into users (id, name, u_password, role) values (33, 'Lawry', 'sJrh29rnjLr', 1);
insert into users (id, name, u_password, role) values (34, 'Dorette', 'PnczFm', 1);
insert into users (id, name, u_password, role) values (35, 'Nellie', 'lM5gVj', 1);
insert into users (id, name, u_password, role) values (36, 'Sheryl', '5IJtRE590W', 1);
insert into users (id, name, u_password, role) values (37, 'Rosaline', 'rIY7nnX6qZ', 1);
insert into users (id, name, u_password, role) values (38, 'Queenie', '546w9ka6H8', 1);
insert into users (id, name, u_password, role) values (39, 'Roberta', 'eSm5vgJ', 1);
insert into users (id, name, u_password, role) values (40, 'Ernesta', 'i5m94ey7K', 1);
insert into users (id, name, u_password, role) values (41, 'Donn', '9kWZbJ45jwgd', 1);
insert into users (id, name, u_password, role) values (42, 'Jecho', 'PWjLCbF', 1);
insert into users (id, name, u_password, role) values (43, 'Saidee', 'QTFwD3fJ', 1);
insert into users (id, name, u_password, role) values (44, 'Koo', '6tWhCRT6EFe', 1);
insert into users (id, name, u_password, role) values (45, 'Lusa', 'WBPufUs9J8', 1);
insert into users (id, name, u_password, role) values (46, 'Shaine', 'WZSHyPiD', 1);
insert into users (id, name, u_password, role) values (47, 'Alejandro', 'MdkneolSmhc', 1);
insert into users (id, name, u_password, role) values (48, 'Suzette', '3XBBF1aX', 1);
insert into users (id, name, u_password, role) values (49, 'Wes', 'fEhU3zwcfVjG', 1);
insert into users (id, name, u_password, role) values (50, 'Sabina', '9DbB3tT39qY', 1);
insert into users (id, name, u_password, role) values (51, 'Emylee', '4nIGJb', 1);
insert into users (id, name, u_password, role) values (52, 'Enrica', 'ipTPIlc9I', 1);
insert into users (id, name, u_password, role) values (53, 'Hoebart', '4jAWNVXmxg', 1);
insert into users (id, name, u_password, role) values (54, 'Karim', 'xOc8ymf', 1);
insert into users (id, name, u_password, role) values (55, 'Brittani', 't0ITYTXAgKpP', 1);
insert into users (id, name, u_password, role) values (56, 'Hubey', 's9KLEcuRf', 1);
insert into users (id, name, u_password, role) values (57, 'Leontine', 'xqo9AE', 1);
insert into users (id, name, u_password, role) values (58, 'Tiffi', 'tw5ydIN63', 1);
insert into users (id, name, u_password, role) values (59, 'Gerek', 'OWueFn', 1);
insert into users (id, name, u_password, role) values (60, 'Prentice', 'loDP8gzmCh', 1);
insert into users (id, name, u_password, role) values (61, 'Sharai', 'Dnc71QOq', 1);
insert into users (id, name, u_password, role) values (62, 'Gale', 'bM5NPEAnZuwl', 1);
insert into users (id, name, u_password, role) values (63, 'Cristiano', 'JbmC18', 1);
insert into users (id, name, u_password, role) values (64, 'Danette', 'tuZ8VgvkY', 1);
insert into users (id, name, u_password, role) values (65, 'Gabriellia', 'Wk85YDshIfa8', 1);
insert into users (id, name, u_password, role) values (66, 'Yancey', 'x1ylZCy', 1);
insert into users (id, name, u_password, role) values (67, 'Selinda', 'S3jEudpbY', 1);
insert into users (id, name, u_password, role) values (68, 'Vern', '8tYMNginT86', 1);
insert into users (id, name, u_password, role) values (69, 'Sharla', 'lGRuNSMP', 1);
insert into users (id, name, u_password, role) values (70, 'Ariana', 'xcFsKRb', 1);
insert into users (id, name, u_password, role) values (71, 'Sibel', 'VfRN4LoW5f', 1);
insert into users (id, name, u_password, role) values (72, 'Jobye', 'T81D5PaF7krS', 1);
insert into users (id, name, u_password, role) values (73, 'Annelise', 'z2dElImq', 1);
insert into users (id, name, u_password, role) values (74, 'Sean', 'RvWWSWlS05uQ', 1);
insert into users (id, name, u_password, role) values (75, 'Lily', 'RCfOrTDw', 1);
insert into users (id, name, u_password, role) values (76, 'Quent', 'OyyFPpT7', 1);
insert into users (id, name, u_password, role) values (77, 'Dickie', 'mSgUcPb2vL', 1);
insert into users (id, name, u_password, role) values (78, 'Gayle', '0Y5JrfsXu08', 1);
insert into users (id, name, u_password, role) values (79, 'Saidee', 'p85ccnRfe', 1);
insert into users (id, name, u_password, role) values (80, 'Brunhilde', 'cZwTy0neBvva', 1);
insert into users (id, name, u_password, role) values (81, 'Erika', 'KE2QKP', 1);
insert into users (id, name, u_password, role) values (82, 'Eleen', 'DU1O60GvX79u', 1);
insert into users (id, name, u_password, role) values (83, 'Ania', 'jRoH9Esjs', 1);
insert into users (id, name, u_password, role) values (84, 'Jabez', 'NzNleGr0x36H', 1);
insert into users (id, name, u_password, role) values (85, 'Gris', 'Fzbe9wx4w99g', 1);
insert into users (id, name, u_password, role) values (86, 'Noel', '0Izngodria', 1);
insert into users (id, name, u_password, role) values (87, 'Cordy', 'QHQuIjLtrDdm', 1);
insert into users (id, name, u_password, role) values (88, 'Irita', 'GRDsABeODzt', 1);
insert into users (id, name, u_password, role) values (89, 'Darbee', 'dVq7YAuaXaH', 1);
insert into users (id, name, u_password, role) values (90, 'Daloris', 'jx0S9w', 1);
insert into users (id, name, u_password, role) values (91, 'Mufi', 'Us6WKtD7P', 1);
insert into users (id, name, u_password, role) values (92, 'Henrietta', 'tlNEkJLXO', 1);
insert into users (id, name, u_password, role) values (93, 'Karoline', 'b4cOkRCzXo', 1);
insert into users (id, name, u_password, role) values (94, 'Conni', 'bpXQ0U', 1);
insert into users (id, name, u_password, role) values (95, 'Evie', 'Qc9GNmqG', 1);
insert into users (id, name, u_password, role) values (96, 'Tiertza', 'OZbZA1h0', 1);
insert into users (id, name, u_password, role) values (97, 'Jordain', '6YPn6utq', 1);
insert into users (id, name, u_password, role) values (98, 'Ban', 'mniI4fP0Y', 1);
insert into users (id, name, u_password, role) values (99, 'Leo', 'DasXLYjDIhM', 1);
insert into users (id, name, u_password, role) values (100, 'Clarke', 'jgWlyJRrCE0B', 1);
insert into users (id, name, u_password, role) values (101, 'Rodi', 'KvcAlG', 1);
insert into users (id, name, u_password, role) values (102, 'Etienne', 'aQIRNf2HE', 1);
insert into users (id, name, u_password, role) values (103, 'Xylia', 'ejEPSPnyPF', 1);
insert into users (id, name, u_password, role) values (104, 'Farly', '57jX1d', 1);
insert into users (id, name, u_password, role) values (105, 'Amity', 'ziVlVcPce6', 1);
insert into users (id, name, u_password, role) values (106, 'Dorene', 'DrmVM6dkJ', 1);
insert into users (id, name, u_password, role) values (107, 'Avigdor', 'n0JtIG', 1);
insert into users (id, name, u_password, role) values (108, 'Gwen', '1zmzXry3Q', 1);
insert into users (id, name, u_password, role) values (109, 'Pavia', 'bNCU7miNRK', 1);
insert into users (id, name, u_password, role) values (110, 'Sharai', 'H87vlaDyI', 1);
insert into users (id, name, u_password, role) values (111, 'Melba', 'D9bLNG', 1);
insert into users (id, name, u_password, role) values (112, 'Jill', 'f4nIXBtG867b', 1);
insert into users (id, name, u_password, role) values (113, 'Salomi', 'ZYg0xkza', 1);
insert into users (id, name, u_password, role) values (114, 'Mile', '0RfdJibu', 1);
insert into users (id, name, u_password, role) values (115, 'Ruthe', 'piEQReSATfBC', 1);
insert into users (id, name, u_password, role) values (116, 'Keelia', 'KBe4igwn', 1);
insert into users (id, name, u_password, role) values (117, 'Stacie', 'qihBJTBsVa9', 1);
insert into users (id, name, u_password, role) values (118, 'Amargo', 'iqSqEDSSxVtc', 1);
insert into users (id, name, u_password, role) values (119, 'Odell', 'AWL9fS', 1);
insert into users (id, name, u_password, role) values (120, 'Gratia', 'ohNfxhy', 1);
insert into users (id, name, u_password, role) values (121, 'Cassie', 'TYmqzS0a0x0o', 1);
insert into users (id, name, u_password, role) values (122, 'Marcelline', 'CKmF9d', 1);
insert into users (id, name, u_password, role) values (123, 'Ivar', '9OHM5QvZc5wg', 1);
insert into users (id, name, u_password, role) values (124, 'Barnaby', 'XtQ9osLFP', 1);
insert into users (id, name, u_password, role) values (125, 'Hestia', 'uFCduu7cQU7p', 1);
insert into users (id, name, u_password, role) values (126, 'Zeke', 'n3JClafAu', 1);
insert into users (id, name, u_password, role) values (127, 'Guillemette', '8FcKgmpfKbfl', 1);
insert into users (id, name, u_password, role) values (128, 'Sanford', 'jSbicd', 1);
insert into users (id, name, u_password, role) values (129, 'Keen', 'w1XBxvjcB1cR', 1);
insert into users (id, name, u_password, role) values (130, 'Darlleen', '9SKn6RLxVc', 1);
insert into users (id, name, u_password, role) values (131, 'Webster', 'hkEW8ylwUd', 1);
insert into users (id, name, u_password, role) values (132, 'Silas', 'Z5LUoA0QQlMq', 1);
insert into users (id, name, u_password, role) values (133, 'Kellia', '6K3yJ4', 1);
insert into users (id, name, u_password, role) values (134, 'Bradan', 'Iff2a1arl', 1);
insert into users (id, name, u_password, role) values (135, 'Bennie', 'D6KLdmb', 1);
insert into users (id, name, u_password, role) values (136, 'Tomas', 'NEu1Vk1p', 1);
insert into users (id, name, u_password, role) values (137, 'Melissa', 'Qw9YcKL', 1);
insert into users (id, name, u_password, role) values (138, 'Nye', 'lctdQEVRt', 1);
insert into users (id, name, u_password, role) values (139, 'Claudie', 'H9K0ALajLBvB', 1);
insert into users (id, name, u_password, role) values (140, 'Nerta', 'bj86In1aWHV', 1);
insert into users (id, name, u_password, role) values (141, 'Marya', '4Wgr452YfeA', 1);
insert into users (id, name, u_password, role) values (142, 'Jeralee', 'VfRGEE', 1);
insert into users (id, name, u_password, role) values (143, 'Lacie', 'mZrxfOEFZ', 1);
insert into users (id, name, u_password, role) values (144, 'Doloritas', 'VDb1SOUIDm', 1);
insert into users (id, name, u_password, role) values (145, 'Jervis', 'hvtFeZX8lnC', 1);
insert into users (id, name, u_password, role) values (146, 'Tracey', 'l8McUbVc6cZ', 1);
insert into users (id, name, u_password, role) values (147, 'Tait', 'icoX5MeaCQpV', 1);
insert into users (id, name, u_password, role) values (148, 'Linet', 'DXouRHj', 1);
insert into users (id, name, u_password, role) values (149, 'Tomaso', 'DWMDFBC2B1', 1);
insert into users (id, name, u_password, role) values (150, 'Fonzie', 'gM1sw0yCSE', 1);
insert into users (id, name, u_password, role) values (151, 'Carey', 'RjMKIHe3k', 1);
insert into users (id, name, u_password, role) values (152, 'Meta', 'cKjrTx5vQ', 1);
insert into users (id, name, u_password, role) values (153, 'Cozmo', 'CfFZgm', 1);
insert into users (id, name, u_password, role) values (154, 'Keeley', 'JoScGlBdjJl', 1);
insert into users (id, name, u_password, role) values (155, 'Nealy', 'CtGbuwpuxu1h', 1);
insert into users (id, name, u_password, role) values (156, 'Quentin', 'vG7QLPCTy', 1);
insert into users (id, name, u_password, role) values (157, 'Darby', 'iTA7s5s3h37', 1);
insert into users (id, name, u_password, role) values (158, 'Stephine', 'yHLaJf', 1);
insert into users (id, name, u_password, role) values (159, 'Gratiana', 'gqEeo0', 1);
insert into users (id, name, u_password, role) values (160, 'Cathryn', 'qaAwPAjNKd', 1);
insert into users (id, name, u_password, role) values (161, 'Chastity', 'tBeLY9', 1);
insert into users (id, name, u_password, role) values (162, 'Dorene', 'pw9jQb8p', 1);
insert into users (id, name, u_password, role) values (163, 'Phelia', 'eAkZTXAWOJE', 1);
insert into users (id, name, u_password, role) values (164, 'Michelina', 'nft8Bs', 1);
insert into users (id, name, u_password, role) values (165, 'Ellery', '30lqV0sUFTK', 1);
insert into users (id, name, u_password, role) values (166, 'Avivah', 'MQzVwshuBZPG', 1);
insert into users (id, name, u_password, role) values (167, 'Berri', '34LvR0D', 1);
insert into users (id, name, u_password, role) values (168, 'Shawnee', 'MqCrTEY', 1);
insert into users (id, name, u_password, role) values (169, 'Karrah', 'zntpHb', 1);
insert into users (id, name, u_password, role) values (170, 'Blair', 'WP5jXS', 1);
insert into users (id, name, u_password, role) values (171, 'Mahmud', 'ZL6B8m', 1);
insert into users (id, name, u_password, role) values (172, 'Guenna', 'btCY9e4m6HRD', 1);
insert into users (id, name, u_password, role) values (173, 'Alano', '86ksyNIrU', 1);
insert into users (id, name, u_password, role) values (174, 'Horten', 'DdZUByAAV', 1);
insert into users (id, name, u_password, role) values (175, 'Frants', 'aGybIaPU', 1);
insert into users (id, name, u_password, role) values (176, 'Beverlee', 'V6NHiy', 1);
insert into users (id, name, u_password, role) values (177, 'Rhys', 'oS5B6qR5x', 1);
insert into users (id, name, u_password, role) values (178, 'Henry', 'oYKAYJ', 1);
insert into users (id, name, u_password, role) values (179, 'Teddie', 'PYLRGeY', 1);
insert into users (id, name, u_password, role) values (180, 'Charlton', 'osZaWh', 1);
insert into users (id, name, u_password, role) values (181, 'Nikolaos', 'h7se82', 1);
insert into users (id, name, u_password, role) values (182, 'Babs', 'agzg9w6w', 1);
insert into users (id, name, u_password, role) values (183, 'Ferris', '7zdqPJC', 1);
insert into users (id, name, u_password, role) values (184, 'Tobie', '54Ij12NW', 1);
insert into users (id, name, u_password, role) values (185, 'Rasia', 'aoyykOfuS', 1);
insert into users (id, name, u_password, role) values (186, 'Elberta', 'OCtZ9zr4nNZ', 1);
insert into users (id, name, u_password, role) values (187, 'Michal', 'ZfulwG', 1);
insert into users (id, name, u_password, role) values (188, 'Genevra', 'PWs367b8sz', 1);
insert into users (id, name, u_password, role) values (189, 'Tomaso', '756UsJ', 1);
insert into users (id, name, u_password, role) values (190, 'Clarey', 'a1BqY8wT7q', 1);
insert into users (id, name, u_password, role) values (191, 'Clementina', 'pQp45IEge', 1);
insert into users (id, name, u_password, role) values (192, 'Tybie', 'IndkC9ex', 1);
insert into users (id, name, u_password, role) values (193, 'Sam', '9KaPdfpkQ00', 1);
insert into users (id, name, u_password, role) values (194, 'Gertrude', 'G2ADsz4i6', 1);
insert into users (id, name, u_password, role) values (195, 'Haywood', 'lsmej1zKtpA', 1);
insert into users (id, name, u_password, role) values (196, 'Pebrook', '1eaP0Ox', 1);
insert into users (id, name, u_password, role) values (197, 'Elwin', 'aGsUWY3', 1);
insert into users (id, name, u_password, role) values (198, 'Christalle', '6p3gYC', 1);
insert into users (id, name, u_password, role) values (199, 'Jaquenetta', '01efv6', 1);
insert into users (id, name, u_password, role) values (200, 'Corrie', 'MMzYMchjjDbo', 1);
insert into users (id, name, u_password, role) values (201, 'Ryley', 'Dp1c6XS37r', 1);
insert into users (id, name, u_password, role) values (202, 'Elladine', '1iIZUTiP1', 1);
insert into users (id, name, u_password, role) values (203, 'Taber', 'kpU61IWlF', 1);
insert into users (id, name, u_password, role) values (204, 'Abraham', 'sioFKf', 1);
insert into users (id, name, u_password, role) values (205, 'Rosanna', 'NnnVy2x', 1);
insert into users (id, name, u_password, role) values (206, 'Wilfrid', 'hZM5kmQP', 1);
insert into users (id, name, u_password, role) values (207, 'Theresa', '6XPAP2mFu2', 1);
insert into users (id, name, u_password, role) values (208, 'Ellis', '71rHTqU0Myx', 1);
insert into users (id, name, u_password, role) values (209, 'Ronny', 'piQpM8j4khC4', 1);
insert into users (id, name, u_password, role) values (210, 'Merrie', 'BqJQvQDEIYu', 1);
insert into users (id, name, u_password, role) values (211, 'Lu', '77ZIW8Vra4', 1);
insert into users (id, name, u_password, role) values (212, 'Remus', 'g3Jcxmz', 1);
insert into users (id, name, u_password, role) values (213, 'Ozzie', 'FXEwwNy', 1);
insert into users (id, name, u_password, role) values (214, 'Skippy', 'uiGENfHAZ', 1);
insert into users (id, name, u_password, role) values (215, 'Evelin', 'MHdKWTj7qRr', 1);
insert into users (id, name, u_password, role) values (216, 'Ashla', 'F0IrFrra', 1);
insert into users (id, name, u_password, role) values (217, 'Erma', 'wDjCq77wMV', 1);
insert into users (id, name, u_password, role) values (218, 'Hart', 'sNeYuQ7U9', 1);
insert into users (id, name, u_password, role) values (219, 'Jamima', 'ug8srJIIoqL8', 1);
insert into users (id, name, u_password, role) values (220, 'Flem', 'DaenBK7L4p', 1);
insert into users (id, name, u_password, role) values (221, 'Konrad', 'YF4a6Jsw', 1);
insert into users (id, name, u_password, role) values (222, 'Abbot', 'Flt2UfpwIZ', 1);
insert into users (id, name, u_password, role) values (223, 'Lanita', '0bx4ZjUr', 1);
insert into users (id, name, u_password, role) values (224, 'Kaia', '2npLgTgz0V', 1);
insert into users (id, name, u_password, role) values (225, 'Kym', 'NGSLPpByl', 1);
insert into users (id, name, u_password, role) values (226, 'Guthrey', 'd57ZLd7', 1);
insert into users (id, name, u_password, role) values (227, 'Sibilla', 'rUwPJcvZrPl', 1);
insert into users (id, name, u_password, role) values (228, 'Hugo', 'VmfJokmzYveq', 1);
insert into users (id, name, u_password, role) values (229, 'Juliane', 'I6et6C', 1);
insert into users (id, name, u_password, role) values (230, 'Phillipp', 'duPHnI', 1);
insert into users (id, name, u_password, role) values (231, 'Connie', 'uhJq4KNCQ', 1);
insert into users (id, name, u_password, role) values (232, 'Lou', 'NvMdcb', 1);
insert into users (id, name, u_password, role) values (233, 'Lacee', 'Q7TPgp9ed7K', 1);
insert into users (id, name, u_password, role) values (234, 'Chas', 'v1tyEp', 1);
insert into users (id, name, u_password, role) values (235, 'Fidela', 'wT7qZ5cDX', 1);
insert into users (id, name, u_password, role) values (236, 'Doe', 'udhINa4f', 1);
insert into users (id, name, u_password, role) values (237, 'Leandra', '87lg48Bg7', 1);
insert into users (id, name, u_password, role) values (238, 'Kendre', '8WP0IkR4P', 1);
insert into users (id, name, u_password, role) values (239, 'Ondrea', 'cmoRysn9Ys', 1);
insert into users (id, name, u_password, role) values (240, 'Fred', 'JajRZ6', 1);
insert into users (id, name, u_password, role) values (241, 'Isa', 'RHdXGa8', 1);
insert into users (id, name, u_password, role) values (242, 'Marguerite', 'jHKGui', 1);
insert into users (id, name, u_password, role) values (243, 'Saxe', 'evqVIDrrW', 1);
insert into users (id, name, u_password, role) values (244, 'Rebecca', 'EtguNd6VYm', 1);
insert into users (id, name, u_password, role) values (245, 'Ulrick', 'gwzdi5Fuuy', 1);
insert into users (id, name, u_password, role) values (246, 'Zechariah', 'Y8lBCTb3dD', 1);
insert into users (id, name, u_password, role) values (247, 'Meriel', '264wnW', 1);
insert into users (id, name, u_password, role) values (248, 'Henri', 'CVxf1JT54', 1);
insert into users (id, name, u_password, role) values (249, 'Ephraim', 'tgYLjHq', 1);
insert into users (id, name, u_password, role) values (250, 'Penny', 'f0GbIKQ6R', 1);
insert into users (id, name, u_password, role) values (251, 'Baxter', 'M3CAaY', 1);
insert into users (id, name, u_password, role) values (252, 'Lilia', 'UB8sDY1BpcR', 1);
insert into users (id, name, u_password, role) values (253, 'Cherilynn', 'MS5GAWsnau', 1);
insert into users (id, name, u_password, role) values (254, 'Stewart', 'v8HPYusTR', 1);
insert into users (id, name, u_password, role) values (255, 'Kathie', 'H73Oq0R', 1);
insert into users (id, name, u_password, role) values (256, 'Benita', 'L7sP07', 1);
insert into users (id, name, u_password, role) values (257, 'Arda', 'buRREXfzrB', 1);
insert into users (id, name, u_password, role) values (258, 'Eolanda', 'oVzjG3mj', 1);
insert into users (id, name, u_password, role) values (259, 'Gerta', '9VHn1XN', 1);
insert into users (id, name, u_password, role) values (260, 'Heinrik', 'rSNH1jvyMfwO', 1);
insert into users (id, name, u_password, role) values (261, 'Granny', 'InuREQt6Tlr', 1);
insert into users (id, name, u_password, role) values (262, 'Cordey', 'VnSoHLvIFF9w', 1);
insert into users (id, name, u_password, role) values (263, 'Nelly', 'gjAfha83VCas', 1);
insert into users (id, name, u_password, role) values (264, 'Fayina', 'RkSk36FjZPAr', 1);
insert into users (id, name, u_password, role) values (265, 'Ole', 'HwaoueF7wuS', 1);
insert into users (id, name, u_password, role) values (266, 'Elayne', 'YbWFsF0twej', 1);
insert into users (id, name, u_password, role) values (267, 'Marcia', 'wjp2WcpmG2U', 1);
insert into users (id, name, u_password, role) values (268, 'Forrester', 'D6JTCNTST', 1);
insert into users (id, name, u_password, role) values (269, 'Sterne', 'mAmAti', 1);
insert into users (id, name, u_password, role) values (270, 'Papageno', 'l6k49bVn', 1);
insert into users (id, name, u_password, role) values (271, 'Leon', 'DpyehHkst7Oq', 1);
insert into users (id, name, u_password, role) values (272, 'Geordie', 'djQ1qp', 1);
insert into users (id, name, u_password, role) values (273, 'Angelique', 'hYJbShpm1erB', 1);
insert into users (id, name, u_password, role) values (274, 'Rosanna', 'Y6V5Vz', 1);
insert into users (id, name, u_password, role) values (275, 'Rica', 'dQUbP7V1TWgk', 1);
insert into users (id, name, u_password, role) values (276, 'Mohandas', 'K0vdt8hv8', 1);
insert into users (id, name, u_password, role) values (277, 'Alicia', 'Ykt1SnS', 1);
insert into users (id, name, u_password, role) values (278, 'Chadd', 'WjkE9crCD', 1);
insert into users (id, name, u_password, role) values (279, 'Ranna', 'tAupgHOVs', 1);
insert into users (id, name, u_password, role) values (280, 'Jessamyn', 'akSHfUFn48', 1);
insert into users (id, name, u_password, role) values (281, 'Bartholomeo', '184pZN1a', 1);
insert into users (id, name, u_password, role) values (282, 'Lauritz', 'cO3Y52YhRu', 1);
insert into users (id, name, u_password, role) values (283, 'Myranda', 'fYzH2MmLPq9', 1);
insert into users (id, name, u_password, role) values (284, 'Irvine', '7bOxHfEEqD5', 1);
insert into users (id, name, u_password, role) values (285, 'Kira', 'juQ57QhOg2', 1);
insert into users (id, name, u_password, role) values (286, 'Elisa', 'vmYrOrdM2w', 1);
insert into users (id, name, u_password, role) values (287, 'Gardie', '6CrEk7tn', 1);
insert into users (id, name, u_password, role) values (288, 'Vincents', 'HaSXLyxUspu9', 1);
insert into users (id, name, u_password, role) values (289, 'Drucy', 'upM7zboFlYWa', 1);
insert into users (id, name, u_password, role) values (290, 'Valli', 'Mguuhh', 1);
insert into users (id, name, u_password, role) values (291, 'Sharla', 'TXJiHX5D', 1);
insert into users (id, name, u_password, role) values (292, 'Eilis', 'YfUcUP', 1);
insert into users (id, name, u_password, role) values (293, 'Gerta', '5hAzo0kV', 1);
insert into users (id, name, u_password, role) values (294, 'Emmey', '2DyfIm0tV', 1);
insert into users (id, name, u_password, role) values (295, 'Clayton', '1kFJajXzSF', 1);
insert into users (id, name, u_password, role) values (296, 'Aaron', 'jfr0QJN', 1);
insert into users (id, name, u_password, role) values (297, 'Berny', '00FX9gWmBJrv', 1);
insert into users (id, name, u_password, role) values (298, 'Merralee', '9PciHRUND', 1);
insert into users (id, name, u_password, role) values (299, 'Aubert', '4vdiSPNs3Wr', 1);
insert into users (id, name, u_password, role) values (300, 'Orrin', 'memjLsoTDS6p', 1);
insert into users (id, name, u_password, role) values (301, 'Lindie', 'lu6omCWL', 1);
insert into users (id, name, u_password, role) values (302, 'Charmion', 'oDHEtXI', 1);
insert into users (id, name, u_password, role) values (303, 'Melamie', 'Qibka0UvR', 1);
insert into users (id, name, u_password, role) values (304, 'Harley', 'fvC136IB', 1);
insert into users (id, name, u_password, role) values (305, 'Missy', 'IygkdKtRH', 1);
insert into users (id, name, u_password, role) values (306, 'Pierette', 'xU6jIt7biJ', 1);
insert into users (id, name, u_password, role) values (307, 'Brook', 'vnBVo15Hkro', 1);
insert into users (id, name, u_password, role) values (308, 'Dominique', 'QfamLFjw', 1);
insert into users (id, name, u_password, role) values (309, 'Ddene', 'voF9k5mrrtYT', 1);
insert into users (id, name, u_password, role) values (310, 'Romy', 'WZy2wF2ChkuU', 1);
insert into users (id, name, u_password, role) values (311, 'Kalli', '5QuViy', 1);
insert into users (id, name, u_password, role) values (312, 'Lucky', 'IARmPir2tbvr', 1);
insert into users (id, name, u_password, role) values (313, 'Iolande', 'RUn7fL1yw', 1);
insert into users (id, name, u_password, role) values (314, 'Barn', 'ybBzIExG7fAG', 1);
insert into users (id, name, u_password, role) values (315, 'Nathaniel', 'Kip4oGV0V', 1);
insert into users (id, name, u_password, role) values (316, 'Wynne', 'AI7sdzmrjD', 1);
insert into users (id, name, u_password, role) values (317, 'Hazlett', 'aaL1AyClFkFw', 1);
insert into users (id, name, u_password, role) values (318, 'Yule', 'leU27f790puR', 1);
insert into users (id, name, u_password, role) values (319, 'Ethel', 'Kxl26XC', 1);
insert into users (id, name, u_password, role) values (320, 'Lawrence', 'wI0i8VYiA', 1);
insert into users (id, name, u_password, role) values (321, 'Ronna', 'WoFpyPD8tC7', 1);
insert into users (id, name, u_password, role) values (322, 'Ava', 'YgeSUIeaCN', 1);
insert into users (id, name, u_password, role) values (323, 'Lane', 'Ruowif', 1);
insert into users (id, name, u_password, role) values (324, 'Mindy', 'toqFzUW1arku', 1);
insert into users (id, name, u_password, role) values (325, 'Pansie', 'P1ARWSCX', 1);
insert into users (id, name, u_password, role) values (326, 'Addison', 'Ei6fgfCd', 1);
insert into users (id, name, u_password, role) values (327, 'Agneta', '5ffTUr4l4T', 1);
insert into users (id, name, u_password, role) values (328, 'Pall', 'Hii62b2Gyrvx', 1);
insert into users (id, name, u_password, role) values (329, 'Quincey', '3iOJh5', 1);
insert into users (id, name, u_password, role) values (330, 'Gloria', '8vWuPVvwz', 1);
insert into users (id, name, u_password, role) values (331, 'Pearla', 'EunmhM', 1);
insert into users (id, name, u_password, role) values (332, 'Clay', 'wq1jJbfVj', 1);
insert into users (id, name, u_password, role) values (333, 'Dniren', 'gOOHRUc', 1);
insert into users (id, name, u_password, role) values (334, 'Anica', '0MQhaxvD1', 1);
insert into users (id, name, u_password, role) values (335, 'Ailey', 'UfqbBjCTpTa', 1);
insert into users (id, name, u_password, role) values (336, 'Prue', '7u13cvJRg', 1);
insert into users (id, name, u_password, role) values (337, 'Kareem', '6hr0wi', 1);
insert into users (id, name, u_password, role) values (338, 'Ruddy', 'lPEzEIDi73R', 1);
insert into users (id, name, u_password, role) values (339, 'Abramo', 'ZCpAACuULlk', 1);
insert into users (id, name, u_password, role) values (340, 'Percival', 'b6Okve', 1);
insert into users (id, name, u_password, role) values (341, 'Dwain', 'G6o3zH', 1);
insert into users (id, name, u_password, role) values (342, 'Arel', 'mMNebFVwNHk', 1);
insert into users (id, name, u_password, role) values (343, 'Yehudit', '72EoXb', 1);
insert into users (id, name, u_password, role) values (344, 'Rosalinde', '2Z6UAh3gO', 1);
insert into users (id, name, u_password, role) values (345, 'Trudey', 'FyTzwC', 1);
insert into users (id, name, u_password, role) values (346, 'Ciro', 'BhQAPttFJJn', 1);
insert into users (id, name, u_password, role) values (347, 'Glenna', '4Tj5TqA', 1);
insert into users (id, name, u_password, role) values (348, 'Domingo', '9CzoSn', 1);
insert into users (id, name, u_password, role) values (349, 'Filippa', 'FkpBeXrmJo', 1);
insert into users (id, name, u_password, role) values (350, 'Coralie', 'g8DmnJHXB9', 1);
insert into users (id, name, u_password, role) values (351, 'Deeyn', 'uHsOVW0', 1);
insert into users (id, name, u_password, role) values (352, 'Moore', 'XA0Ig8vYY', 1);
insert into users (id, name, u_password, role) values (353, 'Janith', '4HOcNE5', 1);
insert into users (id, name, u_password, role) values (354, 'Dulci', 'K6WZ9Ms', 1);
insert into users (id, name, u_password, role) values (355, 'Lind', 'ExRpTd5Uqk', 1);
insert into users (id, name, u_password, role) values (356, 'Sherwynd', 'l86WOw8Fjd', 1);
insert into users (id, name, u_password, role) values (357, 'Raleigh', 'ge5IqReXZ9Id', 1);
insert into users (id, name, u_password, role) values (358, 'Shamus', '56SkIg6NO', 1);
insert into users (id, name, u_password, role) values (359, 'Carlynn', '8KOBnQaHO', 1);
insert into users (id, name, u_password, role) values (360, 'Clive', 'VUoPUW', 1);
insert into users (id, name, u_password, role) values (361, 'Bryna', 'V8IshSiL', 1);
insert into users (id, name, u_password, role) values (362, 'Roberta', '3auT15TJE', 1);
insert into users (id, name, u_password, role) values (363, 'Pearce', '0ZU6OeUG', 1);
insert into users (id, name, u_password, role) values (364, 'Jammie', 'l8i1LC', 1);
insert into users (id, name, u_password, role) values (365, 'Jasmine', 'RGKc1zXVV3Ur', 1);
insert into users (id, name, u_password, role) values (366, 'Ebonee', 'oCpftyJ', 1);
insert into users (id, name, u_password, role) values (367, 'Witty', 'PPzocQMuseK', 1);
insert into users (id, name, u_password, role) values (368, 'Hi', 'XLtuLvC', 1);
insert into users (id, name, u_password, role) values (369, 'Paulette', 'XJqpWb3H4rZG', 1);
insert into users (id, name, u_password, role) values (370, 'Clifford', '3hb9vVS3', 1);
insert into users (id, name, u_password, role) values (371, 'Lazare', 'ZKSot8PG1', 1);
insert into users (id, name, u_password, role) values (372, 'Marga', 'XMti80X3', 1);
insert into users (id, name, u_password, role) values (373, 'Armin', 'Fj7xVnk1q0', 1);
insert into users (id, name, u_password, role) values (374, 'Sergent', 'cAH56dA9W4', 1);
insert into users (id, name, u_password, role) values (375, 'Bellina', 'j5NgtF2kwqas', 1);
insert into users (id, name, u_password, role) values (376, 'Tades', 'v6Ac1H', 1);
insert into users (id, name, u_password, role) values (377, 'Leonore', '4FibxGR8k', 1);
insert into users (id, name, u_password, role) values (378, 'Moss', 'CP8Tj2HQ', 1);
insert into users (id, name, u_password, role) values (379, 'Husein', 'SRcDzy1', 1);
insert into users (id, name, u_password, role) values (380, 'Harriette', 'vaJB7PWz0', 1);
insert into users (id, name, u_password, role) values (381, 'Minnnie', 'PurvJs6WNj', 1);
insert into users (id, name, u_password, role) values (382, 'Casey', '90xs6ZDP2tK', 1);
insert into users (id, name, u_password, role) values (383, 'Nicky', 'yIjapTHOimH', 1);
insert into users (id, name, u_password, role) values (384, 'Bella', 'ksiHcRYZjOB', 1);
insert into users (id, name, u_password, role) values (385, 'Althea', 'eTU5kLSSfW', 1);
insert into users (id, name, u_password, role) values (386, 'Jamison', 'E1ERYSDov', 1);
insert into users (id, name, u_password, role) values (387, 'Marietta', 'TWnP5UufE', 1);
insert into users (id, name, u_password, role) values (388, 'Lizzie', 'xMwVLqPJ51', 1);
insert into users (id, name, u_password, role) values (389, 'Felecia', 'ud9hcq', 1);
insert into users (id, name, u_password, role) values (390, 'Rafaelita', 'LtoP4Gy1QIc', 1);
insert into users (id, name, u_password, role) values (391, 'Schuyler', 'KiSIkh', 1);
insert into users (id, name, u_password, role) values (392, 'Philippe', 'QJ6WQ3SbO', 1);
insert into users (id, name, u_password, role) values (393, 'Lurette', '3KOsgyk', 1);
insert into users (id, name, u_password, role) values (394, 'Reinaldo', 'VPQkoml', 1);
insert into users (id, name, u_password, role) values (395, 'Dionisio', 'r9UGwGrtgYz8', 1);
insert into users (id, name, u_password, role) values (396, 'Ailyn', 'UYfGADI7Ubl', 1);
insert into users (id, name, u_password, role) values (397, 'Mattias', 'yW3mTQgeiM', 1);
insert into users (id, name, u_password, role) values (398, 'Tomlin', 'PPRi6uyrag', 1);
insert into users (id, name, u_password, role) values (399, 'Abbi', 'dNlQaL', 1);
insert into users (id, name, u_password, role) values (400, 'Ladonna', 's9OEOi8', 1);
insert into users (id, name, u_password, role) values (401, 'Dorotea', 'Dlq5eb8kW', 1);
insert into users (id, name, u_password, role) values (402, 'Julio', 'dopjdo', 1);
insert into users (id, name, u_password, role) values (403, 'Felecia', 'CBef2QU', 1);
insert into users (id, name, u_password, role) values (404, 'Lazar', 'EaCRTpn2U', 1);
insert into users (id, name, u_password, role) values (405, 'Neille', 'NpIwC8AAtM', 1);
insert into users (id, name, u_password, role) values (406, 'Matthus', 'viEjlCrmCNWk', 1);
insert into users (id, name, u_password, role) values (407, 'Marianne', 'fEXo3HR7OTC', 1);
insert into users (id, name, u_password, role) values (408, 'Lynna', 'a34nf7p7e', 1);
insert into users (id, name, u_password, role) values (409, 'Gerik', '5dUCXy2hm', 1);
insert into users (id, name, u_password, role) values (410, 'Brenden', '14LvMzfL', 1);
insert into users (id, name, u_password, role) values (411, 'Dorthy', 'Z8kakNB3', 1);
insert into users (id, name, u_password, role) values (412, 'Ardella', 'pvt3t7Ei', 1);
insert into users (id, name, u_password, role) values (413, 'Lowrance', 'J5r7XLcNxUfW', 1);
insert into users (id, name, u_password, role) values (414, 'Chloette', 'cARWlh', 1);
insert into users (id, name, u_password, role) values (415, 'Lari', '3VMSvjMRKH8T', 1);
insert into users (id, name, u_password, role) values (416, 'Lynett', 'pmpPAK', 1);
insert into users (id, name, u_password, role) values (417, 'Addie', 'sH3SgkW', 1);
insert into users (id, name, u_password, role) values (418, 'Amargo', 'HxnlLL', 1);
insert into users (id, name, u_password, role) values (419, 'Ainslee', 'HwnWceKq', 1);
insert into users (id, name, u_password, role) values (420, 'Caesar', '26zx8H', 1);
insert into users (id, name, u_password, role) values (421, 'Eadie', '2bUgWDHC', 1);
insert into users (id, name, u_password, role) values (422, 'Aimee', 'lZVp0x', 1);
insert into users (id, name, u_password, role) values (423, 'Maggy', 'H8iKE7iE3V5', 1);
insert into users (id, name, u_password, role) values (424, 'Fielding', 'o4ae8m2u0X', 1);
insert into users (id, name, u_password, role) values (425, 'Boyce', 'RPcvhSHTbJQM', 1);
insert into users (id, name, u_password, role) values (426, 'Allix', 'DPtsDcUQ', 1);
insert into users (id, name, u_password, role) values (427, 'Rosanne', 'vOz2uwKz', 1);
insert into users (id, name, u_password, role) values (428, 'Reiko', 'gSSQipK4EmZ', 1);
insert into users (id, name, u_password, role) values (429, 'Zacharias', 'IQC104XCkRv', 1);
insert into users (id, name, u_password, role) values (430, 'Phil', 'XQwy8DMEsC', 1);
insert into users (id, name, u_password, role) values (431, 'Dasya', 'Mghkpsp', 1);
insert into users (id, name, u_password, role) values (432, 'Hayyim', '9TQzhY5B', 1);
insert into users (id, name, u_password, role) values (433, 'Klement', 'urq5ZaNYKi4', 1);
insert into users (id, name, u_password, role) values (434, 'Julianna', 'ZEd4nB', 1);
insert into users (id, name, u_password, role) values (435, 'Rosetta', '54PaCE6', 1);
insert into users (id, name, u_password, role) values (436, 'Lane', 'ULHW3VQJ', 1);
insert into users (id, name, u_password, role) values (437, 'Clem', 'Pw9eDz9O', 1);
insert into users (id, name, u_password, role) values (438, 'Carlyn', 'HEUdUq7h', 1);
insert into users (id, name, u_password, role) values (439, 'Vernen', 'z4ObiZ9bcI', 1);
insert into users (id, name, u_password, role) values (440, 'Reg', 'uoTMiE2tLi', 1);
insert into users (id, name, u_password, role) values (441, 'Selestina', 'WlEJEyj', 1);
insert into users (id, name, u_password, role) values (442, 'Arluene', 'vX38d9V6', 1);
insert into users (id, name, u_password, role) values (443, 'Janelle', 'XCf9qGz', 1);
insert into users (id, name, u_password, role) values (444, 'Dora', 'VRQrWs', 1);
insert into users (id, name, u_password, role) values (445, 'Abra', 'hJHSZyrr8J', 1);
insert into users (id, name, u_password, role) values (446, 'Jacques', 'js7lsW', 1);
insert into users (id, name, u_password, role) values (447, 'Stan', 'cWVpG8TbV', 1);
insert into users (id, name, u_password, role) values (448, 'Ransell', 'qTGl5uSl', 1);
insert into users (id, name, u_password, role) values (449, 'Linc', 'cMshl82ol', 1);
insert into users (id, name, u_password, role) values (450, 'Zorine', 'PW9fWcVHQkB', 1);
insert into users (id, name, u_password, role) values (451, 'Merry', 'bCpPmUjJtA', 1);
insert into users (id, name, u_password, role) values (452, 'Johnathon', '4zLM5mjv6g', 1);
insert into users (id, name, u_password, role) values (453, 'Tracey', 'bMh8wq6', 1);
insert into users (id, name, u_password, role) values (454, 'Marcus', 'gbDv2a2DdGA', 1);
insert into users (id, name, u_password, role) values (455, 'Maje', 'uVUbFLiZGgLw', 1);
insert into users (id, name, u_password, role) values (456, 'Althea', '2jM8i0', 1);
insert into users (id, name, u_password, role) values (457, 'Wildon', 'NAJgQgAu9', 1);
insert into users (id, name, u_password, role) values (458, 'Gannie', '3VwBBP8l6t', 1);
insert into users (id, name, u_password, role) values (459, 'Osbert', 'lHrgewfxha', 1);
insert into users (id, name, u_password, role) values (460, 'Hailee', 'cVqUW3', 1);
insert into users (id, name, u_password, role) values (461, 'Flossi', 'hvgJRw', 1);
insert into users (id, name, u_password, role) values (462, 'Erena', 't6tKJhQs', 1);
insert into users (id, name, u_password, role) values (463, 'Ranice', 'Q0VgejyO', 1);
insert into users (id, name, u_password, role) values (464, 'Odey', 'jSew3mk', 1);
insert into users (id, name, u_password, role) values (465, 'Stanislaus', 'ya2TG7v', 1);
insert into users (id, name, u_password, role) values (466, 'Aksel', 'JQ7amC9V', 1);
insert into users (id, name, u_password, role) values (467, 'Konstantine', '4QcCoCx67n', 1);
insert into users (id, name, u_password, role) values (468, 'Free', 'ettK0FF', 1);
insert into users (id, name, u_password, role) values (469, 'Fonz', 'Kv6r0yJW6fX', 1);
insert into users (id, name, u_password, role) values (470, 'Winifield', 'yKACk6YVkGl', 1);
insert into users (id, name, u_password, role) values (471, 'Carlynn', 'JK46auHmlE', 1);
insert into users (id, name, u_password, role) values (472, 'Lonnie', 'ttJUdHHGa', 1);
insert into users (id, name, u_password, role) values (473, 'Mile', 'euJAYaAvm00I', 1);
insert into users (id, name, u_password, role) values (474, 'Roseline', 'kOLJCnsQI', 1);
insert into users (id, name, u_password, role) values (475, 'Bellanca', 'gMrkpZpg', 1);
insert into users (id, name, u_password, role) values (476, 'Blancha', 'EhEX5ez5MbOM', 1);
insert into users (id, name, u_password, role) values (477, 'Allis', 'NHRJLqQmqmi', 1);
insert into users (id, name, u_password, role) values (478, 'Gwenny', 'mezfpyu5', 1);
insert into users (id, name, u_password, role) values (479, 'Rosina', 'RQlRRL3h6', 1);
insert into users (id, name, u_password, role) values (480, 'Susana', '4GaksLc', 1);
insert into users (id, name, u_password, role) values (481, 'Danita', 'EwucZI3', 1);
insert into users (id, name, u_password, role) values (482, 'Elset', '7zgbilB4', 1);
insert into users (id, name, u_password, role) values (483, 'Wallas', 'p1slhwe0idBh', 1);
insert into users (id, name, u_password, role) values (484, 'Clayborne', 'wC3jMJOjd', 1);
insert into users (id, name, u_password, role) values (485, 'Glyn', '3TFgUy4arsND', 1);
insert into users (id, name, u_password, role) values (486, 'Adan', '1tQIosBIeeLm', 1);
insert into users (id, name, u_password, role) values (487, 'Zaccaria', '301pCLl', 1);
insert into users (id, name, u_password, role) values (488, 'Almeda', 'IwPqbmwAAnV1', 1);
insert into users (id, name, u_password, role) values (489, 'Sheppard', 'iVw3d6f6pq6', 1);
insert into users (id, name, u_password, role) values (490, 'Alwyn', 'ysgkWnH9s', 1);
insert into users (id, name, u_password, role) values (491, 'Waring', 'QpaqRrLdrx', 1);
insert into users (id, name, u_password, role) values (492, 'Clarita', 'BgCL26Vj4m', 1);
insert into users (id, name, u_password, role) values (493, 'Keene', 'novGlr', 1);
insert into users (id, name, u_password, role) values (494, 'Neddie', 'hBrvQx9yC', 1);
insert into users (id, name, u_password, role) values (495, 'Jacklyn', 'sSrjkcMkXM', 1);
insert into users (id, name, u_password, role) values (496, 'Sonnnie', 'CSee6Ul2', 1);
insert into users (id, name, u_password, role) values (497, 'Kimberli', 'IVKk8VXVfh', 1);
insert into users (id, name, u_password, role) values (498, 'Burty', 'ZYgLXN7', 1);
insert into users (id, name, u_password, role) values (499, 'Viviene', 'ML7b8Y', 1);
insert into users (id, name, u_password, role) values (500, 'Friederike', 'qEAOgHlIi', 1);
insert into users (id, name, u_password, role) values (501, 'Calla', 'gquF62Aokx', 1);
insert into users (id, name, u_password, role) values (502, 'Ursala', '3WGGztFXv', 1);
insert into users (id, name, u_password, role) values (503, 'Gottfried', 'OZgz0iKy8', 1);
insert into users (id, name, u_password, role) values (504, 'Darya', 'dcSFzUM', 1);
insert into users (id, name, u_password, role) values (505, 'Roselle', 'yKgE63lgw4Wf', 1);
insert into users (id, name, u_password, role) values (506, 'Julian', '62FweMQXJjqA', 1);
insert into users (id, name, u_password, role) values (507, 'Janeva', 'DdX1iWu7', 1);
insert into users (id, name, u_password, role) values (508, 'Ediva', 'zM7WCnyKjV', 1);
insert into users (id, name, u_password, role) values (509, 'Alexia', 'htdLuZ', 1);
insert into users (id, name, u_password, role) values (510, 'Bree', '3AUWGjmiCcIw', 1);
insert into users (id, name, u_password, role) values (511, 'Dawna', 'kbOOcQdyf8Q', 1);
insert into users (id, name, u_password, role) values (512, 'Tami', 'vSwg8F', 1);
insert into users (id, name, u_password, role) values (513, 'Morgen', '4OvAm0g', 1);
insert into users (id, name, u_password, role) values (514, 'Melony', 'B86y7U', 1);
insert into users (id, name, u_password, role) values (515, 'Alfredo', 'MP4FrgLwc', 1);
insert into users (id, name, u_password, role) values (516, 'Tull', 'QICylY1LVdn', 1);
insert into users (id, name, u_password, role) values (517, 'Pavla', 'cmwwvt38cZn', 1);
insert into users (id, name, u_password, role) values (518, 'Cissiee', 'SGCgiR8droyt', 1);
insert into users (id, name, u_password, role) values (519, 'Jonie', '0rhDvDtRNlaS', 1);
insert into users (id, name, u_password, role) values (520, 'Teddi', 'BEM2TJ', 1);
insert into users (id, name, u_password, role) values (521, 'Marlin', 'XLLEBI', 1);
insert into users (id, name, u_password, role) values (522, 'Kalli', '43Pe1C2GI73', 1);
insert into users (id, name, u_password, role) values (523, 'Joela', 'h87ROz', 1);
insert into users (id, name, u_password, role) values (524, 'Bard', 'Q2kT6suuzTke', 1);
insert into users (id, name, u_password, role) values (525, 'Gilbertina', 'BLEHKa', 1);
insert into users (id, name, u_password, role) values (526, 'Doy', 'pNX8pgpK', 1);
insert into users (id, name, u_password, role) values (527, 'Gareth', 'kXkII2WQiQ', 1);
insert into users (id, name, u_password, role) values (528, 'Margaretha', 'JHaSXKWRSP', 1);
insert into users (id, name, u_password, role) values (529, 'Hervey', 'TAvcVN8', 1);
insert into users (id, name, u_password, role) values (530, 'Crosby', 'Ki0pLfwaGOhM', 1);
insert into users (id, name, u_password, role) values (531, 'Manolo', 'A9YFGWP0l5', 1);
insert into users (id, name, u_password, role) values (532, 'Loria', 'GmljFd3O6ASk', 1);
insert into users (id, name, u_password, role) values (533, 'Man', 'T3sTmrQFieL', 1);
insert into users (id, name, u_password, role) values (534, 'Darda', 'UaZ7GA', 1);
insert into users (id, name, u_password, role) values (535, 'Issi', 'lUiSQJ', 1);
insert into users (id, name, u_password, role) values (536, 'Nadine', 'hi3e4ltQnVZa', 1);
insert into users (id, name, u_password, role) values (537, 'Addie', '5EwNzcjpPafm', 1);
insert into users (id, name, u_password, role) values (538, 'Jerry', 'gtRkhNH', 1);
insert into users (id, name, u_password, role) values (539, 'Brooke', 'SyuPwG14usS', 1);
insert into users (id, name, u_password, role) values (540, 'Ema', 'jWbaqmbJt', 1);
insert into users (id, name, u_password, role) values (541, 'Eugenio', '5v5qbq5', 1);
insert into users (id, name, u_password, role) values (542, 'Rutherford', 'Y1OXOzxHXU', 1);
insert into users (id, name, u_password, role) values (543, 'Morrie', 'mmvBGg6SUNM', 1);
insert into users (id, name, u_password, role) values (544, 'Elihu', 'uCiy3DvfUF3', 1);
insert into users (id, name, u_password, role) values (545, 'Roddy', 'WcjcWN', 1);
insert into users (id, name, u_password, role) values (546, 'Karee', 'WmE2siD', 1);
insert into users (id, name, u_password, role) values (547, 'Ottilie', 'HLZwPDXiC', 1);
insert into users (id, name, u_password, role) values (548, 'Anderea', '5gq4Sop3m', 1);
insert into users (id, name, u_password, role) values (549, 'Claresta', 'ZkUuYkxHrSq3', 1);
insert into users (id, name, u_password, role) values (550, 'Hughie', 'AoZkigvvIY', 1);
insert into users (id, name, u_password, role) values (551, 'Pauline', 'I30xMZ38ejG', 1);
insert into users (id, name, u_password, role) values (552, 'Joelie', 'Yun9UxO', 1);
insert into users (id, name, u_password, role) values (553, 'Debi', 'j5IvSGNb', 1);
insert into users (id, name, u_password, role) values (554, 'Fey', '2t7VqE8feLWy', 1);
insert into users (id, name, u_password, role) values (555, 'Malory', 'rCL1JSz', 1);
insert into users (id, name, u_password, role) values (556, 'Luciana', 'stbINq1W', 1);
insert into users (id, name, u_password, role) values (557, 'Perceval', 'fylXHhLcV', 1);
insert into users (id, name, u_password, role) values (558, 'Marlo', 'hUm1DtF', 1);
insert into users (id, name, u_password, role) values (559, 'Colin', 'zryswwoamk', 1);
insert into users (id, name, u_password, role) values (560, 'Bo', 'RVyh03FKq', 1);
insert into users (id, name, u_password, role) values (561, 'Robbert', 'ESsNZmMpVq3', 1);
insert into users (id, name, u_password, role) values (562, 'Shirlene', 'VweSms3m', 1);
insert into users (id, name, u_password, role) values (563, 'Steffen', 'KZw4snmjodD', 1);
insert into users (id, name, u_password, role) values (564, 'Raina', 'Pop466H37e', 1);
insert into users (id, name, u_password, role) values (565, 'Olwen', 'qkrV2aFH9', 1);
insert into users (id, name, u_password, role) values (566, 'Arlen', 'wvn6f4PjU', 1);
insert into users (id, name, u_password, role) values (567, 'Rosanna', '9YOhZo2', 1);
insert into users (id, name, u_password, role) values (568, 'Dougy', 'sCfbXD7C', 1);
insert into users (id, name, u_password, role) values (569, 'Carver', 'z7FNDk', 1);
insert into users (id, name, u_password, role) values (570, 'Pauly', 'FcBTNL', 1);
insert into users (id, name, u_password, role) values (571, 'Mozes', 'vxJsxk4', 1);
insert into users (id, name, u_password, role) values (572, 'Tanhya', 'PArHUTRg', 1);
insert into users (id, name, u_password, role) values (573, 'Gwynne', 'T6qJn0g8Rq', 1);
insert into users (id, name, u_password, role) values (574, 'Mureil', 'VyhfKO', 1);
insert into users (id, name, u_password, role) values (575, 'Immanuel', 'MgeEtU', 1);
insert into users (id, name, u_password, role) values (576, 'Johnette', 'GxK5OGTtl', 1);
insert into users (id, name, u_password, role) values (577, 'Ashlee', 'l216lZI', 1);
insert into users (id, name, u_password, role) values (578, 'Mic', 'WSFkhgraeFE', 1);
insert into users (id, name, u_password, role) values (579, 'Nicolette', 'ZgM4cF', 1);
insert into users (id, name, u_password, role) values (580, 'Hansiain', 'lb5AM9k', 1);
insert into users (id, name, u_password, role) values (581, 'Dael', 'B0qzULZqf', 1);
insert into users (id, name, u_password, role) values (582, 'Obed', 'X7eRzgloWibr', 1);
insert into users (id, name, u_password, role) values (583, 'Annalee', 'DL1X1o7I', 1);
insert into users (id, name, u_password, role) values (584, 'Pippo', 'JfarxE', 1);
insert into users (id, name, u_password, role) values (585, 'Audrie', 'dQxnt1heHUrm', 1);
insert into users (id, name, u_password, role) values (586, 'Stefa', 'AWkC1gybm', 1);
insert into users (id, name, u_password, role) values (587, 'Elane', '8ZWMKww', 1);
insert into users (id, name, u_password, role) values (588, 'Hesther', 'Vpz0jcS3Ra', 1);
insert into users (id, name, u_password, role) values (589, 'Haslett', 'sZ6YzrwlTBHv', 1);
insert into users (id, name, u_password, role) values (590, 'Teddy', 'CxLpGmXW', 1);
insert into users (id, name, u_password, role) values (591, 'Leif', 'AvcCeh', 1);
insert into users (id, name, u_password, role) values (592, 'Libbie', 'fTR9cHM2aYOa', 1);
insert into users (id, name, u_password, role) values (593, 'Arden', 'ghpqYcq1g', 1);
insert into users (id, name, u_password, role) values (594, 'Shane', '1LFfB5Yi2dN6', 1);
insert into users (id, name, u_password, role) values (595, 'Bond', 'am45Ahnqidoi', 1);
insert into users (id, name, u_password, role) values (596, 'Gayel', '8oNgIPLrO', 1);
insert into users (id, name, u_password, role) values (597, 'Dorolisa', 'abGZki', 1);
insert into users (id, name, u_password, role) values (598, 'Bud', 'cVXJ4HG3bwSm', 1);
insert into users (id, name, u_password, role) values (599, 'Cherie', 'lLUm50n', 1);
insert into users (id, name, u_password, role) values (600, 'Lela', 'M63SoJ', 1);
insert into users (id, name, u_password, role) values (601, 'Darline', 'GrfdoS0wIMj', 1);
insert into users (id, name, u_password, role) values (602, 'Aylmer', 'xUrID3', 1);
insert into users (id, name, u_password, role) values (603, 'Valenka', 'yhGPRhrSX8pZ', 1);
insert into users (id, name, u_password, role) values (604, 'Austin', 'rMKLgATDvpn', 1);
insert into users (id, name, u_password, role) values (605, 'Shelly', '5wxcJqKi6cZ', 1);
insert into users (id, name, u_password, role) values (606, 'Emmalyn', 'nYM8x9b0', 1);
insert into users (id, name, u_password, role) values (607, 'Tyrus', 'HJddP2Xe7n', 1);
insert into users (id, name, u_password, role) values (608, 'Millie', 'VztyVK9R4M', 1);
insert into users (id, name, u_password, role) values (609, 'Amber', '7qiJPTsH3', 1);
insert into users (id, name, u_password, role) values (610, 'Halli', 'TbVq3vrGo', 1);
insert into users (id, name, u_password, role) values (611, 'Arabel', 'DUcK2oRvfFf', 1);
insert into users (id, name, u_password, role) values (612, 'Christin', 'lNPDDjbU', 1);
insert into users (id, name, u_password, role) values (613, 'Valentine', 'nm2CMAoP58c', 1);
insert into users (id, name, u_password, role) values (614, 'Mitzi', 'ci6RvLV4ab', 1);
insert into users (id, name, u_password, role) values (615, 'Horace', 'XrXE8l', 1);
insert into users (id, name, u_password, role) values (616, 'Maggy', '610wKwc', 1);
insert into users (id, name, u_password, role) values (617, 'Jedidiah', 'LICvdF', 1);
insert into users (id, name, u_password, role) values (618, 'Libbi', 'WRsXOX', 1);
insert into users (id, name, u_password, role) values (619, 'Luella', 'POaGBgBBbw', 1);
insert into users (id, name, u_password, role) values (620, 'Helenelizabeth', 'nJxEr6woe', 1);
insert into users (id, name, u_password, role) values (621, 'Katya', 'WoREqh', 1);
insert into users (id, name, u_password, role) values (622, 'Butch', 'tqUWOfjrig', 1);
insert into users (id, name, u_password, role) values (623, 'Annmarie', '0o6hatYtCnH', 1);
insert into users (id, name, u_password, role) values (624, 'Amandi', 'l3XS7CZq0', 1);
insert into users (id, name, u_password, role) values (625, 'Toma', 'g0dLSLDsiy8', 1);
insert into users (id, name, u_password, role) values (626, 'Adore', 'tUtmlMi', 1);
insert into users (id, name, u_password, role) values (627, 'Silvain', 'aTi7iMoC', 1);
insert into users (id, name, u_password, role) values (628, 'Milli', 'EKTPI35BS', 1);
insert into users (id, name, u_password, role) values (629, 'Adriena', 'jv9nJIf', 1);
insert into users (id, name, u_password, role) values (630, 'Meridith', 'd3nlfIc7', 1);
insert into users (id, name, u_password, role) values (631, 'Leopold', 'k8SmLl', 1);
insert into users (id, name, u_password, role) values (632, 'Amye', 'PWNuHwVH', 1);
insert into users (id, name, u_password, role) values (633, 'Marabel', 'uMD1wKiW6yNO', 1);
insert into users (id, name, u_password, role) values (634, 'Dennie', 'ChpD27DE2v', 1);
insert into users (id, name, u_password, role) values (635, 'Norah', 'dhA83mP', 1);
insert into users (id, name, u_password, role) values (636, 'Linoel', '0748T6Sr', 1);
insert into users (id, name, u_password, role) values (637, 'Annabela', 'rFl2HMOnW9R4', 1);
insert into users (id, name, u_password, role) values (638, 'Barbie', 'y7G30Zpk8', 1);
insert into users (id, name, u_password, role) values (639, 'Trix', 'PE3wT5Rcn', 1);
insert into users (id, name, u_password, role) values (640, 'Pooh', 'DnSXQq0xq9g4', 1);
insert into users (id, name, u_password, role) values (641, 'Carmelia', 'PSWxgmr', 1);
insert into users (id, name, u_password, role) values (642, 'Virgil', 'RtlOes1H', 1);
insert into users (id, name, u_password, role) values (643, 'Parrnell', 'sx7KXm', 1);
insert into users (id, name, u_password, role) values (644, 'Cherri', 'dq36MywnbTV0', 1);
insert into users (id, name, u_password, role) values (645, 'Stu', 'ZFoOLiw', 1);
insert into users (id, name, u_password, role) values (646, 'Caspar', '1H7nJk7dch2', 1);
insert into users (id, name, u_password, role) values (647, 'Pattin', 'lOl2YBUQ3Z6', 1);
insert into users (id, name, u_password, role) values (648, 'Grantham', 'OCtCGpZxVEFa', 1);
insert into users (id, name, u_password, role) values (649, 'Jarred', 'bV7DGKf28', 1);
insert into users (id, name, u_password, role) values (650, 'Gregor', 'LaySvJjAxnog', 1);
insert into users (id, name, u_password, role) values (651, 'Indira', '9fZgR6HBp', 1);
insert into users (id, name, u_password, role) values (652, 'Angil', 'KF1wfom5TjH', 1);
insert into users (id, name, u_password, role) values (653, 'Jarred', 'TUfPPWF', 1);
insert into users (id, name, u_password, role) values (654, 'Jennette', '3cUlNL65l', 1);
insert into users (id, name, u_password, role) values (655, 'Joellen', 'yuvzrPT7QOR', 1);
insert into users (id, name, u_password, role) values (656, 'Yovonnda', 'vYx9uUoGGF', 1);
insert into users (id, name, u_password, role) values (657, 'Madlin', 'YgEb9q', 1);
insert into users (id, name, u_password, role) values (658, 'Danni', 'LOUX5P97', 1);
insert into users (id, name, u_password, role) values (659, 'Archambault', 'Lq3Z51BLe', 1);
insert into users (id, name, u_password, role) values (660, 'Boone', 'jcNDRoYDQ240', 1);
insert into users (id, name, u_password, role) values (661, 'Marquita', '3gO6wCD', 1);
insert into users (id, name, u_password, role) values (662, 'Damiano', '0bU3yQk36HG', 1);
insert into users (id, name, u_password, role) values (663, 'Cirillo', 'm1PI1wiUYFbM', 1);
insert into users (id, name, u_password, role) values (664, 'Sanson', 'QZhTvGJMPw', 1);
insert into users (id, name, u_password, role) values (665, 'Nanette', 'Radgc77LjIe', 1);
insert into users (id, name, u_password, role) values (666, 'Curt', 'tyh7eqJtbD2O', 1);
insert into users (id, name, u_password, role) values (667, 'Jayne', 'PUxxpo', 1);
insert into users (id, name, u_password, role) values (668, 'Blondell', 'DU73b5apLv', 1);
insert into users (id, name, u_password, role) values (669, 'Kort', 'eKLaXY6VwnZg', 1);
insert into users (id, name, u_password, role) values (670, 'Sigrid', '22m4ONNlvj', 1);
insert into users (id, name, u_password, role) values (671, 'Kinna', 'W8wILa9ntjI', 1);
insert into users (id, name, u_password, role) values (672, 'Regina', 'lInDoXk', 1);
insert into users (id, name, u_password, role) values (673, 'Wolfgang', 'hAxLb3ptqw', 1);
insert into users (id, name, u_password, role) values (674, 'Malchy', 'Q9Vrx6', 1);
insert into users (id, name, u_password, role) values (675, 'Giorgio', 'i8lStMyYTc', 1);
insert into users (id, name, u_password, role) values (676, 'Johannes', 'gfULAqv9rXrd', 1);
insert into users (id, name, u_password, role) values (677, 'Marion', 'gUK7kYnqlf', 1);
insert into users (id, name, u_password, role) values (678, 'Shane', 'w7opcN', 1);
insert into users (id, name, u_password, role) values (679, 'Vanya', 'P52a5gfMJ', 1);
insert into users (id, name, u_password, role) values (680, 'Berenice', 'NcFebkkOOu7r', 1);
insert into users (id, name, u_password, role) values (681, 'Butch', 'PucSNx', 1);
insert into users (id, name, u_password, role) values (682, 'Evanne', 'AdcDCifXC', 1);
insert into users (id, name, u_password, role) values (683, 'Hercules', 'bpKgFfJXHvIP', 1);
insert into users (id, name, u_password, role) values (684, 'Milicent', 'IAamcjQWZd', 1);
insert into users (id, name, u_password, role) values (685, 'Rorke', 'Q5LWCcoHNO6r', 1);
insert into users (id, name, u_password, role) values (686, 'Pepi', 'gYftr3PR', 1);
insert into users (id, name, u_password, role) values (687, 'Letitia', '1zbFjX21c', 1);
insert into users (id, name, u_password, role) values (688, 'Ashton', 'uGIJeacD', 1);
insert into users (id, name, u_password, role) values (689, 'Flossy', 'pADsmhybGr', 1);
insert into users (id, name, u_password, role) values (690, 'Scot', 'ow8OtNvEdnNB', 1);
insert into users (id, name, u_password, role) values (691, 'Doralynn', 'gRzW6Sh9U3Xd', 1);
insert into users (id, name, u_password, role) values (692, 'Jacklin', '6dxxnRJERc0C', 1);
insert into users (id, name, u_password, role) values (693, 'Arnold', 'qVLoNXNefB', 1);
insert into users (id, name, u_password, role) values (694, 'Alano', 'AJQN2JG', 1);
insert into users (id, name, u_password, role) values (695, 'Davon', 'NDjg6uHiVXuD', 1);
insert into users (id, name, u_password, role) values (696, 'Kelli', 'STpYiUG', 1);
insert into users (id, name, u_password, role) values (697, 'Glenn', 'npo7jlbb', 1);
insert into users (id, name, u_password, role) values (698, 'Brynne', '0xXuTfEq', 1);
insert into users (id, name, u_password, role) values (699, 'Kessiah', 'LnIGPr', 1);
insert into users (id, name, u_password, role) values (700, 'Caria', 'GOSZd2', 1);
insert into users (id, name, u_password, role) values (701, 'Billy', 'spHFntAv', 1);
insert into users (id, name, u_password, role) values (702, 'Cecelia', '417yWMyBFny', 1);
insert into users (id, name, u_password, role) values (703, 'Carlie', 'ZqiyhCbIr', 1);
insert into users (id, name, u_password, role) values (704, 'Chrotoem', '4LAVPcexxCYr', 1);
insert into users (id, name, u_password, role) values (705, 'Darrelle', 'Ju1mxRqOJH', 1);
insert into users (id, name, u_password, role) values (706, 'Christopher', 'QVwzLxZjJ', 1);
insert into users (id, name, u_password, role) values (707, 'Addie', '2xZzOkb', 1);
insert into users (id, name, u_password, role) values (708, 'Tonya', 'thZzhpKjgR0', 1);
insert into users (id, name, u_password, role) values (709, 'Berny', 'EXvoAngzsc', 1);
insert into users (id, name, u_password, role) values (710, 'Dolph', 'T4lYRbNF2e', 1);
insert into users (id, name, u_password, role) values (711, 'Sada', 'z3FZVrBu3T', 1);
insert into users (id, name, u_password, role) values (712, 'Bianka', 'KG06mY5Y', 1);
insert into users (id, name, u_password, role) values (713, 'Faith', 'NNto0c', 1);
insert into users (id, name, u_password, role) values (714, 'Rana', 'jPqsgpm2X', 1);
insert into users (id, name, u_password, role) values (715, 'Millie', 'wi3kAE', 1);
insert into users (id, name, u_password, role) values (716, 'Wheeler', 'pl0GYR4Oga1O', 1);
insert into users (id, name, u_password, role) values (717, 'Wilmer', '4uNG73czH', 1);
insert into users (id, name, u_password, role) values (718, 'Netty', 'SicIt2ll', 1);
insert into users (id, name, u_password, role) values (719, 'Sheree', 'HZ8jUYuKq43', 1);
insert into users (id, name, u_password, role) values (720, 'Jereme', 'rxhMEhUDcF8', 1);
insert into users (id, name, u_password, role) values (721, 'Charlotte', 'gyjETbA', 1);
insert into users (id, name, u_password, role) values (722, 'Rubina', 'Z61SuB63bMH', 1);
insert into users (id, name, u_password, role) values (723, 'Woodie', 'za6nsod6pW', 1);
insert into users (id, name, u_password, role) values (724, 'Linnet', 'sKoSK3ccDKp', 1);
insert into users (id, name, u_password, role) values (725, 'Jeannie', 'nYsu0XwaHPXk', 1);
insert into users (id, name, u_password, role) values (726, 'Emmet', 'Erep3m', 1);
insert into users (id, name, u_password, role) values (727, 'Leslie', 'hXDqgexy8', 1);
insert into users (id, name, u_password, role) values (728, 'Leo', 'k1I1cTaG', 1);
insert into users (id, name, u_password, role) values (729, 'Milli', 'tCzCXF', 1);
insert into users (id, name, u_password, role) values (730, 'Beverlee', 'Hqo21oqAO8JC', 1);
insert into users (id, name, u_password, role) values (731, 'Elmo', 'fnovaec', 1);
insert into users (id, name, u_password, role) values (732, 'Ingrim', 'iz6mKWGpq0', 1);
insert into users (id, name, u_password, role) values (733, 'Vallie', 'lCqnnsDtwC8', 1);
insert into users (id, name, u_password, role) values (734, 'Johann', 'RBvvFn', 1);
insert into users (id, name, u_password, role) values (735, 'Eleanor', 'dG3iGoyJC', 1);
insert into users (id, name, u_password, role) values (736, 'Herve', 'GbAwEydCcgc', 1);
insert into users (id, name, u_password, role) values (737, 'Casie', 'uIllx2HQ6Y', 1);
insert into users (id, name, u_password, role) values (738, 'Nell', '3cId2T', 1);
insert into users (id, name, u_password, role) values (739, 'Cyrillus', 'CAAMkZDN4', 1);
insert into users (id, name, u_password, role) values (740, 'Isidor', 'cU1zmfIsF3C4', 1);
insert into users (id, name, u_password, role) values (741, 'Delcina', 'WXeQm8A', 1);
insert into users (id, name, u_password, role) values (742, 'Donia', 'kYMfdcVyY8dL', 1);
insert into users (id, name, u_password, role) values (743, 'Devora', 'L5MZoalE8QQO', 1);
insert into users (id, name, u_password, role) values (744, 'Hedvige', '9piKsEJk', 1);
insert into users (id, name, u_password, role) values (745, 'Sibelle', 'lTvto7lkQESl', 1);
insert into users (id, name, u_password, role) values (746, 'Valenka', 'PpNxmxD88', 1);
insert into users (id, name, u_password, role) values (747, 'Griffith', '2alxzVx', 1);
insert into users (id, name, u_password, role) values (748, 'Jerry', 'utzvhVr', 1);
insert into users (id, name, u_password, role) values (749, 'Leighton', 'i7JSIKy4WYuM', 1);
insert into users (id, name, u_password, role) values (750, 'Carlynne', 'Eghcryv5Qo5', 1);
insert into users (id, name, u_password, role) values (751, 'Aviva', 'z85WVWoP', 1);
insert into users (id, name, u_password, role) values (752, 'Lothario', '5Ov6abc', 1);
insert into users (id, name, u_password, role) values (753, 'Sigfried', 'pvIxfWp', 1);
insert into users (id, name, u_password, role) values (754, 'Cherianne', 'TcxNESO', 1);
insert into users (id, name, u_password, role) values (755, 'Esmaria', 'WoTtN2PaFb', 1);
insert into users (id, name, u_password, role) values (756, 'Meris', 'nFvy8GSRbJYL', 1);
insert into users (id, name, u_password, role) values (757, 'Ira', 'UKbaQubUWFa', 1);
insert into users (id, name, u_password, role) values (758, 'Manolo', 'PorE6fNAUkJ', 1);
insert into users (id, name, u_password, role) values (759, 'Garik', 'KwcUsTGwX4', 1);
insert into users (id, name, u_password, role) values (760, 'Burgess', 'uZL4cifxYD', 1);
insert into users (id, name, u_password, role) values (761, 'Brannon', 'wVnScJTONO', 1);
insert into users (id, name, u_password, role) values (762, 'Raddy', 'lLJK7OG6rB', 1);
insert into users (id, name, u_password, role) values (763, 'Edik', 'X0bHRs', 1);
insert into users (id, name, u_password, role) values (764, 'Ware', 'pn4O5TQ8q', 1);
insert into users (id, name, u_password, role) values (765, 'Pablo', 'gNNxYAHp', 1);
insert into users (id, name, u_password, role) values (766, 'Ash', '8CUgNQvDFx', 1);
insert into users (id, name, u_password, role) values (767, 'Marga', 'aknSnIpgJ', 1);
insert into users (id, name, u_password, role) values (768, 'Selene', 'z3A29ILuh', 1);
insert into users (id, name, u_password, role) values (769, 'Wilfred', 'TomKYUacUZjI', 1);
insert into users (id, name, u_password, role) values (770, 'Smitty', 'QcOfz8aMst1y', 1);
insert into users (id, name, u_password, role) values (771, 'Dorelle', 'YpVgi7nFyBg', 1);
insert into users (id, name, u_password, role) values (772, 'Patten', 'Vem1XkC2', 1);
insert into users (id, name, u_password, role) values (773, 'Trudy', 'Go3vDKvz', 1);
insert into users (id, name, u_password, role) values (774, 'Loralee', 'CKckZo', 1);
insert into users (id, name, u_password, role) values (775, 'Patricio', 'mtLfXNk8LMGL', 1);
insert into users (id, name, u_password, role) values (776, 'Ferdie', 'HzIKx1WF7iBR', 1);
insert into users (id, name, u_password, role) values (777, 'Scarlet', 'CZfPYeIAUu3h', 1);
insert into users (id, name, u_password, role) values (778, 'Clemmie', '3mb3HyXVm8', 1);
insert into users (id, name, u_password, role) values (779, 'Kali', 'mx6YHSegq', 1);
insert into users (id, name, u_password, role) values (780, 'Hakim', 'XqQ94Kd3sf', 1);
insert into users (id, name, u_password, role) values (781, 'Hali', 'hm5mNxYv', 1);
insert into users (id, name, u_password, role) values (782, 'Henrie', '2YCvVHXnye9A', 1);
insert into users (id, name, u_password, role) values (783, 'Avril', 'JFJvFJISB', 1);
insert into users (id, name, u_password, role) values (784, 'Cull', 'LGPefWLFI', 1);
insert into users (id, name, u_password, role) values (785, 'Edan', '2HeRGDAz9i', 1);
insert into users (id, name, u_password, role) values (786, 'Kath', 'HmH1hEC', 1);
insert into users (id, name, u_password, role) values (787, 'Fergus', 'fRYwCOoBJO', 1);
insert into users (id, name, u_password, role) values (788, 'Brigham', 'yz6tCDxPec', 1);
insert into users (id, name, u_password, role) values (789, 'Cleopatra', 'WY2sfexq', 1);
insert into users (id, name, u_password, role) values (790, 'Chancey', 'o1LKJUcj', 1);
insert into users (id, name, u_password, role) values (791, 'Marian', 'vOcXIz4MsmmQ', 1);
insert into users (id, name, u_password, role) values (792, 'Jasen', 'aIKDh0W4', 1);
insert into users (id, name, u_password, role) values (793, 'Gan', 'zrzVoSqKmXx', 1);
insert into users (id, name, u_password, role) values (794, 'Mommy', '5NeI0K7pmY', 1);
insert into users (id, name, u_password, role) values (795, 'Tybie', 'F3qQQPGN6BTV', 1);
insert into users (id, name, u_password, role) values (796, 'Rriocard', '5C52UZmyYiq', 1);
insert into users (id, name, u_password, role) values (797, 'Britney', 'Z2ZNN1N7gGtQ', 1);
insert into users (id, name, u_password, role) values (798, 'Tadeas', 'UG3oV73', 1);
insert into users (id, name, u_password, role) values (799, 'Danie', 'ClMeqQu', 1);
insert into users (id, name, u_password, role) values (800, 'Alwyn', 'DrhZQJ8uZF', 1);
insert into users (id, name, u_password, role) values (801, 'Bryan', 'yGhKBVdyv', 1);
insert into users (id, name, u_password, role) values (802, 'Elli', 'vBLiJJe0F', 1);
insert into users (id, name, u_password, role) values (803, 'Dorelle', 'IG1NqZjwO', 1);
insert into users (id, name, u_password, role) values (804, 'Cornela', '3acqrqg7BJ2', 1);
insert into users (id, name, u_password, role) values (805, 'Tracy', 'CVvHeuOkNJRS', 1);
insert into users (id, name, u_password, role) values (806, 'Netty', 'gEPMIF', 1);
insert into users (id, name, u_password, role) values (807, 'Berri', 'M8pT59C56vdt', 1);
insert into users (id, name, u_password, role) values (808, 'Sofie', 'nYm5mckN', 1);
insert into users (id, name, u_password, role) values (809, 'Paolina', 'LtapX2TLoLl9', 1);
insert into users (id, name, u_password, role) values (810, 'Lamont', 'q5sfLl1tzBWW', 1);
insert into users (id, name, u_password, role) values (811, 'Mohandis', 'UAn4FGUV2ht', 1);
insert into users (id, name, u_password, role) values (812, 'Berke', 'mgKtONZ', 1);
insert into users (id, name, u_password, role) values (813, 'Maximilian', '4dUjrRYE7vtI', 1);
insert into users (id, name, u_password, role) values (814, 'Johannes', 'LkYGdOmrT', 1);
insert into users (id, name, u_password, role) values (815, 'Matilda', 'hPLC0k', 1);
insert into users (id, name, u_password, role) values (816, 'Burgess', '0MdKeox5', 1);
insert into users (id, name, u_password, role) values (817, 'Avram', 'TN1p47', 1);
insert into users (id, name, u_password, role) values (818, 'Merwyn', 'CtlXtEO', 1);
insert into users (id, name, u_password, role) values (819, 'Guinevere', '60euolcM1a', 1);
insert into users (id, name, u_password, role) values (820, 'Joel', 'Ei0xej', 1);
insert into users (id, name, u_password, role) values (821, 'Batholomew', '0sek86s', 1);
insert into users (id, name, u_password, role) values (822, 'Merill', 'wmYO0c', 1);
insert into users (id, name, u_password, role) values (823, 'Lynelle', 'MzctBgq', 1);
insert into users (id, name, u_password, role) values (824, 'Kellby', 'cuZg4XL3Sn', 1);
insert into users (id, name, u_password, role) values (825, 'Malynda', 'VZ4S5Sb7', 1);
insert into users (id, name, u_password, role) values (826, 'Jermaine', 'bWene4Bg5DX', 1);
insert into users (id, name, u_password, role) values (827, 'Clementina', 'nRSQpKBmy', 1);
insert into users (id, name, u_password, role) values (828, 'Ailee', 'Kr27yjq7g0', 1);
insert into users (id, name, u_password, role) values (829, 'Klemens', 'SVB1CIKH', 1);
insert into users (id, name, u_password, role) values (830, 'Jennette', 'sZA4nh84XKR', 1);
insert into users (id, name, u_password, role) values (831, 'Stephenie', 'nOgUP1zICru5', 1);
insert into users (id, name, u_password, role) values (832, 'Reese', 'CIHnoS', 1);
insert into users (id, name, u_password, role) values (833, 'Jasen', '0PzwOVs3I', 1);
insert into users (id, name, u_password, role) values (834, 'Misty', 'HFT5BXdi', 1);
insert into users (id, name, u_password, role) values (835, 'Faina', '7WsvwRMSOHBE', 1);
insert into users (id, name, u_password, role) values (836, 'Palmer', 'UanPaVbx', 1);
insert into users (id, name, u_password, role) values (837, 'Jourdain', 'Tq6iKHX6FTz', 1);
insert into users (id, name, u_password, role) values (838, 'Cletus', 'qDxzNnmioE', 1);
insert into users (id, name, u_password, role) values (839, 'Adrian', 'pM0vifLWQjRB', 1);
insert into users (id, name, u_password, role) values (840, 'Margarita', 'B3Gz00', 1);
insert into users (id, name, u_password, role) values (841, 'Tamarra', 'QdasRyhJ', 1);
insert into users (id, name, u_password, role) values (842, 'Frasco', 'oxZKcnT', 1);
insert into users (id, name, u_password, role) values (843, 'Kristine', 'w30k7zqNn', 1);
insert into users (id, name, u_password, role) values (844, 'Berenice', 'DUMzC8pW2Ob', 1);
insert into users (id, name, u_password, role) values (845, 'Rebekah', 'dBmkhfF1Zk', 1);
insert into users (id, name, u_password, role) values (846, 'Barbi', '3QZSErbHSFT', 1);
insert into users (id, name, u_password, role) values (847, 'Eran', '1CiPTgDQNW', 1);
insert into users (id, name, u_password, role) values (848, 'Suki', 'hvSX5toKe', 1);
insert into users (id, name, u_password, role) values (849, 'Goran', 'RqPRWIpnW', 1);
insert into users (id, name, u_password, role) values (850, 'Erin', 'J3jWtP9pm', 1);
insert into users (id, name, u_password, role) values (851, 'Merwyn', 'XTVFOeZr2b2', 1);
insert into users (id, name, u_password, role) values (852, 'Georgena', '2xYBsLdod', 1);
insert into users (id, name, u_password, role) values (853, 'Dacey', 'bgHbHkqDIfIg', 1);
insert into users (id, name, u_password, role) values (854, 'Edi', 'j1p4sRxp', 1);
insert into users (id, name, u_password, role) values (855, 'North', '52IAziLrRjiB', 1);
insert into users (id, name, u_password, role) values (856, 'Carmelita', 'BzGDsmWM8O', 1);
insert into users (id, name, u_password, role) values (857, 'Alasdair', 'kM3wp8smzaM', 1);
insert into users (id, name, u_password, role) values (858, 'Herta', 'l2dWHybr2S4', 1);
insert into users (id, name, u_password, role) values (859, 'Roma', 'nZqXbYs1fir', 1);
insert into users (id, name, u_password, role) values (860, 'Iggy', 'SVMaIBTZ', 1);
insert into users (id, name, u_password, role) values (861, 'Dayna', 'kpnG3Pr2XkFJ', 1);
insert into users (id, name, u_password, role) values (862, 'Marcelia', 'QM00fVISM249', 1);
insert into users (id, name, u_password, role) values (863, 'Corey', 'DiZPSPHhYUF', 1);
insert into users (id, name, u_password, role) values (864, 'Ken', 'JkZiBNKUhqC', 1);
insert into users (id, name, u_password, role) values (865, 'Matthias', 'AV495F5', 1);
insert into users (id, name, u_password, role) values (866, 'Stephenie', 'xfPHSx', 1);
insert into users (id, name, u_password, role) values (867, 'Diannne', 'xzdl3pkX', 1);
insert into users (id, name, u_password, role) values (868, 'Padriac', 'eQgAOyeidly6', 1);
insert into users (id, name, u_password, role) values (869, 'Gorden', 'ZJunM0wM', 1);
insert into users (id, name, u_password, role) values (870, 'Marieann', 'FQr7PKUOR3e', 1);
insert into users (id, name, u_password, role) values (871, 'Vallie', 'sfuIoI', 1);
insert into users (id, name, u_password, role) values (872, 'Hildegaard', 'dA549W9AY', 1);
insert into users (id, name, u_password, role) values (873, 'Myrwyn', 'nbqHOML', 1);
insert into users (id, name, u_password, role) values (874, 'Marena', 'Ew2PSNx0GA', 1);
insert into users (id, name, u_password, role) values (875, 'Charleen', 'TrmAVCTir3b', 1);
insert into users (id, name, u_password, role) values (876, 'Kellia', 'TEFgmcsXP2', 1);
insert into users (id, name, u_password, role) values (877, 'Norbert', 'vF7Snz', 1);
insert into users (id, name, u_password, role) values (878, 'Blake', 'eAWEjJ65', 1);
insert into users (id, name, u_password, role) values (879, 'Floyd', 'vqTKF8IMj2kn', 1);
insert into users (id, name, u_password, role) values (880, 'Kippy', 'h1QS4ljK', 1);
insert into users (id, name, u_password, role) values (881, 'Boniface', 'evcug8A0Pu', 1);
insert into users (id, name, u_password, role) values (882, 'Aaron', '4DrexKMHV', 1);
insert into users (id, name, u_password, role) values (883, 'Emmaline', '5yASJvWMUh', 1);
insert into users (id, name, u_password, role) values (884, 'Glori', 'AwVOFj73l', 1);
insert into users (id, name, u_password, role) values (885, 'Rubie', '7cVn9D9W9', 1);
insert into users (id, name, u_password, role) values (886, 'Em', '3Bb3vZ7', 1);
insert into users (id, name, u_password, role) values (887, 'Sylvan', '0gj367UHN', 1);
insert into users (id, name, u_password, role) values (888, 'Carlo', 'HtdkrcYj', 1);
insert into users (id, name, u_password, role) values (889, 'Neddy', 'BqLxMj13BCn', 1);
insert into users (id, name, u_password, role) values (890, 'Geri', 'wMw8qMr', 1);
insert into users (id, name, u_password, role) values (891, 'Ninnetta', 'YHK3aVpL05AQ', 1);
insert into users (id, name, u_password, role) values (892, 'Bliss', 'nw5G9r36fe', 1);
insert into users (id, name, u_password, role) values (893, 'Trescha', '8UJQT2', 1);
insert into users (id, name, u_password, role) values (894, 'Ardis', 'z7vcGMjq', 1);
insert into users (id, name, u_password, role) values (895, 'Gradey', 'gwsGZgBgFR', 1);
insert into users (id, name, u_password, role) values (896, 'Madlin', 'jY0yL1xm0BKS', 1);
insert into users (id, name, u_password, role) values (897, 'Kiley', 'CtZg1xM6Qo8', 1);
insert into users (id, name, u_password, role) values (898, 'Con', '13swlChmONY', 1);
insert into users (id, name, u_password, role) values (899, 'Shea', 'IVglMqlLPqxj', 1);
insert into users (id, name, u_password, role) values (900, 'Mayer', 'vdqyUk4', 1);
insert into users (id, name, u_password, role) values (901, 'Maurise', 'PwNWQDxkZ', 1);
insert into users (id, name, u_password, role) values (902, 'Vivyan', 'FaOAzFt11', 1);
insert into users (id, name, u_password, role) values (903, 'Rutledge', 'fnJzreK', 1);
insert into users (id, name, u_password, role) values (904, 'Millard', 'P1fTgsDhbN', 1);
insert into users (id, name, u_password, role) values (905, 'Ly', '65wIdvJJICY', 1);
insert into users (id, name, u_password, role) values (906, 'Florance', 'RvEDdL1K4', 1);
insert into users (id, name, u_password, role) values (907, 'Alidia', 'q5AKkBJnn', 1);
insert into users (id, name, u_password, role) values (908, 'Petronella', 'HAbyWK7I', 1);
insert into users (id, name, u_password, role) values (909, 'Curcio', 'Uajv2CT', 1);
insert into users (id, name, u_password, role) values (910, 'Vernice', 'zVTSdSQ', 1);
insert into users (id, name, u_password, role) values (911, 'Bradley', 'fBwmbqAne', 1);
insert into users (id, name, u_password, role) values (912, 'Heywood', '05QPGiU', 1);
insert into users (id, name, u_password, role) values (913, 'Bendite', '2QZRnuIuE5', 1);
insert into users (id, name, u_password, role) values (914, 'Lyon', 'MNw4YxdYwJur', 1);
insert into users (id, name, u_password, role) values (915, 'Loree', 'mXZBquHK', 1);
insert into users (id, name, u_password, role) values (916, 'Robert', 'BFzKM8h025C', 1);
insert into users (id, name, u_password, role) values (917, 'Joellen', 'WThUYt4', 1);
insert into users (id, name, u_password, role) values (918, 'Kiri', 'E2XwHn', 1);
insert into users (id, name, u_password, role) values (919, 'Langston', 'ZoUclywiQaZT', 1);
insert into users (id, name, u_password, role) values (920, 'Wileen', 'sPedn00fhV8', 1);
insert into users (id, name, u_password, role) values (921, 'Deanne', 'xfvRkL', 1);
insert into users (id, name, u_password, role) values (922, 'Anton', 'jgqJie', 1);
insert into users (id, name, u_password, role) values (923, 'Sandie', 'RdjSxMw4eb4', 1);
insert into users (id, name, u_password, role) values (924, 'Kellen', 'HI1RvmM', 1);
insert into users (id, name, u_password, role) values (925, 'Taddeo', 'MI3Mzt5ITO6x', 1);
insert into users (id, name, u_password, role) values (926, 'Blane', 'tcHpNcJ3oNBs', 1);
insert into users (id, name, u_password, role) values (927, 'Charity', '1vI3esTxLUc', 1);
insert into users (id, name, u_password, role) values (928, 'Adelaida', 'yBz6HJlg6', 1);
insert into users (id, name, u_password, role) values (929, 'Rahal', 'D1WTaASgJh', 1);
insert into users (id, name, u_password, role) values (930, 'Paolina', 'Nrc5q0n4J', 1);
insert into users (id, name, u_password, role) values (931, 'Idell', '7c3qfpvnEiKQ', 1);
insert into users (id, name, u_password, role) values (932, 'Melody', 'UvKjVzKz', 1);
insert into users (id, name, u_password, role) values (933, 'Reyna', 'agGRjfQPO', 1);
insert into users (id, name, u_password, role) values (934, 'Farand', 'RcWYW5Yiw7sl', 1);
insert into users (id, name, u_password, role) values (935, 'Georgy', 'MX0hB5LU', 1);
insert into users (id, name, u_password, role) values (936, 'Cathleen', 'D1qaRTk', 1);
insert into users (id, name, u_password, role) values (937, 'Abbe', 'aqNdnGJcqaT', 1);
insert into users (id, name, u_password, role) values (938, 'Gabbey', 'I9TFOwpCGMVL', 1);
insert into users (id, name, u_password, role) values (939, 'Tomas', '0lWVYB7BJ', 1);
insert into users (id, name, u_password, role) values (940, 'Pasquale', 'XcXQxvUw', 1);
insert into users (id, name, u_password, role) values (941, 'Grove', 'EXMeTYH2mb3P', 1);
insert into users (id, name, u_password, role) values (942, 'Eden', 'YKDUWEG7', 1);
insert into users (id, name, u_password, role) values (943, 'Vincents', 'MlIvm00m', 1);
insert into users (id, name, u_password, role) values (944, 'Darby', 'nONcBA3jvb7', 1);
insert into users (id, name, u_password, role) values (945, 'Harmonia', 'JOUL9wc', 1);
insert into users (id, name, u_password, role) values (946, 'Nolana', 'XaUpLrph', 1);
insert into users (id, name, u_password, role) values (947, 'Merwyn', 'KxkKsbDV', 1);
insert into users (id, name, u_password, role) values (948, 'Arluene', 'y5R90f5v', 1);
insert into users (id, name, u_password, role) values (949, 'Clair', 'QlD1uxmSpx', 1);
insert into users (id, name, u_password, role) values (950, 'Dee dee', 'GAfjRik', 1);
insert into users (id, name, u_password, role) values (951, 'Holmes', 'zWoIWfW', 1);
insert into users (id, name, u_password, role) values (952, 'Gladys', 'RTjyDGbNX', 1);
insert into users (id, name, u_password, role) values (953, 'Casie', 'c6nnaXRY', 1);
insert into users (id, name, u_password, role) values (954, 'Sayre', 'zIsQfi', 1);
insert into users (id, name, u_password, role) values (955, 'Aleece', 'RftRvvxV', 1);
insert into users (id, name, u_password, role) values (956, 'Mandy', 'N1j3dVwmza', 1);
insert into users (id, name, u_password, role) values (957, 'Margaretta', 'OfTlDeH6N', 1);
insert into users (id, name, u_password, role) values (958, 'Shepherd', 'h56ZDuu3B', 1);
insert into users (id, name, u_password, role) values (959, 'Joby', 'IJwGDflIDPy', 1);
insert into users (id, name, u_password, role) values (960, 'Mick', 'wvexaruky', 1);
insert into users (id, name, u_password, role) values (961, 'Bink', 'DHkKc6IJh2tf', 1);
insert into users (id, name, u_password, role) values (962, 'Gael', 'RZsyMZUiy', 1);
insert into users (id, name, u_password, role) values (963, 'Annie', 'O33s4feo8', 1);
insert into users (id, name, u_password, role) values (964, 'Nichole', 'lsr6i6X9R', 1);
insert into users (id, name, u_password, role) values (965, 'Korney', 'LwATYxTW', 1);
insert into users (id, name, u_password, role) values (966, 'Enrika', 'RIzqWK9tAi', 1);
insert into users (id, name, u_password, role) values (967, 'Dorisa', 'xaBB4Wd6g', 1);
insert into users (id, name, u_password, role) values (968, 'Brett', 'oewtR1xb1q', 1);
insert into users (id, name, u_password, role) values (969, 'Antony', 'h0b9AysG4S', 1);
insert into users (id, name, u_password, role) values (970, 'Ardella', 'Ah8a4FhlZKC', 1);
insert into users (id, name, u_password, role) values (971, 'Domenico', 'JumBwLzH2A', 1);
insert into users (id, name, u_password, role) values (972, 'Graehme', 'MdOMQNBIFR', 1);
insert into users (id, name, u_password, role) values (973, 'Amii', 'yEAPkwnpD2J', 1);
insert into users (id, name, u_password, role) values (974, 'Thatch', 'ePI5h0', 1);
insert into users (id, name, u_password, role) values (975, 'Ebonee', 'oxXVKSLV5', 1);
insert into users (id, name, u_password, role) values (976, 'Heindrick', 'B0ipQj23JWB', 1);
insert into users (id, name, u_password, role) values (977, 'Eddi', 'sx21HS3CG4W', 1);
insert into users (id, name, u_password, role) values (978, 'Sanders', 'IIyUiMpV6wg5', 1);
insert into users (id, name, u_password, role) values (979, 'Woodman', 'klF1WPOWfFS', 1);
insert into users (id, name, u_password, role) values (980, 'Dru', 'sa9qOHT', 1);
insert into users (id, name, u_password, role) values (981, 'Ronalda', '5b5bPl', 1);
insert into users (id, name, u_password, role) values (982, 'Judie', 'OpEeuiMocB', 1);
insert into users (id, name, u_password, role) values (983, 'Lexi', 'Nad9WbX8418h', 1);
insert into users (id, name, u_password, role) values (984, 'Sileas', '9KwhdW3Awa', 1);
insert into users (id, name, u_password, role) values (985, 'Rand', 'SrtDwXw', 1);
insert into users (id, name, u_password, role) values (986, 'Lockwood', 'f5jKav84P3', 1);
insert into users (id, name, u_password, role) values (987, 'Sephira', 'tLb6clS73', 1);
insert into users (id, name, u_password, role) values (988, 'Heindrick', 'ESzC9QWQzyk', 1);
insert into users (id, name, u_password, role) values (989, 'Alejandra', 'tmxRHRYT', 1);
insert into users (id, name, u_password, role) values (990, 'Thea', 'FbTVKSHXBfD', 1);
insert into users (id, name, u_password, role) values (991, 'Eugen', 'UCdq04q19vDp', 1);
insert into users (id, name, u_password, role) values (992, 'Roshelle', 'yHWEQpWSGFV', 1);
insert into users (id, name, u_password, role) values (993, 'Otis', 'kY3MkE', 1);
insert into users (id, name, u_password, role) values (994, 'Maximilian', 'NJLGdI19F', 1);
insert into users (id, name, u_password, role) values (995, 'Yevette', 'ockgmgBsf', 1);
insert into users (id, name, u_password, role) values (996, 'Lynelle', 'Jthsqf81gi', 1);
insert into users (id, name, u_password, role) values (997, 'Aube', 'YkP1BalYg', 1);
insert into users (id, name, u_password, role) values (998, 'Henryetta', 'iMhTaZTB', 1);
insert into users (id, name, u_password, role) values (999, 'Gabi', 'wG8jvvR1mJ', 1);
insert into users (id, name, u_password, role) values (1000, 'Dulcea', 'jLBjuFoTTOR', 1);

insert into tags (name)
values ('tag1');
insert into tags (name)
values ('tag2');
insert into tags (name)
values ('tag3');
insert into tags (name)
values ('tag4');
insert into tags (name)
values ('tag5');
insert into tags (name)
values ('tag6');
insert into tags (name)
values ('tag7');
insert into tags (name)
values ('tag8');
insert into tags (name)
values ('tag9');
insert into tags (name)
values ('tag10');
insert into tags (name)
values ('tag11');
insert into tags (name)
values ('tag12');
insert into tags (name)
values ('tag13');
insert into tags (name)
values ('tag14');
insert into tags (name)
values ('tag15');
insert into tags (name)
values ('tag16');
insert into tags (name)
values ('tag17');
insert into tags (name)
values ('tag18');
insert into tags (name)
values ('tag19');
insert into tags (name)
values ('tag20');
insert into tags (name)
values ('tag21');
insert into tags (name)
values ('tag22');
insert into tags (name)
values ('tag23');
insert into tags (name)
values ('tag24');
insert into tags (name)
values ('tag25');
insert into tags (name)
values ('tag26');
insert into tags (name)
values ('tag27');
insert into tags (name)
values ('tag28');
insert into tags (name)
values ('tag29');
insert into tags (name)
values ('tag30');
insert into tags (name)
values ('tag31');
insert into tags (name)
values ('tag32');
insert into tags (name)
values ('tag33');
insert into tags (name)
values ('tag34');
insert into tags (name)
values ('tag35');
insert into tags (name)
values ('tag36');
insert into tags (name)
values ('tag37');
insert into tags (name)
values ('tag38');
insert into tags (name)
values ('tag39');
insert into tags (name)
values ('tag40');
insert into tags (name)
values ('tag41');
insert into tags (name)
values ('tag42');
insert into tags (name)
values ('tag43');
insert into tags (name)
values ('tag44');
insert into tags (name)
values ('tag45');
insert into tags (name)
values ('tag46');
insert into tags (name)
values ('tag47');
insert into tags (name)
values ('tag48');
insert into tags (name)
values ('tag49');
insert into tags (name)
values ('tag50');
insert into tags (name)
values ('tag51');
insert into tags (name)
values ('tag52');
insert into tags (name)
values ('tag53');
insert into tags (name)
values ('tag54');
insert into tags (name)
values ('tag55');
insert into tags (name)
values ('tag56');
insert into tags (name)
values ('tag57');
insert into tags (name)
values ('tag58');
insert into tags (name)
values ('tag59');
insert into tags (name)
values ('tag60');
insert into tags (name)
values ('tag61');
insert into tags (name)
values ('tag62');
insert into tags (name)
values ('tag63');
insert into tags (name)
values ('tag64');
insert into tags (name)
values ('tag65');
insert into tags (name)
values ('tag66');
insert into tags (name)
values ('tag67');
insert into tags (name)
values ('tag68');
insert into tags (name)
values ('tag69');
insert into tags (name)
values ('tag70');
insert into tags (name)
values ('tag71');
insert into tags (name)
values ('tag72');
insert into tags (name)
values ('tag73');
insert into tags (name)
values ('tag74');
insert into tags (name)
values ('tag75');
insert into tags (name)
values ('tag76');
insert into tags (name)
values ('tag77');
insert into tags (name)
values ('tag78');
insert into tags (name)
values ('tag79');
insert into tags (name)
values ('tag80');
insert into tags (name)
values ('tag81');
insert into tags (name)
values ('tag82');
insert into tags (name)
values ('tag83');
insert into tags (name)
values ('tag84');
insert into tags (name)
values ('tag85');
insert into tags (name)
values ('tag86');
insert into tags (name)
values ('tag87');
insert into tags (name)
values ('tag88');
insert into tags (name)
values ('tag89');
insert into tags (name)
values ('tag90');
insert into tags (name)
values ('tag91');
insert into tags (name)
values ('tag92');
insert into tags (name)
values ('tag93');
insert into tags (name)
values ('tag94');
insert into tags (name)
values ('tag95');
insert into tags (name)
values ('tag96');
insert into tags (name)
values ('tag97');
insert into tags (name)
values ('tag98');
insert into tags (name)
values ('tag99');
insert into tags (name)
values ('tag100');
insert into tags (name)
values ('tag101');
insert into tags (name)
values ('tag102');
insert into tags (name)
values ('tag103');
insert into tags (name)
values ('tag104');
insert into tags (name)
values ('tag105');
insert into tags (name)
values ('tag106');
insert into tags (name)
values ('tag107');
insert into tags (name)
values ('tag108');
insert into tags (name)
values ('tag109');
insert into tags (name)
values ('tag110');
insert into tags (name)
values ('tag111');
insert into tags (name)
values ('tag112');
insert into tags (name)
values ('tag113');
insert into tags (name)
values ('tag114');
insert into tags (name)
values ('tag115');
insert into tags (name)
values ('tag116');
insert into tags (name)
values ('tag117');
insert into tags (name)
values ('tag118');
insert into tags (name)
values ('tag119');
insert into tags (name)
values ('tag120');
insert into tags (name)
values ('tag121');
insert into tags (name)
values ('tag122');
insert into tags (name)
values ('tag123');
insert into tags (name)
values ('tag124');
insert into tags (name)
values ('tag125');
insert into tags (name)
values ('tag126');
insert into tags (name)
values ('tag127');
insert into tags (name)
values ('tag128');
insert into tags (name)
values ('tag129');
insert into tags (name)
values ('tag130');
insert into tags (name)
values ('tag131');
insert into tags (name)
values ('tag132');
insert into tags (name)
values ('tag133');
insert into tags (name)
values ('tag134');
insert into tags (name)
values ('tag135');
insert into tags (name)
values ('tag136');
insert into tags (name)
values ('tag137');
insert into tags (name)
values ('tag138');
insert into tags (name)
values ('tag139');
insert into tags (name)
values ('tag140');
insert into tags (name)
values ('tag141');
insert into tags (name)
values ('tag142');
insert into tags (name)
values ('tag143');
insert into tags (name)
values ('tag144');
insert into tags (name)
values ('tag145');
insert into tags (name)
values ('tag146');
insert into tags (name)
values ('tag147');
insert into tags (name)
values ('tag148');
insert into tags (name)
values ('tag149');
insert into tags (name)
values ('tag150');
insert into tags (name)
values ('tag151');
insert into tags (name)
values ('tag152');
insert into tags (name)
values ('tag153');
insert into tags (name)
values ('tag154');
insert into tags (name)
values ('tag155');
insert into tags (name)
values ('tag156');
insert into tags (name)
values ('tag157');
insert into tags (name)
values ('tag158');
insert into tags (name)
values ('tag159');
insert into tags (name)
values ('tag160');
insert into tags (name)
values ('tag161');
insert into tags (name)
values ('tag162');
insert into tags (name)
values ('tag163');
insert into tags (name)
values ('tag164');
insert into tags (name)
values ('tag165');
insert into tags (name)
values ('tag166');
insert into tags (name)
values ('tag167');
insert into tags (name)
values ('tag168');
insert into tags (name)
values ('tag169');
insert into tags (name)
values ('tag170');
insert into tags (name)
values ('tag171');
insert into tags (name)
values ('tag172');
insert into tags (name)
values ('tag173');
insert into tags (name)
values ('tag174');
insert into tags (name)
values ('tag175');
insert into tags (name)
values ('tag176');
insert into tags (name)
values ('tag177');
insert into tags (name)
values ('tag178');
insert into tags (name)
values ('tag179');
insert into tags (name)
values ('tag180');
insert into tags (name)
values ('tag181');
insert into tags (name)
values ('tag182');
insert into tags (name)
values ('tag183');
insert into tags (name)
values ('tag184');
insert into tags (name)
values ('tag185');
insert into tags (name)
values ('tag186');
insert into tags (name)
values ('tag187');
insert into tags (name)
values ('tag188');
insert into tags (name)
values ('tag189');
insert into tags (name)
values ('tag190');
insert into tags (name)
values ('tag191');
insert into tags (name)
values ('tag192');
insert into tags (name)
values ('tag193');
insert into tags (name)
values ('tag194');
insert into tags (name)
values ('tag195');
insert into tags (name)
values ('tag196');
insert into tags (name)
values ('tag197');
insert into tags (name)
values ('tag198');
insert into tags (name)
values ('tag199');
insert into tags (name)
values ('tag200');
insert into tags (name)
values ('tag201');
insert into tags (name)
values ('tag202');
insert into tags (name)
values ('tag203');
insert into tags (name)
values ('tag204');
insert into tags (name)
values ('tag205');
insert into tags (name)
values ('tag206');
insert into tags (name)
values ('tag207');
insert into tags (name)
values ('tag208');
insert into tags (name)
values ('tag209');
insert into tags (name)
values ('tag210');
insert into tags (name)
values ('tag211');
insert into tags (name)
values ('tag212');
insert into tags (name)
values ('tag213');
insert into tags (name)
values ('tag214');
insert into tags (name)
values ('tag215');
insert into tags (name)
values ('tag216');
insert into tags (name)
values ('tag217');
insert into tags (name)
values ('tag218');
insert into tags (name)
values ('tag219');
insert into tags (name)
values ('tag220');
insert into tags (name)
values ('tag221');
insert into tags (name)
values ('tag222');
insert into tags (name)
values ('tag223');
insert into tags (name)
values ('tag224');
insert into tags (name)
values ('tag225');
insert into tags (name)
values ('tag226');
insert into tags (name)
values ('tag227');
insert into tags (name)
values ('tag228');
insert into tags (name)
values ('tag229');
insert into tags (name)
values ('tag230');
insert into tags (name)
values ('tag231');
insert into tags (name)
values ('tag232');
insert into tags (name)
values ('tag233');
insert into tags (name)
values ('tag234');
insert into tags (name)
values ('tag235');
insert into tags (name)
values ('tag236');
insert into tags (name)
values ('tag237');
insert into tags (name)
values ('tag238');
insert into tags (name)
values ('tag239');
insert into tags (name)
values ('tag240');
insert into tags (name)
values ('tag241');
insert into tags (name)
values ('tag242');
insert into tags (name)
values ('tag243');
insert into tags (name)
values ('tag244');
insert into tags (name)
values ('tag245');
insert into tags (name)
values ('tag246');
insert into tags (name)
values ('tag247');
insert into tags (name)
values ('tag248');
insert into tags (name)
values ('tag249');
insert into tags (name)
values ('tag250');
insert into tags (name)
values ('tag251');
insert into tags (name)
values ('tag252');
insert into tags (name)
values ('tag253');
insert into tags (name)
values ('tag254');
insert into tags (name)
values ('tag255');
insert into tags (name)
values ('tag256');
insert into tags (name)
values ('tag257');
insert into tags (name)
values ('tag258');
insert into tags (name)
values ('tag259');
insert into tags (name)
values ('tag260');
insert into tags (name)
values ('tag261');
insert into tags (name)
values ('tag262');
insert into tags (name)
values ('tag263');
insert into tags (name)
values ('tag264');
insert into tags (name)
values ('tag265');
insert into tags (name)
values ('tag266');
insert into tags (name)
values ('tag267');
insert into tags (name)
values ('tag268');
insert into tags (name)
values ('tag269');
insert into tags (name)
values ('tag270');
insert into tags (name)
values ('tag271');
insert into tags (name)
values ('tag272');
insert into tags (name)
values ('tag273');
insert into tags (name)
values ('tag274');
insert into tags (name)
values ('tag275');
insert into tags (name)
values ('tag276');
insert into tags (name)
values ('tag277');
insert into tags (name)
values ('tag278');
insert into tags (name)
values ('tag279');
insert into tags (name)
values ('tag280');
insert into tags (name)
values ('tag281');
insert into tags (name)
values ('tag282');
insert into tags (name)
values ('tag283');
insert into tags (name)
values ('tag284');
insert into tags (name)
values ('tag285');
insert into tags (name)
values ('tag286');
insert into tags (name)
values ('tag287');
insert into tags (name)
values ('tag288');
insert into tags (name)
values ('tag289');
insert into tags (name)
values ('tag290');
insert into tags (name)
values ('tag291');
insert into tags (name)
values ('tag292');
insert into tags (name)
values ('tag293');
insert into tags (name)
values ('tag294');
insert into tags (name)
values ('tag295');
insert into tags (name)
values ('tag296');
insert into tags (name)
values ('tag297');
insert into tags (name)
values ('tag298');
insert into tags (name)
values ('tag299');
insert into tags (name)
values ('tag300');
insert into tags (name)
values ('tag301');
insert into tags (name)
values ('tag302');
insert into tags (name)
values ('tag303');
insert into tags (name)
values ('tag304');
insert into tags (name)
values ('tag305');
insert into tags (name)
values ('tag306');
insert into tags (name)
values ('tag307');
insert into tags (name)
values ('tag308');
insert into tags (name)
values ('tag309');
insert into tags (name)
values ('tag310');
insert into tags (name)
values ('tag311');
insert into tags (name)
values ('tag312');
insert into tags (name)
values ('tag313');
insert into tags (name)
values ('tag314');
insert into tags (name)
values ('tag315');
insert into tags (name)
values ('tag316');
insert into tags (name)
values ('tag317');
insert into tags (name)
values ('tag318');
insert into tags (name)
values ('tag319');
insert into tags (name)
values ('tag320');
insert into tags (name)
values ('tag321');
insert into tags (name)
values ('tag322');
insert into tags (name)
values ('tag323');
insert into tags (name)
values ('tag324');
insert into tags (name)
values ('tag325');
insert into tags (name)
values ('tag326');
insert into tags (name)
values ('tag327');
insert into tags (name)
values ('tag328');
insert into tags (name)
values ('tag329');
insert into tags (name)
values ('tag330');
insert into tags (name)
values ('tag331');
insert into tags (name)
values ('tag332');
insert into tags (name)
values ('tag333');
insert into tags (name)
values ('tag334');
insert into tags (name)
values ('tag335');
insert into tags (name)
values ('tag336');
insert into tags (name)
values ('tag337');
insert into tags (name)
values ('tag338');
insert into tags (name)
values ('tag339');
insert into tags (name)
values ('tag340');
insert into tags (name)
values ('tag341');
insert into tags (name)
values ('tag342');
insert into tags (name)
values ('tag343');
insert into tags (name)
values ('tag344');
insert into tags (name)
values ('tag345');
insert into tags (name)
values ('tag346');
insert into tags (name)
values ('tag347');
insert into tags (name)
values ('tag348');
insert into tags (name)
values ('tag349');
insert into tags (name)
values ('tag350');
insert into tags (name)
values ('tag351');
insert into tags (name)
values ('tag352');
insert into tags (name)
values ('tag353');
insert into tags (name)
values ('tag354');
insert into tags (name)
values ('tag355');
insert into tags (name)
values ('tag356');
insert into tags (name)
values ('tag357');
insert into tags (name)
values ('tag358');
insert into tags (name)
values ('tag359');
insert into tags (name)
values ('tag360');
insert into tags (name)
values ('tag361');
insert into tags (name)
values ('tag362');
insert into tags (name)
values ('tag363');
insert into tags (name)
values ('tag364');
insert into tags (name)
values ('tag365');
insert into tags (name)
values ('tag366');
insert into tags (name)
values ('tag367');
insert into tags (name)
values ('tag368');
insert into tags (name)
values ('tag369');
insert into tags (name)
values ('tag370');
insert into tags (name)
values ('tag371');
insert into tags (name)
values ('tag372');
insert into tags (name)
values ('tag373');
insert into tags (name)
values ('tag374');
insert into tags (name)
values ('tag375');
insert into tags (name)
values ('tag376');
insert into tags (name)
values ('tag377');
insert into tags (name)
values ('tag378');
insert into tags (name)
values ('tag379');
insert into tags (name)
values ('tag380');
insert into tags (name)
values ('tag381');
insert into tags (name)
values ('tag382');
insert into tags (name)
values ('tag383');
insert into tags (name)
values ('tag384');
insert into tags (name)
values ('tag385');
insert into tags (name)
values ('tag386');
insert into tags (name)
values ('tag387');
insert into tags (name)
values ('tag388');
insert into tags (name)
values ('tag389');
insert into tags (name)
values ('tag390');
insert into tags (name)
values ('tag391');
insert into tags (name)
values ('tag392');
insert into tags (name)
values ('tag393');
insert into tags (name)
values ('tag394');
insert into tags (name)
values ('tag395');
insert into tags (name)
values ('tag396');
insert into tags (name)
values ('tag397');
insert into tags (name)
values ('tag398');
insert into tags (name)
values ('tag399');
insert into tags (name)
values ('tag400');
insert into tags (name)
values ('tag401');
insert into tags (name)
values ('tag402');
insert into tags (name)
values ('tag403');
insert into tags (name)
values ('tag404');
insert into tags (name)
values ('tag405');
insert into tags (name)
values ('tag406');
insert into tags (name)
values ('tag407');
insert into tags (name)
values ('tag408');
insert into tags (name)
values ('tag409');
insert into tags (name)
values ('tag410');
insert into tags (name)
values ('tag411');
insert into tags (name)
values ('tag412');
insert into tags (name)
values ('tag413');
insert into tags (name)
values ('tag414');
insert into tags (name)
values ('tag415');
insert into tags (name)
values ('tag416');
insert into tags (name)
values ('tag417');
insert into tags (name)
values ('tag418');
insert into tags (name)
values ('tag419');
insert into tags (name)
values ('tag420');
insert into tags (name)
values ('tag421');
insert into tags (name)
values ('tag422');
insert into tags (name)
values ('tag423');
insert into tags (name)
values ('tag424');
insert into tags (name)
values ('tag425');
insert into tags (name)
values ('tag426');
insert into tags (name)
values ('tag427');
insert into tags (name)
values ('tag428');
insert into tags (name)
values ('tag429');
insert into tags (name)
values ('tag430');
insert into tags (name)
values ('tag431');
insert into tags (name)
values ('tag432');
insert into tags (name)
values ('tag433');
insert into tags (name)
values ('tag434');
insert into tags (name)
values ('tag435');
insert into tags (name)
values ('tag436');
insert into tags (name)
values ('tag437');
insert into tags (name)
values ('tag438');
insert into tags (name)
values ('tag439');
insert into tags (name)
values ('tag440');
insert into tags (name)
values ('tag441');
insert into tags (name)
values ('tag442');
insert into tags (name)
values ('tag443');
insert into tags (name)
values ('tag444');
insert into tags (name)
values ('tag445');
insert into tags (name)
values ('tag446');
insert into tags (name)
values ('tag447');
insert into tags (name)
values ('tag448');
insert into tags (name)
values ('tag449');
insert into tags (name)
values ('tag450');
insert into tags (name)
values ('tag451');
insert into tags (name)
values ('tag452');
insert into tags (name)
values ('tag453');
insert into tags (name)
values ('tag454');
insert into tags (name)
values ('tag455');
insert into tags (name)
values ('tag456');
insert into tags (name)
values ('tag457');
insert into tags (name)
values ('tag458');
insert into tags (name)
values ('tag459');
insert into tags (name)
values ('tag460');
insert into tags (name)
values ('tag461');
insert into tags (name)
values ('tag462');
insert into tags (name)
values ('tag463');
insert into tags (name)
values ('tag464');
insert into tags (name)
values ('tag465');
insert into tags (name)
values ('tag466');
insert into tags (name)
values ('tag467');
insert into tags (name)
values ('tag468');
insert into tags (name)
values ('tag469');
insert into tags (name)
values ('tag470');
insert into tags (name)
values ('tag471');
insert into tags (name)
values ('tag472');
insert into tags (name)
values ('tag473');
insert into tags (name)
values ('tag474');
insert into tags (name)
values ('tag475');
insert into tags (name)
values ('tag476');
insert into tags (name)
values ('tag477');
insert into tags (name)
values ('tag478');
insert into tags (name)
values ('tag479');
insert into tags (name)
values ('tag480');
insert into tags (name)
values ('tag481');
insert into tags (name)
values ('tag482');
insert into tags (name)
values ('tag483');
insert into tags (name)
values ('tag484');
insert into tags (name)
values ('tag485');
insert into tags (name)
values ('tag486');
insert into tags (name)
values ('tag487');
insert into tags (name)
values ('tag488');
insert into tags (name)
values ('tag489');
insert into tags (name)
values ('tag490');
insert into tags (name)
values ('tag491');
insert into tags (name)
values ('tag492');
insert into tags (name)
values ('tag493');
insert into tags (name)
values ('tag494');
insert into tags (name)
values ('tag495');
insert into tags (name)
values ('tag496');
insert into tags (name)
values ('tag497');
insert into tags (name)
values ('tag498');
insert into tags (name)
values ('tag499');
insert into tags (name)
values ('tag500');
insert into tags (name)
values ('tag501');
insert into tags (name)
values ('tag502');
insert into tags (name)
values ('tag503');
insert into tags (name)
values ('tag504');
insert into tags (name)
values ('tag505');
insert into tags (name)
values ('tag506');
insert into tags (name)
values ('tag507');
insert into tags (name)
values ('tag508');
insert into tags (name)
values ('tag509');
insert into tags (name)
values ('tag510');
insert into tags (name)
values ('tag511');
insert into tags (name)
values ('tag512');
insert into tags (name)
values ('tag513');
insert into tags (name)
values ('tag514');
insert into tags (name)
values ('tag515');
insert into tags (name)
values ('tag516');
insert into tags (name)
values ('tag517');
insert into tags (name)
values ('tag518');
insert into tags (name)
values ('tag519');
insert into tags (name)
values ('tag520');
insert into tags (name)
values ('tag521');
insert into tags (name)
values ('tag522');
insert into tags (name)
values ('tag523');
insert into tags (name)
values ('tag524');
insert into tags (name)
values ('tag525');
insert into tags (name)
values ('tag526');
insert into tags (name)
values ('tag527');
insert into tags (name)
values ('tag528');
insert into tags (name)
values ('tag529');
insert into tags (name)
values ('tag530');
insert into tags (name)
values ('tag531');
insert into tags (name)
values ('tag532');
insert into tags (name)
values ('tag533');
insert into tags (name)
values ('tag534');
insert into tags (name)
values ('tag535');
insert into tags (name)
values ('tag536');
insert into tags (name)
values ('tag537');
insert into tags (name)
values ('tag538');
insert into tags (name)
values ('tag539');
insert into tags (name)
values ('tag540');
insert into tags (name)
values ('tag541');
insert into tags (name)
values ('tag542');
insert into tags (name)
values ('tag543');
insert into tags (name)
values ('tag544');
insert into tags (name)
values ('tag545');
insert into tags (name)
values ('tag546');
insert into tags (name)
values ('tag547');
insert into tags (name)
values ('tag548');
insert into tags (name)
values ('tag549');
insert into tags (name)
values ('tag550');
insert into tags (name)
values ('tag551');
insert into tags (name)
values ('tag552');
insert into tags (name)
values ('tag553');
insert into tags (name)
values ('tag554');
insert into tags (name)
values ('tag555');
insert into tags (name)
values ('tag556');
insert into tags (name)
values ('tag557');
insert into tags (name)
values ('tag558');
insert into tags (name)
values ('tag559');
insert into tags (name)
values ('tag560');
insert into tags (name)
values ('tag561');
insert into tags (name)
values ('tag562');
insert into tags (name)
values ('tag563');
insert into tags (name)
values ('tag564');
insert into tags (name)
values ('tag565');
insert into tags (name)
values ('tag566');
insert into tags (name)
values ('tag567');
insert into tags (name)
values ('tag568');
insert into tags (name)
values ('tag569');
insert into tags (name)
values ('tag570');
insert into tags (name)
values ('tag571');
insert into tags (name)
values ('tag572');
insert into tags (name)
values ('tag573');
insert into tags (name)
values ('tag574');
insert into tags (name)
values ('tag575');
insert into tags (name)
values ('tag576');
insert into tags (name)
values ('tag577');
insert into tags (name)
values ('tag578');
insert into tags (name)
values ('tag579');
insert into tags (name)
values ('tag580');
insert into tags (name)
values ('tag581');
insert into tags (name)
values ('tag582');
insert into tags (name)
values ('tag583');
insert into tags (name)
values ('tag584');
insert into tags (name)
values ('tag585');
insert into tags (name)
values ('tag586');
insert into tags (name)
values ('tag587');
insert into tags (name)
values ('tag588');
insert into tags (name)
values ('tag589');
insert into tags (name)
values ('tag590');
insert into tags (name)
values ('tag591');
insert into tags (name)
values ('tag592');
insert into tags (name)
values ('tag593');
insert into tags (name)
values ('tag594');
insert into tags (name)
values ('tag595');
insert into tags (name)
values ('tag596');
insert into tags (name)
values ('tag597');
insert into tags (name)
values ('tag598');
insert into tags (name)
values ('tag599');
insert into tags (name)
values ('tag600');
insert into tags (name)
values ('tag601');
insert into tags (name)
values ('tag602');
insert into tags (name)
values ('tag603');
insert into tags (name)
values ('tag604');
insert into tags (name)
values ('tag605');
insert into tags (name)
values ('tag606');
insert into tags (name)
values ('tag607');
insert into tags (name)
values ('tag608');
insert into tags (name)
values ('tag609');
insert into tags (name)
values ('tag610');
insert into tags (name)
values ('tag611');
insert into tags (name)
values ('tag612');
insert into tags (name)
values ('tag613');
insert into tags (name)
values ('tag614');
insert into tags (name)
values ('tag615');
insert into tags (name)
values ('tag616');
insert into tags (name)
values ('tag617');
insert into tags (name)
values ('tag618');
insert into tags (name)
values ('tag619');
insert into tags (name)
values ('tag620');
insert into tags (name)
values ('tag621');
insert into tags (name)
values ('tag622');
insert into tags (name)
values ('tag623');
insert into tags (name)
values ('tag624');
insert into tags (name)
values ('tag625');
insert into tags (name)
values ('tag626');
insert into tags (name)
values ('tag627');
insert into tags (name)
values ('tag628');
insert into tags (name)
values ('tag629');
insert into tags (name)
values ('tag630');
insert into tags (name)
values ('tag631');
insert into tags (name)
values ('tag632');
insert into tags (name)
values ('tag633');
insert into tags (name)
values ('tag634');
insert into tags (name)
values ('tag635');
insert into tags (name)
values ('tag636');
insert into tags (name)
values ('tag637');
insert into tags (name)
values ('tag638');
insert into tags (name)
values ('tag639');
insert into tags (name)
values ('tag640');
insert into tags (name)
values ('tag641');
insert into tags (name)
values ('tag642');
insert into tags (name)
values ('tag643');
insert into tags (name)
values ('tag644');
insert into tags (name)
values ('tag645');
insert into tags (name)
values ('tag646');
insert into tags (name)
values ('tag647');
insert into tags (name)
values ('tag648');
insert into tags (name)
values ('tag649');
insert into tags (name)
values ('tag650');
insert into tags (name)
values ('tag651');
insert into tags (name)
values ('tag652');
insert into tags (name)
values ('tag653');
insert into tags (name)
values ('tag654');
insert into tags (name)
values ('tag655');
insert into tags (name)
values ('tag656');
insert into tags (name)
values ('tag657');
insert into tags (name)
values ('tag658');
insert into tags (name)
values ('tag659');
insert into tags (name)
values ('tag660');
insert into tags (name)
values ('tag661');
insert into tags (name)
values ('tag662');
insert into tags (name)
values ('tag663');
insert into tags (name)
values ('tag664');
insert into tags (name)
values ('tag665');
insert into tags (name)
values ('tag666');
insert into tags (name)
values ('tag667');
insert into tags (name)
values ('tag668');
insert into tags (name)
values ('tag669');
insert into tags (name)
values ('tag670');
insert into tags (name)
values ('tag671');
insert into tags (name)
values ('tag672');
insert into tags (name)
values ('tag673');
insert into tags (name)
values ('tag674');
insert into tags (name)
values ('tag675');
insert into tags (name)
values ('tag676');
insert into tags (name)
values ('tag677');
insert into tags (name)
values ('tag678');
insert into tags (name)
values ('tag679');
insert into tags (name)
values ('tag680');
insert into tags (name)
values ('tag681');
insert into tags (name)
values ('tag682');
insert into tags (name)
values ('tag683');
insert into tags (name)
values ('tag684');
insert into tags (name)
values ('tag685');
insert into tags (name)
values ('tag686');
insert into tags (name)
values ('tag687');
insert into tags (name)
values ('tag688');
insert into tags (name)
values ('tag689');
insert into tags (name)
values ('tag690');
insert into tags (name)
values ('tag691');
insert into tags (name)
values ('tag692');
insert into tags (name)
values ('tag693');
insert into tags (name)
values ('tag694');
insert into tags (name)
values ('tag695');
insert into tags (name)
values ('tag696');
insert into tags (name)
values ('tag697');
insert into tags (name)
values ('tag698');
insert into tags (name)
values ('tag699');
insert into tags (name)
values ('tag700');
insert into tags (name)
values ('tag701');
insert into tags (name)
values ('tag702');
insert into tags (name)
values ('tag703');
insert into tags (name)
values ('tag704');
insert into tags (name)
values ('tag705');
insert into tags (name)
values ('tag706');
insert into tags (name)
values ('tag707');
insert into tags (name)
values ('tag708');
insert into tags (name)
values ('tag709');
insert into tags (name)
values ('tag710');
insert into tags (name)
values ('tag711');
insert into tags (name)
values ('tag712');
insert into tags (name)
values ('tag713');
insert into tags (name)
values ('tag714');
insert into tags (name)
values ('tag715');
insert into tags (name)
values ('tag716');
insert into tags (name)
values ('tag717');
insert into tags (name)
values ('tag718');
insert into tags (name)
values ('tag719');
insert into tags (name)
values ('tag720');
insert into tags (name)
values ('tag721');
insert into tags (name)
values ('tag722');
insert into tags (name)
values ('tag723');
insert into tags (name)
values ('tag724');
insert into tags (name)
values ('tag725');
insert into tags (name)
values ('tag726');
insert into tags (name)
values ('tag727');
insert into tags (name)
values ('tag728');
insert into tags (name)
values ('tag729');
insert into tags (name)
values ('tag730');
insert into tags (name)
values ('tag731');
insert into tags (name)
values ('tag732');
insert into tags (name)
values ('tag733');
insert into tags (name)
values ('tag734');
insert into tags (name)
values ('tag735');
insert into tags (name)
values ('tag736');
insert into tags (name)
values ('tag737');
insert into tags (name)
values ('tag738');
insert into tags (name)
values ('tag739');
insert into tags (name)
values ('tag740');
insert into tags (name)
values ('tag741');
insert into tags (name)
values ('tag742');
insert into tags (name)
values ('tag743');
insert into tags (name)
values ('tag744');
insert into tags (name)
values ('tag745');
insert into tags (name)
values ('tag746');
insert into tags (name)
values ('tag747');
insert into tags (name)
values ('tag748');
insert into tags (name)
values ('tag749');
insert into tags (name)
values ('tag750');
insert into tags (name)
values ('tag751');
insert into tags (name)
values ('tag752');
insert into tags (name)
values ('tag753');
insert into tags (name)
values ('tag754');
insert into tags (name)
values ('tag755');
insert into tags (name)
values ('tag756');
insert into tags (name)
values ('tag757');
insert into tags (name)
values ('tag758');
insert into tags (name)
values ('tag759');
insert into tags (name)
values ('tag760');
insert into tags (name)
values ('tag761');
insert into tags (name)
values ('tag762');
insert into tags (name)
values ('tag763');
insert into tags (name)
values ('tag764');
insert into tags (name)
values ('tag765');
insert into tags (name)
values ('tag766');
insert into tags (name)
values ('tag767');
insert into tags (name)
values ('tag768');
insert into tags (name)
values ('tag769');
insert into tags (name)
values ('tag770');
insert into tags (name)
values ('tag771');
insert into tags (name)
values ('tag772');
insert into tags (name)
values ('tag773');
insert into tags (name)
values ('tag774');
insert into tags (name)
values ('tag775');
insert into tags (name)
values ('tag776');
insert into tags (name)
values ('tag777');
insert into tags (name)
values ('tag778');
insert into tags (name)
values ('tag779');
insert into tags (name)
values ('tag780');
insert into tags (name)
values ('tag781');
insert into tags (name)
values ('tag782');
insert into tags (name)
values ('tag783');
insert into tags (name)
values ('tag784');
insert into tags (name)
values ('tag785');
insert into tags (name)
values ('tag786');
insert into tags (name)
values ('tag787');
insert into tags (name)
values ('tag788');
insert into tags (name)
values ('tag789');
insert into tags (name)
values ('tag790');
insert into tags (name)
values ('tag791');
insert into tags (name)
values ('tag792');
insert into tags (name)
values ('tag793');
insert into tags (name)
values ('tag794');
insert into tags (name)
values ('tag795');
insert into tags (name)
values ('tag796');
insert into tags (name)
values ('tag797');
insert into tags (name)
values ('tag798');
insert into tags (name)
values ('tag799');
insert into tags (name)
values ('tag800');
insert into tags (name)
values ('tag801');
insert into tags (name)
values ('tag802');
insert into tags (name)
values ('tag803');
insert into tags (name)
values ('tag804');
insert into tags (name)
values ('tag805');
insert into tags (name)
values ('tag806');
insert into tags (name)
values ('tag807');
insert into tags (name)
values ('tag808');
insert into tags (name)
values ('tag809');
insert into tags (name)
values ('tag810');
insert into tags (name)
values ('tag811');
insert into tags (name)
values ('tag812');
insert into tags (name)
values ('tag813');
insert into tags (name)
values ('tag814');
insert into tags (name)
values ('tag815');
insert into tags (name)
values ('tag816');
insert into tags (name)
values ('tag817');
insert into tags (name)
values ('tag818');
insert into tags (name)
values ('tag819');
insert into tags (name)
values ('tag820');
insert into tags (name)
values ('tag821');
insert into tags (name)
values ('tag822');
insert into tags (name)
values ('tag823');
insert into tags (name)
values ('tag824');
insert into tags (name)
values ('tag825');
insert into tags (name)
values ('tag826');
insert into tags (name)
values ('tag827');
insert into tags (name)
values ('tag828');
insert into tags (name)
values ('tag829');
insert into tags (name)
values ('tag830');
insert into tags (name)
values ('tag831');
insert into tags (name)
values ('tag832');
insert into tags (name)
values ('tag833');
insert into tags (name)
values ('tag834');
insert into tags (name)
values ('tag835');
insert into tags (name)
values ('tag836');
insert into tags (name)
values ('tag837');
insert into tags (name)
values ('tag838');
insert into tags (name)
values ('tag839');
insert into tags (name)
values ('tag840');
insert into tags (name)
values ('tag841');
insert into tags (name)
values ('tag842');
insert into tags (name)
values ('tag843');
insert into tags (name)
values ('tag844');
insert into tags (name)
values ('tag845');
insert into tags (name)
values ('tag846');
insert into tags (name)
values ('tag847');
insert into tags (name)
values ('tag848');
insert into tags (name)
values ('tag849');
insert into tags (name)
values ('tag850');
insert into tags (name)
values ('tag851');
insert into tags (name)
values ('tag852');
insert into tags (name)
values ('tag853');
insert into tags (name)
values ('tag854');
insert into tags (name)
values ('tag855');
insert into tags (name)
values ('tag856');
insert into tags (name)
values ('tag857');
insert into tags (name)
values ('tag858');
insert into tags (name)
values ('tag859');
insert into tags (name)
values ('tag860');
insert into tags (name)
values ('tag861');
insert into tags (name)
values ('tag862');
insert into tags (name)
values ('tag863');
insert into tags (name)
values ('tag864');
insert into tags (name)
values ('tag865');
insert into tags (name)
values ('tag866');
insert into tags (name)
values ('tag867');
insert into tags (name)
values ('tag868');
insert into tags (name)
values ('tag869');
insert into tags (name)
values ('tag870');
insert into tags (name)
values ('tag871');
insert into tags (name)
values ('tag872');
insert into tags (name)
values ('tag873');
insert into tags (name)
values ('tag874');
insert into tags (name)
values ('tag875');
insert into tags (name)
values ('tag876');
insert into tags (name)
values ('tag877');
insert into tags (name)
values ('tag878');
insert into tags (name)
values ('tag879');
insert into tags (name)
values ('tag880');
insert into tags (name)
values ('tag881');
insert into tags (name)
values ('tag882');
insert into tags (name)
values ('tag883');
insert into tags (name)
values ('tag884');
insert into tags (name)
values ('tag885');
insert into tags (name)
values ('tag886');
insert into tags (name)
values ('tag887');
insert into tags (name)
values ('tag888');
insert into tags (name)
values ('tag889');
insert into tags (name)
values ('tag890');
insert into tags (name)
values ('tag891');
insert into tags (name)
values ('tag892');
insert into tags (name)
values ('tag893');
insert into tags (name)
values ('tag894');
insert into tags (name)
values ('tag895');
insert into tags (name)
values ('tag896');
insert into tags (name)
values ('tag897');
insert into tags (name)
values ('tag898');
insert into tags (name)
values ('tag899');
insert into tags (name)
values ('tag900');
insert into tags (name)
values ('tag901');
insert into tags (name)
values ('tag902');
insert into tags (name)
values ('tag903');
insert into tags (name)
values ('tag904');
insert into tags (name)
values ('tag905');
insert into tags (name)
values ('tag906');
insert into tags (name)
values ('tag907');
insert into tags (name)
values ('tag908');
insert into tags (name)
values ('tag909');
insert into tags (name)
values ('tag910');
insert into tags (name)
values ('tag911');
insert into tags (name)
values ('tag912');
insert into tags (name)
values ('tag913');
insert into tags (name)
values ('tag914');
insert into tags (name)
values ('tag915');
insert into tags (name)
values ('tag916');
insert into tags (name)
values ('tag917');
insert into tags (name)
values ('tag918');
insert into tags (name)
values ('tag919');
insert into tags (name)
values ('tag920');
insert into tags (name)
values ('tag921');
insert into tags (name)
values ('tag922');
insert into tags (name)
values ('tag923');
insert into tags (name)
values ('tag924');
insert into tags (name)
values ('tag925');
insert into tags (name)
values ('tag926');
insert into tags (name)
values ('tag927');
insert into tags (name)
values ('tag928');
insert into tags (name)
values ('tag929');
insert into tags (name)
values ('tag930');
insert into tags (name)
values ('tag931');
insert into tags (name)
values ('tag932');
insert into tags (name)
values ('tag933');
insert into tags (name)
values ('tag934');
insert into tags (name)
values ('tag935');
insert into tags (name)
values ('tag936');
insert into tags (name)
values ('tag937');
insert into tags (name)
values ('tag938');
insert into tags (name)
values ('tag939');
insert into tags (name)
values ('tag940');
insert into tags (name)
values ('tag941');
insert into tags (name)
values ('tag942');
insert into tags (name)
values ('tag943');
insert into tags (name)
values ('tag944');
insert into tags (name)
values ('tag945');
insert into tags (name)
values ('tag946');
insert into tags (name)
values ('tag947');
insert into tags (name)
values ('tag948');
insert into tags (name)
values ('tag949');
insert into tags (name)
values ('tag950');
insert into tags (name)
values ('tag951');
insert into tags (name)
values ('tag952');
insert into tags (name)
values ('tag953');
insert into tags (name)
values ('tag954');
insert into tags (name)
values ('tag955');
insert into tags (name)
values ('tag956');
insert into tags (name)
values ('tag957');
insert into tags (name)
values ('tag958');
insert into tags (name)
values ('tag959');
insert into tags (name)
values ('tag960');
insert into tags (name)
values ('tag961');
insert into tags (name)
values ('tag962');
insert into tags (name)
values ('tag963');
insert into tags (name)
values ('tag964');
insert into tags (name)
values ('tag965');
insert into tags (name)
values ('tag966');
insert into tags (name)
values ('tag967');
insert into tags (name)
values ('tag968');
insert into tags (name)
values ('tag969');
insert into tags (name)
values ('tag970');
insert into tags (name)
values ('tag971');
insert into tags (name)
values ('tag972');
insert into tags (name)
values ('tag973');
insert into tags (name)
values ('tag974');
insert into tags (name)
values ('tag975');
insert into tags (name)
values ('tag976');
insert into tags (name)
values ('tag977');
insert into tags (name)
values ('tag978');
insert into tags (name)
values ('tag979');
insert into tags (name)
values ('tag980');
insert into tags (name)
values ('tag981');
insert into tags (name)
values ('tag982');
insert into tags (name)
values ('tag983');
insert into tags (name)
values ('tag984');
insert into tags (name)
values ('tag985');
insert into tags (name)
values ('tag986');
insert into tags (name)
values ('tag987');
insert into tags (name)
values ('tag988');
insert into tags (name)
values ('tag989');
insert into tags (name)
values ('tag990');
insert into tags (name)
values ('tag991');
insert into tags (name)
values ('tag992');
insert into tags (name)
values ('tag993');
insert into tags (name)
values ('tag994');
insert into tags (name)
values ('tag995');
insert into tags (name)
values ('tag996');
insert into tags (name)
values ('tag997');
insert into tags (name)
values ('tag998');
insert into tags (name)
values ('tag999');
insert into tags (name)
values ('tag1000');


insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (1, 'strategize cutting-edge architectures', 'volutpat in', 384, 35, '2020-11-06T19:10:09Z',
        '2021-05-15T22:58:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (2, 'repurpose 24/7 interfaces', 'id consequat', 110, 57, '2020-12-12T22:13:22Z', '2020-11-19T13:03:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (3, 'deliver holistic relationships', 'nunc', 32, 85, '2020-10-14T20:21:48Z', '2020-10-11T05:08:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (4, 'embrace synergistic synergies', 'id', 50, 5, '2021-05-15T01:09:47Z', '2021-03-04T09:33:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (5, 'architect one-to-one applications', 'a', 458, 49, '2020-11-13T12:01:36Z', '2021-05-05T14:58:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (6, 'deploy innovative functionalities', 'sit', 363, 54, '2021-02-11T18:44:42Z', '2021-07-25T19:46:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (7, 'maximize virtual portals', 'ante', 908, 72, '2021-09-04T04:55:28Z', '2020-11-26T20:23:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (8, 'deliver magnetic niches', 'eu sapien', 299, 11, '2021-09-17T11:47:04Z', '2021-08-13T20:21:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (9, 'matrix proactive metrics', 'eu est', 899, 23, '2020-11-08T07:08:18Z', '2021-10-16T17:30:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (10, 'synergize rich schemas', 'consequat lectus', 435, 79, '2021-01-06T19:50:17Z', '2021-01-23T14:33:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (11, 'cultivate transparent e-markets', 'ut', 508, 29, '2020-11-16T06:53:49Z', '2021-02-15T20:57:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (12, 'utilize cross-platform interfaces', 'mus', 870, 78, '2021-08-25T13:13:32Z', '2021-07-28T06:44:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (13, 'envisioneer distributed relationships', 'cum', 74, 80, '2021-02-19T19:31:05Z', '2021-03-13T12:02:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (14, 'exploit holistic technologies', 'amet consectetuer', 530, 76, '2021-10-26T02:19:30Z',
        '2021-11-16T19:48:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (15, 'incentivize virtual convergence', 'nonummy', 731, 33, '2021-10-11T23:34:58Z', '2021-01-23T09:15:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (16, 'reinvent turn-key models', 'a', 516, 79, '2021-04-11T12:21:32Z', '2021-01-12T22:08:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (17, 'harness robust initiatives', 'non', 987, 15, '2021-11-22T20:30:34Z', '2021-01-26T03:12:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (18, 'strategize out-of-the-box web-readiness', 'viverra', 143, 16, '2021-09-11T14:13:55Z',
        '2021-03-16T22:49:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (19, 'enhance integrated schemas', 'sed sagittis', 788, 26, '2021-06-18T20:51:52Z', '2020-10-09T15:40:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (20, 'redefine integrated e-business', 'aenean lectus', 826, 50, '2021-07-28T02:39:41Z', '2021-10-13T00:32:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (21, 'matrix rich web-readiness', 'dapibus nulla', 489, 59, '2021-07-25T18:53:26Z', '2021-03-09T00:35:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (22, 'grow dot-com applications', 'id pretium', 880, 9, '2021-10-10T01:01:20Z', '2021-07-14T19:18:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (23, 'streamline ubiquitous web services', 'massa id', 740, 12, '2021-02-12T19:50:19Z', '2021-03-30T06:57:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (24, 'unleash compelling supply-chains', 'ut mauris', 265, 12, '2021-11-10T22:05:03Z', '2021-03-24T21:02:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (25, 'strategize B2B applications', 'odio', 500, 60, '2020-09-20T05:06:19Z', '2021-08-19T15:33:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (26, 'e-enable best-of-breed synergies', 'potenti', 408, 52, '2020-11-20T18:26:48Z', '2020-11-14T14:13:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (27, 'orchestrate ubiquitous metrics', 'turpis sed', 356, 72, '2021-11-05T13:41:02Z', '2020-09-09T22:12:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (28, 'transform wireless users', 'cursus', 739, 31, '2021-06-20T13:59:22Z', '2021-04-12T01:22:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (29, 'exploit mission-critical models', 'lacinia erat', 124, 36, '2021-11-11T12:53:26Z', '2020-11-01T06:29:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (30, 'grow end-to-end infomediaries', 'nulla', 236, 24, '2020-11-13T08:17:10Z', '2021-04-03T16:07:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (31, 'aggregate strategic channels', 'aenean', 940, 17, '2021-10-31T06:29:50Z', '2021-08-21T07:45:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (32, 'visualize virtual systems', 'velit', 101, 73, '2020-12-30T17:29:42Z', '2020-10-29T00:54:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (33, 'disintermediate user-centric deliverables', 'augue aliquam', 796, 21, '2020-11-06T22:07:06Z',
        '2021-08-12T20:38:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (34, 'implement next-generation infomediaries', 'tristique', 979, 85, '2020-12-26T10:01:59Z',
        '2021-04-12T01:07:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (35, 'recontextualize global eyeballs', 'massa', 236, 80, '2021-01-26T05:10:36Z', '2021-03-22T11:03:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (36, 'utilize synergistic systems', 'convallis nunc', 468, 41, '2021-09-06T12:38:14Z', '2021-08-31T13:37:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (37, 'scale frictionless communities', 'etiam faucibus', 421, 33, '2021-08-20T23:57:49Z',
        '2020-10-30T09:15:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (38, 'implement enterprise technologies', 'venenatis', 859, 67, '2020-10-23T10:49:02Z', '2021-01-23T05:30:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (39, 'enhance B2B e-services', 'ligula', 449, 66, '2021-05-24T18:29:59Z', '2021-05-31T18:52:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (40, 'monetize scalable communities', 'cubilia curae', 112, 25, '2021-11-15T15:39:14Z', '2021-07-22T11:29:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (41, 'redefine back-end markets', 'integer a', 649, 81, '2021-08-19T06:28:09Z', '2021-04-16T07:47:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (42, 'deliver leading-edge partnerships', 'penatibus et', 326, 87, '2021-10-20T17:43:02Z',
        '2021-04-19T04:50:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (43, 'deploy cutting-edge infrastructures', 'nunc', 303, 57, '2020-09-09T17:21:25Z', '2020-10-20T01:16:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (44, 'leverage holistic networks', 'et magnis', 942, 83, '2021-03-09T18:47:09Z', '2021-03-27T09:08:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (45, 'synthesize dynamic metrics', 'ante', 502, 68, '2021-07-30T22:16:05Z', '2020-09-14T11:04:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (46, 'visualize innovative infomediaries', 'eget eros', 509, 61, '2021-06-12T20:30:24Z', '2020-11-25T17:32:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (47, 'drive interactive e-markets', 'donec ut', 181, 3, '2021-11-04T22:26:59Z', '2021-08-10T09:29:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (48, 'integrate cross-media partnerships', 'hac habitasse', 561, 73, '2021-08-17T00:15:46Z',
        '2020-12-17T15:02:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (49, 'matrix global methodologies', 'nunc commodo', 51, 56, '2021-02-01T02:12:59Z', '2021-01-30T14:35:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (50, 'deploy next-generation infrastructures', 'ullamcorper augue', 680, 69, '2021-07-28T21:26:33Z',
        '2021-01-18T08:41:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (51, 'empower killer deliverables', 'suspendisse potenti', 513, 5, '2021-02-07T17:08:06Z',
        '2021-08-08T21:09:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (52, 'orchestrate visionary action-items', 'integer pede', 499, 82, '2021-09-16T16:06:16Z',
        '2021-11-21T15:52:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (53, 'orchestrate synergistic action-items', 'quis augue', 960, 28, '2021-05-31T03:52:13Z',
        '2020-11-07T06:52:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (54, 'engage extensible e-markets', 'nec nisi', 224, 40, '2021-01-29T07:11:47Z', '2020-11-12T21:12:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (55, 'synthesize innovative niches', 'morbi', 895, 48, '2021-04-13T09:32:05Z', '2021-06-01T05:36:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (56, 'iterate enterprise convergence', 'justo', 751, 23, '2021-10-30T07:13:18Z', '2021-07-11T07:41:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (57, 'aggregate wireless experiences', 'cras mi', 592, 49, '2021-02-26T12:23:59Z', '2020-11-08T06:43:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (58, 'orchestrate global infrastructures', 'lacus', 369, 77, '2021-09-30T23:26:54Z', '2020-09-11T07:05:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (59, 'drive clicks-and-mortar infomediaries', 'nibh', 342, 76, '2021-07-22T19:35:01Z', '2021-04-05T13:00:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (60, 'implement out-of-the-box models', 'pharetra magna', 281, 77, '2021-01-04T23:16:34Z',
        '2021-06-19T14:41:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (61, 'brand enterprise solutions', 'pellentesque', 682, 12, '2021-08-15T20:00:42Z', '2021-09-06T14:00:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (62, 'brand integrated e-tailers', 'ut blandit', 384, 28, '2020-10-06T08:05:25Z', '2021-02-15T14:35:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (63, 'integrate turn-key schemas', 'in', 480, 64, '2020-09-17T19:32:15Z', '2020-11-19T19:50:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (64, 'evolve extensible initiatives', 'eu sapien', 580, 66, '2021-03-07T21:42:38Z', '2021-01-12T21:47:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (65, 'reinvent vertical architectures', 'morbi', 884, 10, '2021-04-08T22:32:34Z', '2021-07-02T06:00:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (66, 'target one-to-one bandwidth', 'proin risus', 435, 30, '2020-12-03T11:21:29Z', '2021-02-18T13:58:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (67, 'synergize viral schemas', 'massa', 210, 88, '2021-07-26T16:57:20Z', '2021-04-22T00:12:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (68, 'seize plug-and-play technologies', 'vivamus', 629, 85, '2021-06-17T07:16:36Z', '2021-08-05T22:47:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (69, 'revolutionize end-to-end vortals', 'tempus vivamus', 664, 51, '2021-08-10T21:55:54Z',
        '2021-02-21T13:57:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (70, 'deliver magnetic initiatives', 'lacus', 59, 62, '2020-10-23T18:03:39Z', '2021-08-05T04:19:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (71, 'expedite extensible web-readiness', 'nisi venenatis', 440, 22, '2021-10-20T20:47:10Z',
        '2021-02-27T14:18:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (72, 'visualize extensible infrastructures', 'sociis natoque', 512, 63, '2021-04-27T03:51:34Z',
        '2021-01-03T16:38:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (73, 'embrace web-enabled infomediaries', 'eros', 186, 41, '2021-08-30T00:41:27Z', '2020-11-30T09:32:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (74, 'morph ubiquitous systems', 'rutrum', 776, 84, '2021-05-24T02:53:56Z', '2021-08-31T22:16:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (75, 'synergize leading-edge portals', 'vivamus', 123, 76, '2021-09-22T21:54:52Z', '2020-12-05T14:06:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (76, 'morph bleeding-edge supply-chains', 'luctus', 949, 66, '2021-11-02T16:41:16Z', '2021-01-22T02:16:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (77, 'syndicate synergistic web-readiness', 'turpis donec', 386, 32, '2020-10-07T02:41:37Z',
        '2021-04-12T10:05:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (78, 'seize synergistic e-tailers', 'ut erat', 412, 51, '2020-12-27T09:25:45Z', '2020-09-18T06:50:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (79, 'unleash 24/365 ROI', 'ac leo', 572, 12, '2020-10-02T19:50:44Z', '2021-07-07T00:22:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (80, 'maximize virtual bandwidth', 'convallis nunc', 684, 1, '2020-11-29T15:37:24Z', '2021-10-05T18:14:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (81, 'productize innovative markets', 'ipsum', 386, 48, '2021-09-28T13:15:59Z', '2021-11-04T00:16:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (82, 'innovate world-class infomediaries', 'diam', 395, 88, '2020-11-05T16:36:35Z', '2020-12-01T04:26:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (83, 'facilitate open-source schemas', 'turpis', 454, 66, '2021-10-16T12:19:37Z', '2020-10-17T10:44:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (84, 'repurpose front-end schemas', 'ut tellus', 986, 11, '2021-04-25T22:14:20Z', '2020-09-02T16:33:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (85, 'mesh frictionless convergence', 'rutrum', 153, 72, '2021-10-20T11:46:30Z', '2020-12-27T10:18:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (86, 'reinvent best-of-breed experiences', 'id nisl', 134, 45, '2021-04-06T19:28:44Z', '2020-11-23T23:33:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (87, 'redefine e-business bandwidth', 'mauris viverra', 950, 8, '2021-04-06T10:40:02Z', '2020-11-05T08:52:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (88, 'deliver viral platforms', 'turpis', 754, 62, '2021-10-12T12:24:33Z', '2021-05-25T03:56:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (89, 'integrate front-end technologies', 'dui vel', 372, 78, '2021-10-15T21:41:32Z', '2020-10-07T21:52:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (90, 'grow ubiquitous solutions', 'volutpat', 836, 32, '2021-08-10T16:34:02Z', '2020-09-17T18:37:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (91, 'scale sticky metrics', 'vehicula', 317, 57, '2021-05-07T01:22:46Z', '2021-02-04T09:51:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (92, 'morph best-of-breed e-business', 'varius', 3, 54, '2021-07-04T09:42:55Z', '2021-11-08T21:35:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (93, 'unleash customized functionalities', 'magna', 884, 31, '2021-04-07T18:34:46Z', '2021-03-26T10:06:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (94, 'revolutionize interactive methodologies', 'turpis', 255, 74, '2020-11-05T23:53:11Z',
        '2021-08-20T06:56:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (95, 'implement leading-edge mindshare', 'tortor', 615, 60, '2021-01-11T15:14:27Z', '2021-06-22T11:34:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (96, 'brand wireless niches', 'eget', 198, 85, '2021-10-22T16:29:55Z', '2021-01-08T15:56:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (97, 'expedite virtual interfaces', 'leo', 147, 7, '2021-05-03T01:15:30Z', '2021-07-06T20:17:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (98, 'reintermediate transparent infrastructures', 'orci', 337, 76, '2021-06-03T13:23:42Z',
        '2021-08-21T13:05:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (99, 'expedite visionary functionalities', 'ut', 606, 41, '2020-09-11T23:23:07Z', '2021-04-26T23:54:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (100, 'deploy B2B content', 'aliquam', 997, 53, '2020-11-03T23:06:55Z', '2020-10-11T07:03:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (101, 'synergize compelling convergence', 'mauris', 748, 38, '2021-09-15T23:32:15Z', '2021-04-12T23:02:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (102, 'repurpose global experiences', 'in sapien', 457, 23, '2021-08-11T14:48:22Z', '2020-10-31T18:47:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (103, 'implement bleeding-edge synergies', 'pretium quis', 709, 37, '2021-03-05T02:03:34Z',
        '2020-11-08T07:52:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (104, 'facilitate user-centric applications', 'sociis natoque', 399, 9, '2020-10-02T10:58:30Z',
        '2021-08-14T12:44:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (105, 'grow collaborative users', 'pede morbi', 580, 86, '2021-05-02T19:08:27Z', '2020-11-18T06:15:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (106, 'seize e-business e-services', 'odio', 206, 40, '2020-10-08T06:26:29Z', '2021-06-26T05:46:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (107, 'redefine cross-platform communities', 'iaculis', 978, 66, '2020-11-26T17:38:26Z', '2021-04-06T14:41:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (108, 'redefine interactive portals', 'at', 205, 51, '2021-07-24T11:30:16Z', '2021-07-15T00:19:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (109, 'benchmark web-enabled web services', 'mauris', 101, 84, '2021-10-29T17:36:29Z', '2020-11-22T20:27:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (110, 'expedite 24/365 channels', 'nunc viverra', 181, 66, '2021-04-03T23:26:10Z', '2021-11-05T20:58:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (111, 'engage intuitive niches', 'suscipit ligula', 181, 43, '2021-01-21T09:34:08Z', '2021-04-03T14:33:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (112, 'deploy turn-key action-items', 'urna', 241, 24, '2020-09-03T08:59:58Z', '2020-11-20T14:10:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (113, 'monetize leading-edge synergies', 'et', 252, 45, '2020-10-09T10:21:29Z', '2021-08-24T21:19:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (114, 'exploit intuitive channels', 'adipiscing elit', 777, 45, '2020-12-07T12:24:39Z', '2021-11-07T09:10:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (115, 'optimize dot-com e-business', 'eget tincidunt', 918, 71, '2021-11-01T14:16:41Z', '2021-03-05T01:05:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (116, 'innovate innovative e-services', 'nunc proin', 494, 87, '2021-02-18T11:49:01Z', '2021-06-16T05:04:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (117, 'facilitate killer web-readiness', 'aliquet', 257, 82, '2021-04-08T18:23:47Z', '2021-07-07T05:31:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (118, 'integrate impactful ROI', 'augue quam', 393, 74, '2021-05-26T18:25:00Z', '2021-08-30T23:56:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (119, 'empower B2B technologies', 'ultricies', 679, 46, '2021-11-22T18:13:48Z', '2021-04-07T00:01:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (120, 'mesh out-of-the-box infrastructures', 'ut dolor', 873, 34, '2021-10-14T13:16:59Z',
        '2020-09-04T03:54:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (121, 'maximize web-enabled eyeballs', 'nisl aenean', 61, 83, '2021-05-12T12:00:30Z', '2021-05-24T02:51:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (122, 'revolutionize B2C interfaces', 'nulla', 920, 36, '2021-09-09T23:27:25Z', '2021-04-29T03:50:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (123, 'extend world-class supply-chains', 'sit', 791, 47, '2021-08-28T17:00:47Z', '2021-05-13T21:25:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (124, 'redefine scalable infrastructures', 'rhoncus', 186, 48, '2021-09-04T08:51:15Z', '2020-10-09T13:40:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (125, 'embrace one-to-one technologies', 'pede malesuada', 94, 70, '2021-03-16T09:38:54Z',
        '2020-09-10T06:49:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (126, 'e-enable back-end metrics', 'ligula pellentesque', 42, 33, '2021-09-26T00:22:43Z',
        '2020-10-28T01:37:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (127, 'unleash visionary content', 'sapien', 114, 42, '2020-11-24T18:10:10Z', '2021-10-31T00:19:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (128, 'redefine synergistic schemas', 'nunc', 172, 67, '2021-08-13T05:20:21Z', '2021-04-11T10:24:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (129, 'enable enterprise e-markets', 'velit', 678, 89, '2021-04-01T02:41:05Z', '2021-04-09T04:40:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (130, 'target virtual eyeballs', 'odio', 604, 31, '2021-02-21T17:21:02Z', '2021-03-24T17:24:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (131, 'orchestrate user-centric e-services', 'posuere metus', 843, 70, '2021-08-15T08:39:51Z',
        '2021-02-21T05:48:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (132, 'redefine e-business web services', 'enim', 144, 76, '2021-03-11T19:45:11Z', '2021-09-10T08:43:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (133, 'orchestrate global technologies', 'in', 144, 83, '2020-11-14T22:11:42Z', '2021-05-27T01:41:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (134, 'transition sexy infomediaries', 'fusce congue', 438, 71, '2021-01-10T15:16:13Z', '2020-11-16T09:05:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (135, 'innovate virtual applications', 'mauris', 601, 54, '2021-08-29T12:44:58Z', '2021-11-05T23:08:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (136, 'engineer intuitive web-readiness', 'etiam', 835, 2, '2021-10-01T00:03:13Z', '2021-03-18T20:49:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (137, 'envisioneer end-to-end methodologies', 'morbi', 403, 51, '2020-11-12T19:25:50Z', '2021-10-28T11:13:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (138, 'whiteboard bleeding-edge portals', 'etiam', 8, 58, '2021-10-25T01:33:21Z', '2021-10-13T10:34:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (139, 'visualize customized niches', 'a ipsum', 220, 2, '2021-09-20T10:55:48Z', '2021-11-07T19:51:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (140, 'morph 24/7 partnerships', 'faucibus accumsan', 202, 83, '2021-09-24T22:28:13Z', '2021-01-05T11:43:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (141, 'transition leading-edge ROI', 'vel', 794, 19, '2021-01-19T15:45:03Z', '2020-09-20T00:33:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (142, 'incentivize holistic niches', 'hac habitasse', 902, 6, '2021-01-25T14:30:36Z', '2020-11-14T19:02:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (143, 'enable distributed web-readiness', 'eget', 475, 57, '2021-09-11T20:55:19Z', '2021-07-30T00:18:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (144, 'facilitate sexy solutions', 'integer ac', 374, 62, '2020-09-28T11:16:47Z', '2021-03-02T06:52:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (145, 'transform real-time vortals', 'enim lorem', 191, 44, '2021-01-21T08:41:19Z', '2021-06-14T06:56:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (146, 'visualize customized convergence', 'in', 385, 84, '2020-12-22T14:40:04Z', '2021-10-28T15:28:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (147, 'deliver clicks-and-mortar e-services', 'morbi', 308, 41, '2020-12-22T10:59:00Z', '2021-03-24T11:31:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (148, 'incubate web-enabled convergence', 'in magna', 492, 59, '2021-09-29T03:32:52Z', '2021-09-26T08:21:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (149, 'benchmark best-of-breed platforms', 'ac', 700, 3, '2020-09-01T09:31:54Z', '2020-12-27T02:58:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (150, 'harness dot-com methodologies', 'tristique', 68, 50, '2021-06-02T21:53:10Z', '2021-04-01T02:00:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (151, 'grow turn-key networks', 'eros', 155, 46, '2021-09-12T04:51:21Z', '2021-01-29T06:23:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (152, 'deliver scalable e-tailers', 'ac leo', 44, 31, '2021-08-10T22:08:26Z', '2021-10-30T15:05:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (153, 'visualize revolutionary metrics', 'erat curabitur', 539, 7, '2020-11-14T13:05:05Z',
        '2021-03-22T08:24:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (154, 'optimize real-time communities', 'rhoncus dui', 149, 61, '2021-08-01T15:12:46Z', '2020-09-10T15:25:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (155, 'evolve holistic e-services', 'nunc', 992, 71, '2021-06-09T07:17:59Z', '2021-03-28T12:32:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (156, 'expedite cross-media e-commerce', 'aliquet at', 868, 80, '2020-10-31T01:56:39Z', '2020-12-27T20:06:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (157, 'aggregate ubiquitous e-tailers', 'bibendum morbi', 914, 32, '2021-03-12T07:31:41Z',
        '2020-09-12T09:47:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (158, 'leverage cross-media markets', 'bibendum felis', 437, 53, '2020-12-23T01:41:38Z', '2021-07-05T23:44:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (159, 'grow real-time niches', 'elit', 283, 27, '2021-07-05T15:36:55Z', '2021-05-06T14:04:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (160, 'engage dynamic markets', 'vitae quam', 246, 75, '2020-09-11T22:11:30Z', '2020-09-14T23:27:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (161, 'transform user-centric web services', 'sit', 644, 87, '2021-01-23T03:01:24Z', '2021-04-08T18:38:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (162, 'evolve scalable architectures', 'dictumst', 716, 81, '2021-06-05T18:02:44Z', '2021-09-19T05:59:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (163, 'embrace B2C systems', 'duis', 277, 58, '2021-08-27T14:56:54Z', '2020-09-19T01:24:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (164, 'mesh interactive synergies', 'lobortis ligula', 278, 51, '2021-10-16T21:01:55Z', '2021-06-14T22:41:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (165, 'empower mission-critical bandwidth', 'ultrices', 543, 89, '2021-10-30T13:10:18Z', '2020-09-25T05:38:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (166, 'optimize distributed action-items', 'quam sollicitudin', 117, 89, '2021-05-29T18:19:53Z',
        '2021-01-27T03:16:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (167, 'grow next-generation niches', 'sed ante', 104, 62, '2021-01-12T04:34:28Z', '2021-08-16T19:33:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (168, 'cultivate web-enabled infrastructures', 'habitasse', 970, 88, '2021-07-13T01:41:57Z',
        '2020-11-16T00:53:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (169, 'implement extensible initiatives', 'pretium quis', 205, 75, '2021-05-11T20:13:56Z',
        '2021-07-07T20:43:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (170, 'benchmark revolutionary models', 'lectus', 115, 34, '2020-12-08T22:50:53Z', '2021-04-14T03:17:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (171, 'recontextualize next-generation web-readiness', 'amet', 270, 33, '2020-09-17T13:04:42Z',
        '2021-07-07T01:23:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (172, 'whiteboard dot-com platforms', 'tincidunt lacus', 917, 46, '2021-05-31T03:51:11Z',
        '2021-09-28T10:37:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (173, 'utilize compelling users', 'viverra', 300, 1, '2021-08-19T12:58:09Z', '2021-09-03T02:42:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (174, 'generate magnetic e-tailers', 'non ligula', 891, 56, '2021-08-16T23:12:35Z', '2021-04-15T16:47:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (175, 'revolutionize mission-critical initiatives', 'magna bibendum', 89, 32, '2021-08-06T22:44:47Z',
        '2021-05-21T04:31:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (176, 'optimize leading-edge schemas', 'eu sapien', 590, 86, '2021-05-13T16:47:07Z', '2021-01-24T19:44:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (177, 'deliver B2C applications', 'vestibulum rutrum', 214, 79, '2021-04-04T15:20:57Z', '2020-10-16T20:54:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (178, 'embrace out-of-the-box platforms', 'in sagittis', 545, 10, '2021-08-02T13:56:06Z',
        '2021-01-22T23:17:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (179, 'orchestrate robust vortals', 'vestibulum ante', 469, 51, '2021-05-08T21:28:51Z', '2021-10-06T20:21:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (180, 'facilitate scalable communities', 'lobortis', 49, 42, '2021-04-23T18:20:41Z', '2020-09-01T12:28:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (181, 'revolutionize out-of-the-box content', 'lobortis', 820, 5, '2021-09-23T02:04:51Z',
        '2020-11-29T09:37:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (182, 'integrate virtual ROI', 'sit amet', 409, 7, '2021-02-10T20:12:18Z', '2021-06-08T10:29:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (183, 'grow bleeding-edge networks', 'posuere', 495, 90, '2021-04-23T22:38:19Z', '2021-11-02T21:57:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (184, 'drive sticky channels', 'amet nunc', 659, 70, '2020-11-01T22:54:56Z', '2021-02-01T15:29:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (185, 'facilitate turn-key web-readiness', 'ac', 864, 22, '2021-02-16T12:07:46Z', '2021-09-15T06:44:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (186, 'exploit global networks', 'curabitur in', 787, 74, '2021-05-12T01:31:29Z', '2021-06-24T16:27:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (187, 'harness 24/365 ROI', 'turpis', 553, 62, '2021-01-24T11:19:24Z', '2021-05-29T12:29:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (188, 'benchmark visionary web services', 'consequat dui', 783, 77, '2021-05-28T23:53:17Z',
        '2021-10-26T14:16:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (189, 'implement integrated vortals', 'erat vestibulum', 177, 67, '2021-05-09T09:26:17Z',
        '2021-08-21T18:51:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (190, 'generate e-business models', 'nascetur', 789, 19, '2021-09-27T18:38:01Z', '2021-01-23T20:28:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (191, 'harness dot-com web services', 'a suscipit', 975, 15, '2021-08-02T10:39:43Z', '2021-01-22T10:57:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (192, 'architect collaborative ROI', 'gravida', 579, 29, '2020-11-01T04:02:13Z', '2021-03-21T09:32:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (193, 'iterate front-end web-readiness', 'convallis', 973, 42, '2021-01-03T13:35:57Z', '2021-11-01T08:10:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (194, 'implement impactful models', 'adipiscing', 404, 64, '2021-04-15T10:35:27Z', '2020-12-13T00:28:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (195, 'integrate innovative paradigms', 'nulla', 388, 43, '2021-05-09T19:57:30Z', '2021-11-05T04:38:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (196, 'syndicate bricks-and-clicks relationships', 'porttitor id', 420, 7, '2021-05-06T21:44:42Z',
        '2020-10-22T15:24:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (197, 'synergize impactful e-business', 'metus arcu', 629, 39, '2021-04-18T06:43:19Z', '2021-03-15T23:21:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (198, 'e-enable interactive supply-chains', 'in faucibus', 502, 15, '2021-05-18T17:27:13Z',
        '2021-09-20T09:35:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (199, 'grow sexy portals', 'ultrices', 392, 55, '2020-12-31T11:39:05Z', '2021-03-08T16:35:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (200, 'mesh plug-and-play content', 'at', 834, 16, '2020-12-15T07:53:58Z', '2021-02-15T23:11:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (201, 'strategize dot-com supply-chains', 'tempus sit', 203, 7, '2021-05-20T10:21:49Z', '2021-03-07T11:44:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (202, 'empower cross-platform methodologies', 'quam sapien', 362, 21, '2021-03-13T22:44:49Z',
        '2021-04-08T19:25:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (203, 'engage robust e-business', 'orci', 717, 46, '2021-09-22T22:18:49Z', '2021-05-05T21:40:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (204, 'engage one-to-one architectures', 'phasellus', 383, 81, '2021-06-30T10:07:44Z', '2021-04-16T09:25:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (205, 'monetize B2B mindshare', 'aliquam', 448, 45, '2021-02-22T21:07:08Z', '2021-10-02T06:24:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (206, 'facilitate frictionless web services', 'lobortis', 138, 77, '2021-09-15T09:27:30Z',
        '2021-07-22T09:44:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (207, 'transform interactive partnerships', 'commodo', 685, 74, '2020-11-08T01:41:02Z', '2021-08-26T04:57:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (208, 'integrate plug-and-play initiatives', 'posuere', 392, 10, '2021-03-20T19:35:00Z', '2020-10-03T04:30:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (209, 'repurpose B2B portals', 'est quam', 975, 54, '2021-07-25T09:40:10Z', '2021-07-25T08:09:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (210, 'engage frictionless initiatives', 'fusce congue', 808, 28, '2021-04-04T09:08:11Z',
        '2021-04-13T20:57:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (211, 'enhance magnetic convergence', 'tincidunt nulla', 701, 62, '2021-11-15T13:09:09Z',
        '2021-07-23T22:30:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (212, 'morph synergistic web-readiness', 'sociis', 647, 54, '2021-07-28T22:43:48Z', '2021-08-09T16:09:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (213, 'seize plug-and-play users', 'eget', 80, 43, '2021-10-23T10:22:43Z', '2021-05-05T07:50:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (214, 'target open-source channels', 'enim blandit', 163, 88, '2020-11-12T20:18:44Z', '2021-06-01T21:10:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (215, 'strategize innovative web-readiness', 'metus', 503, 75, '2020-10-13T08:18:54Z', '2021-01-01T14:01:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (216, 'brand rich markets', 'ligula', 630, 20, '2021-03-12T16:34:25Z', '2021-05-01T16:49:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (217, 'transition viral eyeballs', 'at', 849, 62, '2021-06-02T06:56:44Z', '2021-07-13T00:28:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (218, 'envisioneer viral experiences', 'mauris lacinia', 946, 14, '2020-12-10T21:28:49Z',
        '2021-08-22T02:45:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (219, 'seize transparent schemas', 'sociis', 17, 16, '2021-10-16T13:41:05Z', '2020-09-03T13:53:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (220, 'architect value-added markets', 'amet sem', 488, 24, '2021-10-12T09:11:39Z', '2021-06-13T22:10:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (221, 'envisioneer real-time architectures', 'posuere felis', 120, 73, '2020-10-06T06:41:40Z',
        '2020-09-20T22:44:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (222, 'visualize B2B channels', 'nulla', 836, 28, '2021-10-02T21:19:36Z', '2021-01-22T12:58:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (223, 'productize dynamic vortals', 'turpis donec', 377, 8, '2021-02-17T02:17:33Z', '2021-07-26T09:53:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (224, 'strategize B2C e-commerce', 'felis sed', 902, 27, '2021-04-09T09:08:14Z', '2020-11-06T00:09:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (225, 'streamline revolutionary technologies', 'ultricies eu', 229, 23, '2021-08-10T13:34:50Z',
        '2021-05-01T15:27:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (226, 'exploit mission-critical paradigms', 'vivamus', 854, 61, '2020-12-11T17:49:11Z', '2021-02-10T10:30:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (227, 'morph compelling platforms', 'dui', 454, 25, '2020-12-22T09:35:42Z', '2021-09-11T04:27:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (228, 'exploit turn-key communities', 'massa id', 513, 78, '2021-10-04T20:25:21Z', '2020-11-04T18:35:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (229, 'synthesize dynamic platforms', 'quis turpis', 213, 73, '2021-03-20T02:45:56Z', '2021-11-14T20:39:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (230, 'synthesize distributed partnerships', 'nullam', 113, 9, '2020-12-01T06:12:28Z', '2021-02-01T19:15:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (231, 'iterate e-business metrics', 'cras', 432, 64, '2021-08-10T04:53:25Z', '2021-08-07T04:45:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (232, 'evolve open-source paradigms', 'sapien dignissim', 519, 63, '2021-10-18T20:35:23Z',
        '2021-08-05T13:24:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (233, 'envisioneer cross-media eyeballs', 'proin at', 911, 6, '2020-10-26T12:36:47Z', '2021-07-01T03:23:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (234, 'integrate viral action-items', 'non interdum', 570, 3, '2021-05-24T11:44:02Z', '2021-03-05T18:03:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (235, 'disintermediate global communities', 'bibendum imperdiet', 863, 33, '2020-12-13T08:50:12Z',
        '2020-09-21T03:48:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (236, 'integrate one-to-one vortals', 'morbi', 944, 9, '2021-08-22T06:58:07Z', '2020-11-16T06:21:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (237, 'extend compelling channels', 'nec', 7, 48, '2021-07-08T13:42:11Z', '2021-06-20T02:36:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (238, 'repurpose collaborative eyeballs', 'aliquam', 221, 89, '2021-02-19T20:11:14Z', '2020-09-08T17:48:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (239, 'disintermediate compelling users', 'eu mi', 500, 76, '2021-01-10T06:20:12Z', '2020-12-10T11:46:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (240, 'e-enable bricks-and-clicks vortals', 'ac', 411, 67, '2021-07-22T15:34:32Z', '2021-08-12T09:56:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (241, 'reinvent compelling infrastructures', 'eleifend pede', 532, 10, '2020-09-06T18:31:18Z',
        '2021-04-19T13:55:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (242, 'engage distributed convergence', 'duis ac', 189, 54, '2021-06-29T01:40:26Z', '2021-10-04T16:55:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (243, 'engineer cross-media schemas', 'ut', 823, 18, '2021-09-12T01:55:53Z', '2021-03-07T10:58:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (244, 'envisioneer B2C e-services', 'nullam', 444, 27, '2020-11-19T13:36:57Z', '2021-02-16T11:13:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (245, 'evolve e-business action-items', 'semper porta', 860, 35, '2021-02-02T17:03:46Z', '2021-11-07T21:35:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (246, 'implement integrated solutions', 'donec', 311, 66, '2021-08-25T21:12:28Z', '2021-02-21T19:28:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (247, 'synergize ubiquitous interfaces', 'eget tincidunt', 968, 67, '2021-06-25T08:29:28Z',
        '2021-10-30T07:44:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (248, 'incentivize customized ROI', 'etiam faucibus', 466, 88, '2021-02-04T01:12:21Z', '2021-11-10T13:51:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (249, 'transition plug-and-play interfaces', 'etiam', 307, 8, '2020-09-27T21:40:49Z', '2021-04-28T04:29:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (250, 'target magnetic e-services', 'feugiat', 421, 2, '2021-01-27T07:59:35Z', '2020-10-31T02:28:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (251, 'synergize granular e-business', 'nulla', 35, 35, '2021-01-28T22:33:01Z', '2021-04-22T19:26:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (252, 'embrace innovative paradigms', 'mauris', 218, 50, '2021-05-18T13:50:28Z', '2020-10-29T04:24:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (253, 'scale clicks-and-mortar models', 'massa', 566, 88, '2021-07-25T07:55:42Z', '2021-10-18T11:17:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (254, 'recontextualize vertical e-services', 'at', 671, 55, '2021-09-22T09:16:12Z', '2021-11-05T14:49:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (255, 'repurpose frictionless schemas', 'tincidunt', 103, 14, '2021-06-10T15:37:43Z', '2021-08-21T01:49:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (256, 'e-enable viral systems', 'in consequat', 228, 72, '2021-01-27T07:14:36Z', '2021-09-13T21:11:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (257, 'transition B2B applications', 'velit nec', 979, 65, '2021-06-03T02:24:39Z', '2021-04-01T16:48:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (258, 'incubate B2B ROI', 'cubilia curae', 477, 80, '2020-11-24T18:52:45Z', '2020-12-31T19:59:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (259, 'engage enterprise schemas', 'curae', 839, 67, '2021-10-24T07:37:27Z', '2020-10-13T13:16:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (260, 'engage sticky infrastructures', 'tellus', 622, 80, '2021-08-26T20:22:42Z', '2021-05-31T13:30:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (261, 'harness magnetic solutions', 'amet justo', 534, 48, '2021-02-10T14:36:32Z', '2020-09-13T10:54:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (262, 'scale B2B architectures', 'hendrerit', 490, 39, '2021-07-18T00:15:56Z', '2021-09-25T16:01:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (263, 'grow collaborative infrastructures', 'felis fusce', 272, 51, '2020-09-08T05:21:14Z',
        '2021-05-30T17:50:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (264, 'engineer mission-critical systems', 'ac consequat', 113, 50, '2021-11-22T07:56:39Z',
        '2020-12-26T18:03:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (265, 'deploy transparent systems', 'nunc nisl', 689, 88, '2021-07-27T06:39:10Z', '2021-01-26T16:34:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (266, 'maximize leading-edge infomediaries', 'mattis egestas', 446, 84, '2021-09-21T21:12:00Z',
        '2021-02-04T08:14:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (267, 'syndicate user-centric e-commerce', 'sollicitudin', 188, 80, '2021-03-05T22:37:30Z',
        '2021-10-26T18:53:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (268, 'expedite e-business technologies', 'cubilia', 401, 71, '2020-11-07T13:24:04Z', '2020-10-31T19:33:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (269, 'strategize ubiquitous users', 'dolor', 235, 18, '2021-08-08T18:03:00Z', '2021-07-28T21:12:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (270, 'aggregate bricks-and-clicks web services', 'natoque penatibus', 409, 75, '2020-10-21T16:42:41Z',
        '2020-12-04T09:28:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (271, 'expedite synergistic platforms', 'etiam vel', 475, 60, '2021-01-08T11:23:24Z', '2021-05-08T18:15:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (272, 'disintermediate revolutionary applications', 'pede ullamcorper', 1, 87, '2021-07-25T11:36:19Z',
        '2020-12-23T15:47:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (273, 'syndicate dynamic technologies', 'sapien', 864, 85, '2021-08-04T16:47:33Z', '2021-01-15T20:05:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (274, 'enhance back-end partnerships', 'a', 396, 62, '2021-09-03T09:11:46Z', '2020-10-11T03:47:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (275, 'transform open-source deliverables', 'ac', 973, 45, '2021-01-27T22:11:28Z', '2021-04-16T22:41:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (276, 'syndicate leading-edge relationships', 'feugiat', 48, 10, '2020-09-13T09:34:58Z', '2021-02-16T08:52:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (277, 'empower transparent portals', 'in tempus', 133, 75, '2021-09-28T17:51:51Z', '2021-05-31T07:37:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (278, 'visualize open-source channels', 'vel', 555, 77, '2021-10-12T14:35:29Z', '2021-02-09T18:20:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (279, 'repurpose leading-edge platforms', 'nisi', 496, 4, '2021-08-29T22:53:42Z', '2020-09-14T11:04:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (280, 'strategize dot-com niches', 'id', 527, 29, '2021-07-28T06:57:17Z', '2021-08-13T01:29:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (281, 'embrace dynamic experiences', 'luctus', 302, 32, '2021-09-05T07:22:46Z', '2020-11-24T08:51:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (282, 'implement mission-critical paradigms', 'lorem quisque', 935, 21, '2021-08-16T00:31:08Z',
        '2021-06-29T14:35:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (283, 'matrix virtual synergies', 'quam sapien', 658, 65, '2021-09-21T01:57:17Z', '2021-08-30T17:12:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (284, 'optimize ubiquitous web services', 'consectetuer adipiscing', 309, 87, '2021-04-26T03:26:36Z',
        '2021-10-23T19:03:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (285, 'empower collaborative e-business', 'amet', 764, 75, '2021-09-21T17:54:00Z', '2021-05-02T08:25:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (286, 'deliver collaborative models', 'sed', 280, 76, '2020-12-24T06:35:07Z', '2021-01-02T17:46:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (287, 'envisioneer magnetic functionalities', 'bibendum felis', 98, 32, '2021-06-21T11:56:57Z',
        '2021-04-24T09:04:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (288, 'maximize cross-platform schemas', 'arcu', 180, 37, '2021-08-22T03:03:57Z', '2021-02-11T13:08:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (289, 'transition revolutionary applications', 'amet', 282, 2, '2020-10-21T09:46:28Z', '2020-11-18T12:17:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (290, 'whiteboard 24/7 e-tailers', 'nam congue', 5, 29, '2021-07-26T09:46:11Z', '2021-06-24T17:10:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (291, 'maximize 24/365 supply-chains', 'nibh in', 183, 46, '2020-09-05T18:39:41Z', '2020-10-01T16:52:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (292, 'e-enable magnetic applications', 'est', 124, 66, '2021-10-01T22:52:09Z', '2021-04-23T09:26:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (293, 'facilitate revolutionary systems', 'et', 541, 48, '2020-11-06T03:04:40Z', '2021-01-31T09:15:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (294, 'benchmark wireless platforms', 'donec dapibus', 360, 52, '2021-03-18T10:32:00Z', '2020-10-20T11:02:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (295, 'cultivate plug-and-play portals', 'imperdiet sapien', 269, 12, '2021-09-10T12:55:10Z',
        '2021-11-15T18:58:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (296, 'deliver end-to-end partnerships', 'vestibulum eget', 749, 39, '2021-02-03T05:56:19Z',
        '2021-03-07T07:22:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (297, 'seize user-centric relationships', 'sem', 794, 48, '2021-10-11T04:44:01Z', '2020-11-29T20:02:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (298, 'morph magnetic systems', 'sed ante', 42, 2, '2021-10-28T19:29:23Z', '2021-06-26T07:00:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (299, 'orchestrate plug-and-play architectures', 'lacus morbi', 53, 12, '2021-04-27T07:17:47Z',
        '2021-09-11T08:23:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (300, 'morph cross-media infrastructures', 'habitasse platea', 821, 21, '2021-02-25T16:06:59Z',
        '2020-10-17T03:28:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (301, 'visualize wireless ROI', 'turpis', 764, 70, '2020-09-20T13:15:47Z', '2021-02-23T14:24:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (302, 'evolve dynamic partnerships', 'sed', 210, 74, '2020-10-29T13:13:52Z', '2021-01-28T18:20:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (303, 'integrate dynamic convergence', 'fusce posuere', 282, 90, '2021-07-31T03:19:58Z', '2021-08-11T06:14:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (304, 'innovate integrated action-items', 'felis sed', 451, 35, '2021-03-08T05:45:40Z', '2020-11-10T03:32:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (305, 'integrate value-added functionalities', 'dolor sit', 411, 18, '2021-01-31T02:54:30Z',
        '2020-09-08T23:50:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (306, 'scale mission-critical methodologies', 'adipiscing', 861, 43, '2021-01-19T15:24:39Z',
        '2021-10-29T12:46:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (307, 'transition web-enabled functionalities', 'at feugiat', 520, 1, '2021-04-09T07:28:31Z',
        '2020-11-24T15:32:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (308, 'evolve B2C schemas', 'duis bibendum', 221, 40, '2020-11-05T17:20:53Z', '2020-10-02T09:03:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (309, 'e-enable synergistic bandwidth', 'porttitor pede', 117, 14, '2021-02-09T06:00:58Z',
        '2021-02-02T10:09:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (310, 'strategize clicks-and-mortar e-services', 'justo', 753, 13, '2021-03-17T20:43:02Z',
        '2021-03-20T13:29:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (311, 'enhance interactive models', 'interdum', 347, 12, '2020-10-21T22:55:20Z', '2021-08-09T02:40:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (312, 'productize killer paradigms', 'natoque penatibus', 724, 15, '2021-06-10T09:02:42Z',
        '2021-02-09T11:32:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (313, 'incentivize revolutionary ROI', 'tristique', 450, 26, '2021-01-06T18:05:00Z', '2021-11-01T07:54:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (314, 'unleash out-of-the-box architectures', 'non mattis', 137, 64, '2021-08-01T22:36:12Z',
        '2020-10-24T03:21:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (315, 'transition plug-and-play e-services', 'nec', 824, 84, '2021-08-08T16:20:55Z', '2021-09-19T10:17:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (316, 'expedite cross-platform e-business', 'molestie', 621, 52, '2021-06-19T01:22:33Z', '2021-06-20T12:45:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (317, 'synergize integrated architectures', 'fermentum justo', 280, 71, '2021-06-23T18:21:49Z',
        '2021-03-23T23:51:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (318, 'e-enable integrated systems', 'nam nulla', 768, 76, '2021-01-09T19:25:07Z', '2021-02-06T09:05:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (319, 'enable plug-and-play supply-chains', 'ligula vehicula', 268, 19, '2020-09-21T23:12:02Z',
        '2021-02-10T21:53:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (320, 'recontextualize transparent action-items', 'risus praesent', 119, 88, '2021-11-18T10:52:33Z',
        '2020-12-29T20:43:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (321, 'streamline innovative bandwidth', 'tempus', 733, 66, '2020-11-27T09:55:15Z', '2020-10-31T01:29:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (322, 'productize robust infrastructures', 'ultrices posuere', 286, 51, '2020-09-22T05:15:55Z',
        '2021-11-16T01:30:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (323, 'transform cross-media niches', 'aliquam non', 808, 28, '2021-10-31T04:04:51Z', '2020-11-25T06:43:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (324, 'enhance holistic eyeballs', 'ultrices posuere', 699, 39, '2021-09-03T18:36:35Z', '2020-12-16T04:00:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (325, 'innovate intuitive mindshare', 'proin', 570, 59, '2021-01-03T19:03:24Z', '2021-10-05T03:40:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (326, 'utilize front-end portals', 'quam', 580, 63, '2020-10-13T01:19:58Z', '2020-10-12T14:59:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (327, 'transform rich e-business', 'in', 237, 25, '2021-03-16T18:08:46Z', '2021-01-19T16:59:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (328, 'reinvent magnetic initiatives', 'amet', 942, 30, '2020-12-09T04:49:27Z', '2021-05-01T22:17:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (329, 'streamline efficient schemas', 'non', 939, 40, '2021-04-06T03:15:44Z', '2021-05-14T06:31:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (330, 'matrix front-end metrics', 'ac', 13, 35, '2020-12-11T03:11:48Z', '2021-01-20T09:45:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (331, 'expedite world-class systems', 'morbi vestibulum', 451, 48, '2021-09-29T17:17:54Z',
        '2020-11-19T05:11:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (332, 'recontextualize user-centric e-markets', 'rutrum', 610, 18, '2020-09-17T08:31:59Z',
        '2021-04-11T04:39:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (333, 'innovate revolutionary infomediaries', 'ac nibh', 52, 47, '2021-01-19T05:41:05Z', '2020-12-18T06:11:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (334, 'transform B2B experiences', 'ante vel', 969, 42, '2020-10-30T08:34:22Z', '2021-09-30T04:42:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (335, 'repurpose scalable partnerships', 'tellus nisi', 356, 37, '2021-01-30T08:28:54Z', '2021-01-12T11:20:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (336, 'unleash proactive web services', 'cubilia curae', 216, 78, '2020-11-11T06:16:43Z',
        '2021-09-09T17:52:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (337, 'iterate innovative web services', 'non sodales', 746, 6, '2020-12-18T02:09:14Z', '2021-04-27T04:28:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (338, 'empower strategic interfaces', 'purus', 825, 47, '2021-07-20T17:24:29Z', '2020-10-15T09:47:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (339, 'disintermediate innovative paradigms', 'nam', 639, 26, '2021-02-09T13:35:13Z', '2021-08-30T20:47:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (340, 'seize cross-platform infrastructures', 'diam', 577, 21, '2021-02-14T08:53:54Z', '2021-06-19T07:02:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (341, 'seize frictionless communities', 'nibh', 464, 32, '2021-05-05T00:32:36Z', '2020-10-15T17:44:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (342, 'target B2C synergies', 'volutpat dui', 276, 5, '2021-03-01T08:57:10Z', '2021-06-30T08:36:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (343, 'exploit back-end web-readiness', 'id consequat', 626, 30, '2021-01-06T06:21:56Z', '2020-12-01T10:40:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (344, 'strategize sticky web services', 'donec dapibus', 561, 55, '2021-02-27T07:19:27Z',
        '2021-02-12T03:36:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (345, 'reinvent value-added infomediaries', 'nulla', 966, 56, '2021-10-08T19:16:12Z', '2020-12-27T09:20:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (346, 'facilitate proactive content', 'dictumst maecenas', 211, 66, '2020-10-31T14:24:45Z',
        '2021-08-14T07:06:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (347, 'enable virtual e-tailers', 'hac habitasse', 796, 56, '2021-01-22T04:21:39Z', '2021-07-16T02:43:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (348, 'mesh value-added experiences', 'curae', 451, 48, '2020-12-18T17:36:29Z', '2020-11-27T16:40:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (349, 'engage clicks-and-mortar architectures', 'porttitor', 793, 52, '2021-01-29T17:23:03Z',
        '2021-06-26T16:08:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (350, 'e-enable magnetic applications', 'luctus', 543, 59, '2020-10-11T08:33:57Z', '2021-06-24T15:41:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (351, 'repurpose granular web-readiness', 'quisque', 618, 56, '2021-10-29T02:51:44Z', '2021-07-30T19:10:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (352, 'enable killer solutions', 'ac', 830, 52, '2021-04-27T08:58:52Z', '2021-04-14T05:09:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (353, 'transition visionary platforms', 'augue', 606, 20, '2021-09-09T18:57:26Z', '2021-09-04T23:59:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (354, 'incubate plug-and-play e-business', 'luctus et', 783, 20, '2021-07-18T16:52:38Z', '2021-10-31T20:40:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (355, 'streamline cross-platform deliverables', 'primis in', 693, 77, '2021-01-28T03:55:52Z',
        '2021-09-25T23:53:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (356, 'facilitate cutting-edge initiatives', 'sapien', 118, 43, '2020-11-18T21:34:20Z', '2021-10-31T04:07:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (357, 'extend rich e-business', 'tempus', 305, 82, '2020-11-03T06:17:06Z', '2021-04-23T07:08:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (358, 'leverage wireless solutions', 'vehicula', 36, 8, '2020-11-16T12:57:01Z', '2021-10-09T22:49:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (359, 'mesh 24/7 systems', 'turpis', 66, 17, '2021-07-25T19:28:46Z', '2021-08-10T22:59:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (360, 'deliver dynamic e-services', 'etiam faucibus', 120, 88, '2021-10-16T18:45:25Z', '2021-11-22T04:15:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (361, 'optimize sexy applications', 'ultricies', 501, 41, '2020-10-13T04:22:26Z', '2021-10-04T06:38:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (362, 'aggregate e-business web services', 'erat volutpat', 865, 23, '2021-08-31T18:20:39Z',
        '2021-06-07T10:43:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (363, 'innovate plug-and-play portals', 'condimentum', 871, 45, '2021-03-03T15:37:07Z', '2020-09-06T13:43:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (364, 'reintermediate turn-key synergies', 'maecenas pulvinar', 404, 34, '2021-05-28T08:34:28Z',
        '2021-09-24T16:00:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (365, 'envisioneer best-of-breed users', 'tellus', 641, 6, '2021-08-30T02:05:04Z', '2021-07-11T23:55:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (366, 'mesh rich bandwidth', 'justo maecenas', 894, 69, '2021-06-29T22:07:35Z', '2021-07-12T13:58:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (367, 'innovate innovative technologies', 'non sodales', 888, 30, '2021-04-24T02:20:30Z',
        '2021-06-06T22:45:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (368, 'mesh cutting-edge mindshare', 'odio condimentum', 55, 45, '2021-09-12T22:21:30Z', '2021-09-27T20:46:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (369, 'reintermediate visionary e-tailers', 'erat volutpat', 435, 37, '2021-07-07T15:27:11Z',
        '2021-03-02T09:50:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (370, 'revolutionize B2B eyeballs', 'ut massa', 90, 35, '2021-11-17T05:42:50Z', '2020-09-17T06:42:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (371, 'enhance e-business infrastructures', 'condimentum curabitur', 456, 21, '2020-10-10T17:51:00Z',
        '2021-07-22T23:46:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (372, 'e-enable holistic action-items', 'proin', 596, 88, '2020-11-13T13:21:08Z', '2021-10-05T12:12:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (373, 'iterate sticky ROI', 'pede justo', 826, 66, '2021-09-23T06:18:57Z', '2020-10-24T22:42:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (374, 'synergize sexy vortals', 'metus vitae', 824, 24, '2020-12-23T04:18:38Z', '2021-05-29T12:53:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (375, 'optimize sexy action-items', 'in blandit', 935, 54, '2021-10-17T12:53:08Z', '2021-07-23T22:27:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (376, 'engineer distributed metrics', 'ac', 728, 8, '2021-01-13T03:17:13Z', '2021-10-30T09:49:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (377, 'brand granular e-business', 'amet erat', 111, 59, '2021-08-05T22:08:10Z', '2020-09-13T13:46:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (378, 'reinvent back-end synergies', 'vitae', 185, 22, '2021-07-04T10:53:32Z', '2020-11-16T03:20:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (379, 'extend distributed supply-chains', 'ante', 929, 50, '2021-11-05T04:36:20Z', '2020-11-07T16:02:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (380, 'brand viral interfaces', 'est congue', 186, 14, '2021-06-18T12:17:05Z', '2021-07-11T23:02:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (381, 'reinvent web-enabled markets', 'rutrum', 656, 77, '2021-05-02T23:02:14Z', '2021-04-13T22:05:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (382, 'whiteboard 24/7 content', 'nibh', 352, 12, '2021-09-13T10:26:04Z', '2021-03-06T09:17:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (383, 'generate efficient content', 'ullamcorper', 348, 18, '2021-04-02T01:09:08Z', '2021-01-09T17:26:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (384, 'reinvent seamless action-items', 'nam dui', 508, 15, '2021-11-18T19:30:28Z', '2021-10-01T08:08:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (385, 'productize e-business networks', 'magna bibendum', 127, 43, '2021-10-19T19:53:47Z',
        '2021-07-10T05:52:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (386, 'scale frictionless vortals', 'habitasse', 104, 12, '2021-10-06T07:17:10Z', '2021-06-02T19:15:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (387, 'evolve vertical e-services', 'mauris', 273, 24, '2021-04-05T06:55:20Z', '2020-12-02T18:44:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (388, 'strategize scalable networks', 'tortor', 566, 59, '2020-11-09T04:58:38Z', '2021-07-09T15:10:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (389, 'orchestrate next-generation technologies', 'aliquet', 356, 3, '2021-06-22T08:38:46Z',
        '2021-07-21T15:23:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (390, 'enhance collaborative e-tailers', 'enim leo', 222, 44, '2021-05-07T15:37:50Z', '2021-07-13T06:32:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (391, 'embrace value-added communities', 'nisi venenatis', 576, 85, '2020-12-26T00:20:17Z',
        '2021-05-24T04:49:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (392, 'deliver frictionless bandwidth', 'eget', 486, 36, '2020-12-04T05:01:11Z', '2020-09-17T10:00:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (393, 'embrace viral action-items', 'orci', 211, 39, '2021-10-13T02:21:58Z', '2021-02-26T08:04:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (394, 'transition extensible metrics', 'a odio', 876, 35, '2021-10-28T07:30:50Z', '2021-07-20T19:52:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (395, 'scale dot-com users', 'hac habitasse', 10, 37, '2021-11-07T02:26:49Z', '2021-01-21T06:15:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (396, 'cultivate granular metrics', 'metus', 210, 61, '2021-06-26T19:57:50Z', '2021-09-25T13:07:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (397, 'extend global action-items', 'primis', 915, 71, '2020-09-04T07:09:57Z', '2021-04-09T21:12:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (398, 'deploy real-time e-tailers', 'consectetuer adipiscing', 331, 87, '2021-01-18T19:28:24Z',
        '2021-10-20T23:58:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (399, 'grow intuitive architectures', 'primis in', 338, 19, '2021-06-17T15:10:38Z', '2021-05-31T03:32:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (400, 'utilize real-time e-commerce', 'erat volutpat', 128, 36, '2021-07-03T17:01:07Z', '2021-10-10T03:07:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (401, 'reintermediate bleeding-edge e-markets', 'sed augue', 591, 72, '2021-06-17T13:33:22Z',
        '2020-10-08T06:50:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (402, 'streamline front-end infrastructures', 'fermentum', 789, 69, '2020-12-28T19:49:31Z',
        '2021-09-17T21:42:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (403, 'orchestrate next-generation solutions', 'aenean', 85, 87, '2021-02-13T10:01:30Z', '2021-03-09T05:20:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (404, 'enhance world-class systems', 'dignissim vestibulum', 498, 74, '2020-09-12T09:35:01Z',
        '2021-08-30T18:24:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (405, 'deploy cross-media partnerships', 'ac nulla', 29, 14, '2021-04-06T03:44:56Z', '2021-05-11T15:16:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (406, 'evolve 24/365 systems', 'quis', 322, 4, '2021-07-18T11:26:44Z', '2021-11-19T00:04:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (407, 'maximize revolutionary interfaces', 'lectus', 232, 12, '2021-07-08T05:55:18Z', '2021-08-21T08:17:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (408, 'matrix collaborative niches', 'tempus semper', 519, 77, '2020-10-16T16:15:54Z', '2021-07-26T10:32:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (409, 'unleash synergistic partnerships', 'nec molestie', 947, 37, '2020-09-10T20:44:34Z',
        '2021-06-08T08:17:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (410, 'syndicate turn-key infrastructures', 'eu nibh', 882, 53, '2020-10-16T18:23:04Z', '2021-09-27T21:26:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (411, 'benchmark granular action-items', 'mauris', 491, 49, '2021-08-05T14:01:47Z', '2021-07-06T23:16:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (412, 'harness interactive e-services', 'id', 739, 15, '2020-09-23T03:56:35Z', '2021-09-09T05:14:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (413, 'seize dot-com interfaces', 'ultrices posuere', 83, 32, '2021-05-30T08:25:16Z', '2021-09-18T17:42:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (414, 'expedite wireless schemas', 'a nibh', 216, 64, '2020-12-14T02:26:11Z', '2021-02-16T01:21:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (415, 'reinvent front-end deliverables', 'mauris', 451, 19, '2021-11-22T16:17:20Z', '2021-01-22T02:22:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (416, 'generate robust communities', 'orci', 755, 42, '2021-05-29T06:38:54Z', '2021-01-21T13:04:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (417, 'grow B2C ROI', 'ligula vehicula', 324, 82, '2021-03-06T12:40:52Z', '2020-10-24T00:14:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (418, 'productize wireless web services', 'id justo', 322, 62, '2021-09-18T16:05:43Z', '2020-12-09T07:24:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (419, 'engage magnetic relationships', 'in', 616, 4, '2021-06-29T18:34:24Z', '2021-01-19T17:54:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (420, 'disintermediate sexy partnerships', 'potenti in', 300, 38, '2021-09-23T21:30:06Z',
        '2021-08-08T10:29:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (421, 'orchestrate front-end metrics', 'eget', 176, 47, '2021-11-16T01:45:01Z', '2020-10-03T05:19:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (422, 'transition one-to-one web services', 'libero rutrum', 996, 82, '2021-09-23T00:47:55Z',
        '2020-12-02T05:57:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (423, 'harness 24/365 schemas', 'vitae', 178, 78, '2021-09-06T02:12:29Z', '2021-06-12T20:58:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (424, 'seize killer e-business', 'proin leo', 70, 77, '2021-08-29T13:44:00Z', '2020-12-01T20:31:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (425, 'maximize cross-media content', 'posuere', 278, 53, '2021-01-18T13:17:11Z', '2021-04-07T05:00:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (426, 'engage best-of-breed methodologies', 'facilisi', 147, 28, '2021-09-18T12:36:11Z', '2021-10-29T18:32:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (427, 'enhance extensible networks', 'ipsum integer', 242, 73, '2021-01-30T10:56:54Z', '2021-09-29T09:56:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (428, 'innovate dot-com platforms', 'aliquet', 274, 19, '2020-12-04T01:19:30Z', '2020-10-01T10:07:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (429, 'deliver frictionless convergence', 'dignissim vestibulum', 228, 37, '2020-09-06T11:09:38Z',
        '2021-11-01T14:48:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (430, 'whiteboard compelling niches', 'tempor convallis', 905, 10, '2021-02-13T21:51:22Z',
        '2021-07-05T05:26:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (431, 'embrace rich channels', 'mattis', 446, 63, '2020-12-21T02:02:15Z', '2021-09-07T05:34:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (432, 'recontextualize bricks-and-clicks bandwidth', 'viverra pede', 246, 68, '2021-02-23T21:11:42Z',
        '2021-01-22T12:33:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (433, 'facilitate viral web services', 'tortor duis', 926, 81, '2020-11-16T12:07:13Z', '2021-06-30T17:02:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (434, 'repurpose value-added supply-chains', 'duis bibendum', 397, 19, '2020-11-02T08:10:28Z',
        '2021-06-14T13:51:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (435, 'monetize robust schemas', 'gravida sem', 701, 33, '2021-07-05T06:49:49Z', '2021-07-25T14:17:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (436, 'enhance collaborative technologies', 'pellentesque at', 453, 41, '2021-08-06T02:11:07Z',
        '2021-05-23T17:21:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (437, 'engage efficient content', 'ligula suspendisse', 125, 86, '2021-07-07T20:29:43Z', '2021-09-08T10:21:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (438, 'repurpose end-to-end systems', 'lectus vestibulum', 885, 76, '2021-06-02T04:31:53Z',
        '2021-08-01T23:41:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (439, 'productize bricks-and-clicks mindshare', 'eget eleifend', 404, 16, '2021-09-09T08:03:32Z',
        '2021-09-17T05:53:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (440, 'recontextualize global initiatives', 'ipsum dolor', 817, 71, '2021-09-18T04:18:29Z',
        '2021-07-27T03:05:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (441, 'morph bricks-and-clicks platforms', 'in', 805, 16, '2021-07-16T15:02:59Z', '2020-09-06T23:46:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (442, 'recontextualize seamless web-readiness', 'cubilia curae', 523, 73, '2020-10-13T18:26:58Z',
        '2020-12-27T14:00:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (443, 'expedite dynamic schemas', 'ut', 152, 78, '2021-04-29T20:38:32Z', '2021-11-17T01:36:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (444, 'incubate viral supply-chains', 'porttitor pede', 421, 45, '2021-04-26T02:46:30Z', '2021-10-31T13:01:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (445, 'extend dot-com schemas', 'sapien', 983, 60, '2021-01-27T17:10:00Z', '2021-06-15T15:52:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (446, 'incentivize compelling partnerships', 'lorem integer', 601, 86, '2021-05-16T06:21:40Z',
        '2020-10-02T21:26:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (447, 'innovate enterprise eyeballs', 'penatibus et', 894, 8, '2021-10-29T14:53:31Z', '2020-12-05T06:54:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (448, 'reinvent frictionless relationships', 'ut', 743, 17, '2020-11-25T01:38:01Z', '2021-05-31T00:17:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (449, 'morph bricks-and-clicks synergies', 'feugiat non', 473, 65, '2021-10-10T04:54:30Z',
        '2020-10-31T17:18:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (450, 'evolve B2B technologies', 'sollicitudin mi', 299, 50, '2021-01-28T21:08:56Z', '2020-10-24T10:01:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (451, 'facilitate granular infomediaries', 'felis fusce', 786, 19, '2021-05-27T07:21:06Z',
        '2020-12-15T21:42:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (452, 'synthesize interactive systems', 'neque sapien', 569, 17, '2020-09-02T02:44:28Z', '2020-09-05T09:41:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (453, 'enable efficient relationships', 'massa volutpat', 374, 25, '2021-04-26T07:25:24Z',
        '2021-05-09T01:33:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (454, 'target mission-critical web-readiness', 'dui vel', 823, 77, '2021-07-08T17:28:08Z',
        '2021-01-20T10:30:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (455, 'productize e-business deliverables', 'velit', 321, 15, '2021-05-20T06:05:22Z', '2021-08-28T04:43:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (456, 'aggregate impactful schemas', 'posuere cubilia', 171, 88, '2021-04-03T05:30:06Z', '2020-10-17T21:26:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (457, 'envisioneer one-to-one networks', 'mauris morbi', 258, 28, '2020-09-24T04:31:41Z',
        '2021-03-01T14:55:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (458, 'visualize scalable markets', 'in congue', 985, 83, '2021-03-27T01:25:49Z', '2021-05-18T03:46:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (459, 'redefine vertical communities', 'erat', 283, 76, '2021-07-08T01:26:57Z', '2021-02-13T05:31:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (460, 'iterate efficient portals', 'in consequat', 968, 67, '2021-03-22T15:07:11Z', '2021-05-24T02:11:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (461, 'mesh web-enabled web services', 'curae duis', 377, 1, '2021-05-29T03:48:30Z', '2021-07-09T20:52:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (462, 'extend impactful web services', 'integer ac', 936, 16, '2021-05-29T04:57:28Z', '2021-10-16T06:49:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (463, 'disintermediate cross-platform interfaces', 'ultrices enim', 155, 65, '2021-11-22T14:51:28Z',
        '2021-03-01T23:05:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (464, 'envisioneer interactive interfaces', 'integer a', 633, 41, '2021-02-01T04:43:44Z',
        '2021-06-27T15:21:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (465, 'drive world-class networks', 'nulla', 894, 58, '2021-02-02T01:55:56Z', '2021-03-17T07:38:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (466, 'integrate cutting-edge synergies', 'tincidunt', 747, 18, '2020-12-02T22:29:31Z', '2021-02-02T16:10:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (467, 'iterate granular synergies', 'rutrum ac', 275, 87, '2020-12-08T17:23:25Z', '2020-11-16T19:29:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (468, 'enable plug-and-play initiatives', 'platea', 684, 5, '2021-08-24T12:59:29Z', '2021-09-04T15:09:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (469, 'redefine cutting-edge interfaces', 'nulla', 962, 12, '2021-05-17T03:41:42Z', '2021-06-26T05:37:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (470, 'grow sexy niches', 'in', 41, 72, '2021-07-02T06:43:31Z', '2021-10-19T19:43:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (471, 'envisioneer impactful synergies', 'elit', 653, 62, '2020-12-29T03:43:57Z', '2020-11-18T04:08:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (472, 'utilize world-class deliverables', 'mus', 258, 25, '2020-11-30T05:14:35Z', '2021-11-21T01:26:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (473, 'deliver visionary e-commerce', 'adipiscing elit', 96, 73, '2021-05-29T09:11:23Z', '2020-09-26T05:40:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (474, 'synthesize 24/7 deliverables', 'adipiscing lorem', 528, 22, '2020-10-30T06:54:38Z',
        '2021-01-09T08:29:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (475, 'productize B2C supply-chains', 'ligula pellentesque', 13, 81, '2021-02-20T02:04:55Z',
        '2021-10-15T22:14:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (476, 'strategize robust niches', 'justo', 759, 3, '2021-05-06T17:06:59Z', '2021-04-08T03:02:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (477, 'integrate plug-and-play channels', 'sapien sapien', 453, 89, '2020-09-15T20:53:03Z',
        '2021-11-22T14:55:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (478, 'facilitate value-added e-commerce', 'dapibus', 589, 23, '2021-09-04T22:34:03Z', '2020-11-27T03:56:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (479, 'architect leading-edge interfaces', 'nunc', 245, 76, '2021-07-16T15:35:53Z', '2021-06-19T21:56:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (480, 'evolve extensible e-commerce', 'scelerisque quam', 14, 83, '2021-01-08T08:35:07Z',
        '2021-11-23T21:14:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (481, 'mesh proactive e-services', 'pretium', 434, 12, '2020-11-22T12:36:36Z', '2021-04-01T01:48:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (482, 'matrix innovative deliverables', 'mi', 633, 13, '2021-06-18T06:26:33Z', '2021-06-22T17:05:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (483, 'scale scalable infrastructures', 'est', 74, 34, '2021-04-23T17:25:25Z', '2021-11-23T22:47:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (484, 'implement turn-key action-items', 'ipsum', 497, 88, '2020-09-09T06:37:24Z', '2021-09-24T07:01:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (485, 'optimize one-to-one schemas', 'velit id', 755, 55, '2020-12-02T22:38:40Z', '2021-01-08T05:30:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (486, 'syndicate viral mindshare', 'ipsum', 130, 45, '2021-04-26T14:21:29Z', '2021-02-05T14:28:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (487, 'transition customized networks', 'turpis eget', 264, 17, '2021-07-28T21:17:34Z', '2021-06-20T06:56:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (488, 'reintermediate real-time communities', 'justo lacinia', 575, 85, '2021-10-13T23:45:35Z',
        '2021-03-11T22:31:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (489, 'repurpose open-source bandwidth', 'mauris laoreet', 99, 15, '2021-04-28T10:47:20Z',
        '2021-06-15T15:50:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (490, 'synthesize strategic models', 'non', 478, 65, '2021-06-08T11:10:36Z', '2021-09-01T02:13:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (491, 'synthesize web-enabled initiatives', 'nec', 582, 22, '2021-03-14T16:30:59Z', '2020-10-02T01:03:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (492, 'syndicate virtual interfaces', 'odio donec', 196, 65, '2021-08-05T20:42:34Z', '2020-10-31T09:01:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (493, 'whiteboard plug-and-play web-readiness', 'ultrices mattis', 483, 68, '2021-10-10T06:30:43Z',
        '2021-09-22T15:05:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (494, 'aggregate cross-media initiatives', 'enim', 77, 67, '2021-01-20T23:36:59Z', '2021-11-14T13:31:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (495, 'maximize B2B methodologies', 'viverra', 772, 82, '2021-02-28T07:44:25Z', '2020-11-07T01:17:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (496, 'leverage web-enabled applications', 'vestibulum', 330, 37, '2021-08-20T04:06:54Z',
        '2020-09-21T15:28:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (497, 'extend next-generation vortals', 'felis', 674, 37, '2021-04-01T02:36:56Z', '2021-02-13T06:29:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (498, 'envisioneer user-centric e-markets', 'augue', 84, 2, '2021-04-24T00:03:21Z', '2020-12-26T04:24:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (499, 'aggregate B2C convergence', 'nisi', 856, 30, '2021-10-13T21:07:19Z', '2021-07-13T07:35:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (500, 'whiteboard cutting-edge architectures', 'vivamus', 804, 28, '2020-12-29T12:05:34Z',
        '2020-11-05T02:26:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (501, 'embrace best-of-breed systems', 'erat nulla', 649, 87, '2021-06-06T20:33:26Z', '2021-09-12T19:25:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (502, 'leverage efficient channels', 'quis odio', 28, 61, '2021-03-06T20:01:49Z', '2021-03-12T22:21:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (503, 'revolutionize world-class markets', 'tellus in', 777, 30, '2021-04-26T05:15:05Z', '2021-07-11T05:54:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (504, 'brand global networks', 'ultrices posuere', 924, 60, '2021-11-08T14:53:00Z', '2021-07-10T12:44:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (505, 'grow mission-critical relationships', 'nibh', 988, 75, '2021-07-25T08:53:05Z', '2021-05-12T19:29:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (506, 'recontextualize turn-key networks', 'quam', 748, 10, '2021-05-20T00:07:28Z', '2021-01-10T07:15:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (507, 'visualize efficient web services', 'posuere cubilia', 137, 30, '2021-11-15T00:31:30Z',
        '2020-12-19T22:18:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (508, 'transition value-added e-commerce', 'odio condimentum', 520, 67, '2021-10-14T20:44:44Z',
        '2021-01-18T06:05:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (509, 'drive efficient e-markets', 'tincidunt', 463, 12, '2021-09-09T16:46:10Z', '2020-09-20T06:10:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (510, 'optimize mission-critical convergence', 'urna', 302, 52, '2021-02-28T01:31:56Z', '2021-10-11T08:55:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (511, 'integrate strategic vortals', 'urna', 276, 7, '2021-09-13T19:08:48Z', '2021-05-16T23:45:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (512, 'incubate collaborative convergence', 'in', 797, 7, '2021-09-13T09:17:23Z', '2021-09-10T22:54:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (513, 'harness user-centric infomediaries', 'phasellus', 755, 22, '2021-01-30T01:14:07Z',
        '2021-04-27T09:04:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (514, 'drive granular portals', 'quam', 634, 82, '2021-11-02T17:22:04Z', '2020-11-21T14:43:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (515, 'orchestrate interactive users', 'varius integer', 973, 53, '2021-10-26T06:56:11Z',
        '2020-10-29T19:26:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (516, 'repurpose leading-edge action-items', 'non sodales', 573, 5, '2020-11-18T00:05:21Z',
        '2020-12-02T01:58:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (517, 'visualize value-added partnerships', 'donec vitae', 838, 87, '2021-07-14T23:59:12Z',
        '2021-05-02T16:04:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (518, 'iterate dynamic relationships', 'habitasse', 767, 45, '2020-10-31T17:05:36Z', '2021-10-08T09:50:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (519, 'iterate world-class deliverables', 'turpis', 641, 63, '2021-10-08T19:23:41Z', '2020-11-16T15:37:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (520, 'matrix interactive e-commerce', 'viverra dapibus', 465, 11, '2021-08-15T12:45:33Z',
        '2020-11-26T13:58:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (521, 'utilize wireless models', 'turpis adipiscing', 687, 68, '2021-09-30T19:16:22Z', '2021-09-21T18:06:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (522, 'orchestrate bricks-and-clicks communities', 'augue', 21, 34, '2021-09-24T19:34:07Z',
        '2021-04-22T11:44:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (523, 'empower 24/7 web services', 'cras', 309, 11, '2021-03-05T21:16:49Z', '2021-02-19T02:04:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (524, 'evolve cross-platform methodologies', 'enim', 626, 12, '2021-11-08T09:06:41Z', '2021-08-23T07:43:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (525, 'incentivize vertical initiatives', 'et magnis', 732, 65, '2020-12-12T21:20:46Z', '2021-07-11T06:11:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (526, 'generate magnetic interfaces', 'non pretium', 185, 35, '2021-06-08T01:10:47Z', '2021-05-10T01:11:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (527, 'enhance intuitive deliverables', 'etiam', 521, 8, '2021-01-22T19:01:32Z', '2020-11-12T00:57:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (528, 'brand distributed content', 'sit amet', 571, 48, '2021-02-19T06:01:38Z', '2021-04-19T18:44:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (529, 'deploy collaborative deliverables', 'porta volutpat', 753, 81, '2021-03-24T22:26:00Z',
        '2021-04-03T11:19:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (530, 'deploy visionary e-services', 'vehicula', 928, 14, '2021-07-05T13:36:23Z', '2021-03-04T00:21:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (531, 'brand intuitive models', 'augue', 217, 44, '2020-09-11T09:50:13Z', '2020-11-12T10:05:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (532, 'redefine B2C content', 'velit nec', 720, 19, '2021-05-12T04:25:11Z', '2020-11-15T06:24:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (533, 'productize web-enabled relationships', 'felis', 701, 63, '2020-09-12T04:21:05Z', '2021-10-10T06:23:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (534, 'grow mission-critical methodologies', 'diam', 806, 7, '2021-09-07T17:46:17Z', '2020-12-16T20:15:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (535, 'iterate sexy synergies', 'donec', 197, 10, '2021-09-18T23:27:14Z', '2021-02-22T11:30:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (536, 'evolve visionary e-tailers', 'convallis nulla', 857, 66, '2021-06-22T11:34:32Z', '2020-11-27T04:05:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (537, 'maximize back-end e-services', 'id', 659, 31, '2021-07-13T12:31:38Z', '2020-09-29T09:40:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (538, 'enable dynamic convergence', 'vel lectus', 511, 73, '2021-11-15T17:52:44Z', '2020-10-22T02:25:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (539, 'deliver leading-edge niches', 'nec nisi', 737, 71, '2020-10-26T06:56:17Z', '2021-01-12T13:25:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (540, 'grow customized infrastructures', 'rhoncus', 92, 20, '2021-04-28T19:04:54Z', '2021-07-30T22:01:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (541, 'engineer virtual solutions', 'ante', 226, 84, '2020-09-05T01:15:31Z', '2021-03-06T11:18:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (542, 'envisioneer real-time metrics', 'nam', 907, 10, '2021-03-13T02:52:41Z', '2021-08-19T18:15:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (543, 'reinvent global e-markets', 'cras', 45, 59, '2021-02-28T19:32:39Z', '2020-09-23T09:28:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (544, 'deploy compelling niches', 'blandit', 670, 34, '2021-10-22T19:17:52Z', '2021-11-05T08:40:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (545, 'synergize granular paradigms', 'suspendisse ornare', 281, 54, '2021-10-13T07:09:21Z',
        '2021-03-22T18:08:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (546, 'synthesize frictionless deliverables', 'aliquet', 536, 39, '2020-11-29T15:25:28Z',
        '2021-09-15T04:45:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (547, 'disintermediate sexy paradigms', 'lacus at', 398, 8, '2020-10-08T12:45:11Z', '2021-04-03T07:23:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (548, 'brand dot-com niches', 'ullamcorper', 744, 66, '2021-11-23T00:59:25Z', '2021-02-21T16:50:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (549, 'target virtual niches', 'nisl venenatis', 140, 79, '2020-09-22T04:47:06Z', '2021-01-21T06:14:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (550, 'transform sticky niches', 'ut', 692, 8, '2020-12-20T19:17:44Z', '2020-11-27T11:06:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (551, 'repurpose bricks-and-clicks bandwidth', 'est', 154, 67, '2021-04-18T16:48:41Z', '2021-03-06T20:44:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (552, 'extend 24/365 bandwidth', 'vestibulum quam', 477, 2, '2020-11-20T00:26:04Z', '2021-04-29T08:06:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (553, 'scale dynamic portals', 'quisque arcu', 785, 26, '2021-02-15T06:44:19Z', '2021-01-14T15:20:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (554, 'repurpose dot-com experiences', 'sit amet', 91, 5, '2021-03-02T03:12:07Z', '2021-01-20T13:36:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (555, 'transform killer interfaces', 'tempor', 638, 41, '2021-10-09T06:46:45Z', '2021-08-03T05:37:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (556, 'reintermediate distributed systems', 'dolor sit', 723, 68, '2020-11-20T21:50:39Z',
        '2021-06-09T06:34:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (557, 'integrate plug-and-play methodologies', 'elit', 490, 85, '2021-08-28T20:57:16Z', '2020-10-22T15:57:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (558, 'reinvent leading-edge infrastructures', 'in', 497, 72, '2020-12-08T00:02:53Z', '2021-09-07T17:29:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (559, 'generate extensible bandwidth', 'sapien', 993, 43, '2021-10-22T17:50:16Z', '2021-03-05T06:33:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (560, 'mesh sticky initiatives', 'vulputate', 209, 62, '2021-05-02T07:02:44Z', '2021-01-31T05:17:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (561, 'synergize web-enabled portals', 'rhoncus', 742, 77, '2021-07-29T08:40:29Z', '2021-08-10T10:14:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (562, 'streamline cutting-edge models', 'augue', 5, 74, '2021-11-02T18:48:35Z', '2021-03-03T08:13:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (563, 'deliver dot-com users', 'nunc vestibulum', 966, 60, '2021-03-11T07:19:10Z', '2020-12-13T14:44:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (564, 'deploy wireless web-readiness', 'pellentesque', 735, 22, '2021-09-07T03:48:57Z', '2021-10-03T20:24:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (565, 'synthesize leading-edge experiences', 'morbi', 569, 4, '2021-05-13T17:36:22Z', '2020-10-17T08:15:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (566, 'aggregate strategic content', 'lorem quisque', 184, 87, '2020-09-02T20:17:39Z', '2021-10-21T00:27:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (567, 'aggregate transparent systems', 'aenean lectus', 349, 68, '2020-10-05T06:31:57Z', '2021-08-18T08:59:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (568, 'seize enterprise e-markets', 'duis', 633, 39, '2021-07-07T19:20:35Z', '2021-11-22T14:31:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (569, 'morph cutting-edge niches', 'feugiat', 383, 82, '2021-10-24T13:34:46Z', '2021-06-24T16:27:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (570, 'strategize 24/7 platforms', 'in faucibus', 723, 34, '2021-03-05T04:15:22Z', '2021-02-01T20:42:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (571, 'incubate viral networks', 'pede', 263, 32, '2021-04-01T04:01:27Z', '2021-09-24T08:03:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (572, 'leverage vertical web services', 'augue', 689, 76, '2021-09-20T14:18:15Z', '2021-06-07T03:44:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (573, 'extend cross-media vortals', 'morbi vel', 957, 18, '2021-11-14T22:39:21Z', '2021-04-17T07:39:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (574, 'enable integrated e-tailers', 'dui proin', 393, 68, '2020-12-04T08:01:11Z', '2021-11-17T20:17:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (575, 'cultivate customized deliverables', 'convallis nulla', 280, 30, '2021-11-14T20:00:58Z',
        '2020-11-27T16:54:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (576, 'cultivate user-centric niches', 'vestibulum', 947, 61, '2021-11-10T07:15:16Z', '2021-07-15T21:08:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (577, 'grow impactful web services', 'mauris', 63, 62, '2021-01-01T06:46:13Z', '2021-03-18T22:53:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (578, 'empower granular systems', 'enim sit', 254, 9, '2021-05-29T23:45:00Z', '2021-04-06T23:45:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (579, 'deploy front-end e-business', 'rutrum', 529, 59, '2021-03-06T15:02:30Z', '2021-06-21T14:03:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (580, 'utilize cross-media functionalities', 'molestie nibh', 313, 25, '2021-07-04T16:54:06Z',
        '2021-02-26T05:13:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (581, 'transition wireless bandwidth', 'vel', 655, 16, '2021-09-02T05:15:52Z', '2020-10-01T03:55:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (582, 'aggregate customized partnerships', 'semper', 364, 84, '2021-01-22T20:49:41Z', '2020-11-03T08:47:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (583, 'disintermediate distributed models', 'luctus tincidunt', 30, 13, '2020-12-07T05:28:08Z',
        '2021-06-28T17:59:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (584, 'monetize robust convergence', 'ligula sit', 162, 71, '2021-01-26T03:08:19Z', '2021-04-26T15:41:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (585, 'iterate open-source technologies', 'erat tortor', 217, 49, '2021-10-24T19:12:29Z',
        '2021-01-25T14:20:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (586, 'enhance back-end communities', 'leo rhoncus', 142, 8, '2021-04-25T12:13:36Z', '2020-12-05T21:41:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (587, 'productize front-end markets', 'tortor', 696, 4, '2021-04-11T11:29:15Z', '2021-05-21T16:48:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (588, 'generate intuitive niches', 'ac lobortis', 12, 59, '2021-02-06T00:59:25Z', '2020-09-04T07:15:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (589, 'incentivize cross-media initiatives', 'pharetra', 940, 49, '2020-10-10T22:21:12Z',
        '2020-10-06T17:53:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (590, 'matrix vertical initiatives', 'quis', 113, 25, '2021-01-25T20:47:21Z', '2020-11-16T08:10:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (591, 'engineer clicks-and-mortar e-services', 'tincidunt', 286, 30, '2021-04-03T06:53:57Z',
        '2021-11-18T23:19:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (592, 'synthesize 24/365 relationships', 'sapien', 380, 66, '2021-07-23T03:06:38Z', '2020-12-04T06:21:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (593, 'optimize one-to-one convergence', 'nec', 249, 51, '2021-02-15T07:35:19Z', '2021-11-11T16:47:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (594, 'innovate dot-com infrastructures', 'rutrum rutrum', 872, 32, '2020-12-20T01:28:27Z',
        '2020-11-16T04:26:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (595, 'redefine integrated e-services', 'ante vel', 751, 57, '2021-07-12T20:58:00Z', '2020-11-09T18:51:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (596, 'implement world-class channels', 'mus vivamus', 418, 23, '2021-09-06T04:34:21Z', '2021-03-29T01:56:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (597, 'e-enable integrated markets', 'nibh quisque', 204, 50, '2021-01-16T20:22:10Z', '2021-01-26T10:47:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (598, 'streamline clicks-and-mortar niches', 'metus', 95, 30, '2021-07-25T20:06:12Z', '2021-01-31T05:40:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (599, 'productize back-end deliverables', 'sapien', 404, 13, '2021-10-19T06:38:07Z', '2021-10-21T10:38:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (600, 'incentivize impactful e-tailers', 'diam', 520, 4, '2021-05-13T16:18:18Z', '2021-03-14T07:08:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (601, 'maximize open-source synergies', 'aliquam convallis', 713, 54, '2020-11-29T09:41:01Z',
        '2020-11-07T23:27:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (602, 'embrace front-end experiences', 'erat fermentum', 137, 14, '2020-10-28T02:17:43Z',
        '2020-12-18T07:44:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (603, 'evolve real-time e-tailers', 'habitasse platea', 114, 44, '2020-12-16T06:53:08Z', '2020-12-11T11:51:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (604, 'incentivize integrated markets', 'aliquam sit', 782, 13, '2021-10-02T12:27:41Z', '2021-09-23T05:40:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (605, 'enable B2B platforms', 'semper porta', 886, 28, '2021-05-16T19:32:25Z', '2021-08-19T21:09:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (606, 'grow front-end functionalities', 'risus praesent', 803, 48, '2021-01-15T18:49:14Z',
        '2021-08-16T07:30:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (607, 'visualize bricks-and-clicks synergies', 'sit', 487, 77, '2021-09-19T08:40:29Z', '2021-07-27T05:53:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (608, 'engineer intuitive users', 'condimentum', 978, 45, '2021-04-14T08:29:45Z', '2021-06-11T02:35:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (609, 'aggregate transparent eyeballs', 'orci luctus', 648, 28, '2020-12-11T19:56:37Z', '2021-04-06T22:36:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (610, 'incentivize extensible e-markets', 'in hac', 534, 79, '2021-03-20T06:48:36Z', '2020-12-07T19:21:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (611, 'engineer value-added bandwidth', 'dui proin', 303, 71, '2021-08-04T09:26:50Z', '2020-12-21T20:38:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (612, 'evolve global deliverables', 'est', 115, 75, '2021-10-10T15:21:58Z', '2020-09-24T02:54:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (613, 'deliver sticky channels', 'consequat', 816, 40, '2020-10-29T13:44:33Z', '2021-02-05T00:42:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (614, 'drive granular content', 'tellus nulla', 216, 58, '2021-01-28T12:09:42Z', '2020-10-10T11:37:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (615, 'evolve next-generation solutions', 'enim', 794, 89, '2021-09-28T05:14:59Z', '2021-08-20T09:52:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (616, 'enable mission-critical infomediaries', 'quis turpis', 162, 42, '2021-09-15T13:00:22Z',
        '2021-03-18T03:42:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (617, 'target rich schemas', 'at velit', 744, 17, '2021-03-15T08:55:50Z', '2021-08-25T14:41:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (618, 'drive virtual e-commerce', 'purus', 928, 3, '2021-08-11T18:16:39Z', '2021-07-12T06:36:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (619, 'monetize virtual action-items', 'nisi', 708, 85, '2021-03-17T02:42:04Z', '2021-10-17T02:50:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (620, 'disintermediate synergistic metrics', 'faucibus', 127, 68, '2021-07-21T10:42:05Z',
        '2020-10-09T17:49:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (621, 'incentivize proactive paradigms', 'turpis', 407, 23, '2021-02-19T06:49:03Z', '2021-09-29T22:36:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (622, 'harness plug-and-play action-items', 'leo maecenas', 461, 53, '2020-10-31T17:08:17Z',
        '2020-09-05T10:24:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (623, 'evolve sticky partnerships', 'est', 907, 54, '2021-08-07T03:56:43Z', '2021-10-20T22:36:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (624, 'transform holistic web-readiness', 'mauris', 72, 81, '2021-05-05T23:30:35Z', '2021-02-27T11:14:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (625, 'seize bleeding-edge web-readiness', 'facilisi', 164, 78, '2021-10-06T00:28:48Z', '2021-03-06T17:03:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (626, 'synthesize rich platforms', 'in hac', 310, 49, '2020-12-15T11:05:10Z', '2020-12-18T07:39:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (627, 'scale killer applications', 'congue', 383, 23, '2021-05-01T21:53:48Z', '2020-11-06T01:02:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (628, 'monetize 24/7 users', 'sapien cursus', 166, 9, '2021-03-01T14:32:22Z', '2021-01-13T07:40:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (629, 'enable cutting-edge niches', 'tempus semper', 827, 65, '2021-10-03T10:36:16Z', '2020-09-15T15:44:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (630, 'syndicate plug-and-play markets', 'tellus', 978, 63, '2021-06-18T14:12:01Z', '2020-10-14T05:38:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (631, 'deploy compelling infomediaries', 'pede', 420, 66, '2020-09-23T21:19:44Z', '2021-08-19T10:27:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (632, 'utilize granular supply-chains', 'odio porttitor', 422, 90, '2021-05-15T19:10:13Z',
        '2021-01-27T21:59:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (633, 'exploit collaborative web-readiness', 'varius', 796, 23, '2021-08-04T02:36:08Z', '2021-09-27T02:27:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (634, 'reinvent wireless relationships', 'nulla', 19, 53, '2021-04-25T20:36:03Z', '2021-08-20T10:39:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (635, 'orchestrate wireless eyeballs', 'platea', 424, 40, '2021-04-04T07:17:26Z', '2020-09-10T10:09:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (636, 'streamline rich deliverables', 'tortor', 35, 30, '2021-11-08T02:08:35Z', '2021-05-14T17:54:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (637, 'transform intuitive relationships', 'volutpat in', 714, 50, '2021-07-09T12:32:11Z',
        '2021-09-01T23:22:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (638, 'harness interactive e-services', 'erat nulla', 694, 58, '2020-10-26T05:56:00Z', '2020-12-10T20:20:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (639, 'streamline compelling niches', 'non pretium', 866, 17, '2020-12-14T01:53:23Z', '2021-03-01T11:07:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (640, 'embrace sticky functionalities', 'suspendisse', 104, 4, '2021-01-01T17:30:37Z', '2021-07-03T00:03:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (641, 'leverage dot-com deliverables', 'tristique', 778, 43, '2021-03-16T14:17:38Z', '2021-03-13T23:49:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (642, 'deliver mission-critical platforms', 'etiam justo', 16, 50, '2021-02-23T05:58:30Z',
        '2020-10-15T08:44:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (643, 'architect frictionless applications', 'nulla', 751, 30, '2021-09-05T18:04:04Z', '2021-03-26T17:21:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (644, 'engage e-business interfaces', 'vivamus vel', 373, 28, '2020-11-12T07:25:14Z', '2021-04-13T07:23:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (645, 'mesh cross-media networks', 'vestibulum eget', 954, 18, '2021-08-03T16:43:52Z', '2020-09-07T13:40:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (646, 'architect robust initiatives', 'curabitur', 359, 71, '2020-09-27T15:01:03Z', '2021-05-31T04:14:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (647, 'reintermediate sticky web-readiness', 'pede', 119, 40, '2021-03-28T21:41:06Z', '2021-06-28T19:35:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (648, 'engage clicks-and-mortar metrics', 'hac', 6, 63, '2021-09-11T09:47:51Z', '2021-07-07T14:59:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (649, 'reintermediate vertical e-markets', 'blandit', 997, 61, '2021-06-16T17:12:52Z', '2021-11-04T03:44:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (650, 'envisioneer next-generation schemas', 'etiam', 256, 71, '2020-11-27T19:33:58Z', '2020-11-23T06:11:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (651, 'benchmark bleeding-edge technologies', 'enim', 86, 44, '2020-09-26T17:32:47Z', '2021-04-15T09:28:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (652, 'repurpose impactful supply-chains', 'nec sem', 196, 88, '2021-07-15T02:22:21Z', '2020-12-31T07:58:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (653, 'embrace integrated eyeballs', 'pharetra magna', 118, 11, '2021-10-29T21:10:37Z', '2021-01-01T07:21:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (654, 'repurpose customized deliverables', 'montes nascetur', 9, 16, '2020-11-18T00:24:59Z',
        '2021-03-04T22:40:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (655, 'incubate seamless vortals', 'purus', 807, 18, '2021-04-05T19:41:55Z', '2021-07-09T15:52:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (656, 'deliver value-added synergies', 'morbi', 849, 36, '2021-09-23T07:39:58Z', '2020-10-11T07:41:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (657, 'productize leading-edge web-readiness', 'ac diam', 661, 50, '2021-01-14T19:27:37Z',
        '2020-11-04T12:44:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (658, 'transition customized systems', 'dui luctus', 570, 82, '2021-05-12T03:51:46Z', '2020-10-24T15:36:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (659, 'implement revolutionary schemas', 'sit', 70, 63, '2021-07-27T17:18:57Z', '2021-08-20T02:16:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (660, 'e-enable visionary channels', 'convallis nunc', 119, 38, '2020-10-08T16:34:36Z', '2021-03-03T17:54:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (661, 'expedite B2C vortals', 'cras mi', 227, 8, '2021-04-09T17:11:50Z', '2020-12-04T16:16:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (662, 'generate impactful action-items', 'primis', 186, 70, '2021-02-02T14:27:41Z', '2021-02-07T05:06:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (663, 'brand sexy paradigms', 'vel nulla', 524, 30, '2021-01-05T04:43:49Z', '2021-04-30T02:58:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (664, 'synthesize sexy infomediaries', 'amet eros', 907, 75, '2021-07-25T12:21:55Z', '2021-09-14T08:55:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (665, 'incentivize next-generation bandwidth', 'sem', 383, 29, '2021-01-29T13:08:26Z', '2021-06-21T16:15:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (666, 'reintermediate visionary bandwidth', 'ante', 314, 2, '2021-10-14T17:33:09Z', '2021-01-11T07:48:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (667, 'expedite leading-edge metrics', 'libero', 540, 68, '2021-05-02T13:52:36Z', '2020-12-16T22:44:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (668, 'transition customized e-services', 'pede malesuada', 506, 27, '2020-09-13T04:45:32Z',
        '2021-10-07T03:38:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (669, 'generate leading-edge synergies', 'phasellus', 992, 19, '2021-09-13T03:12:23Z', '2021-06-01T18:31:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (670, 'empower user-centric bandwidth', 'curabitur at', 573, 70, '2021-01-08T01:13:14Z', '2020-09-28T01:50:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (671, 'empower front-end platforms', 'lectus', 50, 81, '2021-04-11T18:29:37Z', '2021-09-13T11:24:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (672, 'implement efficient functionalities', 'mi', 712, 29, '2021-07-09T15:40:41Z', '2021-01-27T09:23:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (673, 'embrace wireless web-readiness', 'quisque ut', 210, 44, '2021-10-17T18:24:35Z', '2020-10-21T06:49:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (674, 'seize visionary mindshare', 'habitasse platea', 581, 28, '2021-09-28T04:54:51Z', '2021-01-10T02:48:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (675, 'redefine e-business e-services', 'morbi', 499, 6, '2021-02-13T18:24:58Z', '2021-05-18T05:51:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (676, 'embrace efficient e-services', 'primis', 973, 18, '2020-09-08T15:41:37Z', '2021-06-10T03:12:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (677, 'exploit plug-and-play mindshare', 'sit amet', 244, 6, '2021-08-30T01:31:51Z', '2021-08-01T02:08:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (678, 'exploit dynamic relationships', 'in eleifend', 921, 7, '2021-10-25T01:17:55Z', '2021-11-09T19:45:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (679, 'envisioneer e-business methodologies', 'morbi sem', 86, 76, '2020-12-18T15:48:03Z',
        '2020-09-19T19:35:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (680, 'exploit bleeding-edge methodologies', 'tincidunt ante', 164, 27, '2020-09-30T22:09:47Z',
        '2021-02-04T21:00:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (681, 'engage clicks-and-mortar functionalities', 'aliquam', 916, 57, '2021-01-14T19:10:59Z',
        '2021-02-20T17:53:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (682, 'utilize best-of-breed web-readiness', 'nonummy', 49, 69, '2021-01-28T00:52:01Z', '2021-09-04T05:15:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (683, 'enhance impactful models', 'ut erat', 325, 71, '2021-11-14T16:01:01Z', '2021-10-21T08:12:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (684, 'integrate granular solutions', 'ornare', 302, 76, '2021-03-09T21:52:38Z', '2021-09-06T06:20:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (685, 'innovate granular communities', 'diam', 233, 14, '2021-01-01T04:09:33Z', '2021-06-06T17:55:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (686, 'deliver virtual initiatives', 'libero', 578, 72, '2021-05-27T04:19:59Z', '2021-02-22T01:05:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (687, 'expedite vertical portals', 'malesuada in', 902, 20, '2021-11-05T02:15:00Z', '2020-12-13T18:12:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (688, 'optimize bricks-and-clicks deliverables', 'hac', 821, 10, '2021-10-06T19:06:21Z', '2020-10-04T04:08:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (689, 'syndicate cutting-edge web services', 'dui', 105, 50, '2020-10-10T01:05:59Z', '2020-12-05T20:54:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (690, 'strategize B2B e-services', 'proin', 218, 85, '2021-11-21T18:26:59Z', '2021-11-06T12:22:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (691, 'matrix cross-platform supply-chains', 'eleifend', 326, 21, '2021-05-15T06:52:32Z',
        '2020-12-10T02:55:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (692, 'evolve back-end action-items', 'morbi quis', 851, 48, '2021-06-22T02:04:47Z', '2021-09-14T09:39:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (693, 'disintermediate B2B action-items', 'in', 718, 18, '2021-09-22T12:01:46Z', '2021-04-27T02:45:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (694, 'incentivize one-to-one communities', 'lobortis', 45, 70, '2021-07-04T14:04:22Z', '2021-01-04T21:36:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (695, 'matrix back-end e-business', 'placerat', 639, 79, '2021-07-07T17:44:17Z', '2021-06-04T08:24:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (696, 'architect one-to-one ROI', 'luctus', 238, 35, '2021-05-24T00:58:56Z', '2021-02-23T00:56:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (697, 'redefine web-enabled channels', 'dictumst morbi', 34, 44, '2020-09-10T19:50:21Z', '2021-07-17T00:54:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (698, 'brand wireless applications', 'justo', 334, 35, '2020-12-05T15:56:26Z', '2021-01-21T11:44:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (699, 'optimize collaborative content', 'diam nam', 853, 47, '2021-07-30T01:28:35Z', '2021-10-04T17:53:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (700, 'benchmark cross-platform experiences', 'quisque ut', 539, 6, '2021-08-11T23:10:29Z',
        '2021-05-28T21:25:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (701, 'implement sexy experiences', 'turpis', 425, 8, '2021-03-28T04:12:01Z', '2020-10-15T13:29:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (702, 'extend virtual users', 'in felis', 356, 71, '2021-05-31T01:05:37Z', '2020-12-08T04:00:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (703, 'orchestrate world-class web services', 'ut', 145, 52, '2021-06-20T20:30:14Z', '2020-12-12T03:23:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (704, 'reintermediate world-class web services', 'rhoncus', 759, 49, '2021-10-21T23:37:21Z',
        '2021-02-01T06:08:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (705, 'deliver B2C interfaces', 'et', 425, 15, '2021-02-21T02:23:24Z', '2021-03-20T12:02:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (706, 'grow killer infrastructures', 'purus phasellus', 645, 29, '2020-10-18T22:18:53Z', '2021-01-27T01:30:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (707, 'repurpose one-to-one experiences', 'sollicitudin vitae', 513, 2, '2020-12-29T22:01:56Z',
        '2020-10-06T07:14:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (708, 'synergize dynamic e-commerce', 'integer', 271, 87, '2020-10-03T03:15:16Z', '2021-07-18T07:25:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (709, 'facilitate robust supply-chains', 'ante nulla', 534, 83, '2021-04-05T16:52:17Z', '2020-11-22T19:47:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (710, 'integrate seamless portals', 'ultrices vel', 993, 6, '2021-02-04T02:55:12Z', '2021-09-17T11:24:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (711, 'embrace 24/365 supply-chains', 'venenatis', 121, 2, '2021-04-22T00:30:29Z', '2021-03-03T16:47:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (712, 'orchestrate clicks-and-mortar deliverables', 'et', 788, 47, '2021-08-16T06:44:34Z',
        '2020-11-09T16:25:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (713, 'e-enable plug-and-play platforms', 'scelerisque', 925, 38, '2021-08-04T00:59:20Z',
        '2021-10-05T00:54:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (714, 'synthesize global web-readiness', 'luctus rutrum', 468, 25, '2021-09-09T02:13:32Z',
        '2021-09-08T04:27:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (715, 'streamline front-end mindshare', 'gravida nisi', 407, 71, '2021-10-01T03:42:59Z', '2021-10-10T03:50:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (716, 'engineer visionary e-business', 'arcu', 666, 8, '2020-10-14T14:19:34Z', '2021-03-07T16:12:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (717, 'optimize sexy communities', 'morbi quis', 398, 30, '2020-12-10T07:38:27Z', '2021-02-02T12:45:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (718, 'orchestrate rich experiences', 'condimentum id', 824, 28, '2021-11-18T06:27:18Z', '2021-01-02T03:11:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (719, 'drive e-business users', 'vel enim', 570, 62, '2021-08-19T21:58:40Z', '2021-06-07T10:24:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (720, 'harness granular solutions', 'purus', 497, 15, '2021-02-21T05:46:18Z', '2021-04-01T03:09:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (721, 'target end-to-end action-items', 'amet', 144, 44, '2020-10-08T12:24:48Z', '2020-11-16T23:41:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (722, 'repurpose next-generation interfaces', 'accumsan felis', 582, 3, '2021-05-10T17:34:33Z',
        '2021-07-02T05:21:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (723, 'engineer seamless initiatives', 'congue risus', 935, 18, '2021-08-17T13:27:22Z', '2020-09-04T15:02:31Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (724, 'repurpose clicks-and-mortar models', 'quam pharetra', 836, 69, '2020-09-12T07:41:08Z',
        '2021-05-19T03:23:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (725, 'optimize strategic portals', 'mauris', 830, 46, '2020-12-06T17:52:43Z', '2021-11-23T07:05:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (726, 'utilize e-business markets', 'curae mauris', 330, 76, '2021-01-23T22:43:29Z', '2021-09-09T18:11:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (727, 'visualize leading-edge channels', 'non interdum', 701, 59, '2021-06-22T21:24:21Z',
        '2020-09-20T01:43:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (728, 'harness robust infomediaries', 'fusce consequat', 879, 40, '2020-12-24T18:21:34Z',
        '2021-03-05T04:02:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (729, 'aggregate back-end metrics', 'luctus cum', 22, 50, '2021-11-09T19:38:51Z', '2021-04-19T02:01:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (730, 'harness cross-platform synergies', 'cum', 696, 35, '2020-09-23T17:39:20Z', '2020-09-17T15:44:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (731, 'e-enable compelling portals', 'suspendisse', 359, 15, '2021-03-29T21:48:43Z', '2020-11-04T23:02:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (732, 'scale front-end e-services', 'quis', 766, 28, '2021-01-17T09:57:14Z', '2021-05-28T07:36:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (733, 'cultivate compelling portals', 'eu felis', 159, 69, '2020-10-21T06:40:43Z', '2021-10-03T10:21:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (734, 'orchestrate rich methodologies', 'ac leo', 626, 2, '2020-12-03T17:41:10Z', '2021-08-22T01:28:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (735, 'engage bleeding-edge models', 'ipsum dolor', 194, 62, '2021-03-18T10:27:44Z', '2021-01-31T22:50:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (736, 'scale bleeding-edge communities', 'arcu sed', 687, 66, '2021-03-19T12:46:56Z', '2020-11-13T08:51:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (737, 'disintermediate one-to-one supply-chains', 'a pede', 334, 79, '2021-02-21T16:31:06Z',
        '2020-12-13T07:44:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (738, 'deploy user-centric web services', 'convallis', 44, 77, '2021-02-23T12:53:00Z', '2021-04-17T18:48:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (739, 'transform compelling networks', 'erat', 87, 31, '2021-11-02T21:42:05Z', '2020-11-16T12:07:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (740, 'grow value-added deliverables', 'maecenas leo', 68, 73, '2020-11-18T11:24:10Z', '2021-10-30T00:24:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (741, 'transition e-business methodologies', 'at', 848, 22, '2021-03-19T16:06:04Z', '2021-11-01T09:08:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (742, 'innovate end-to-end interfaces', 'lobortis convallis', 303, 80, '2020-09-05T02:18:33Z',
        '2021-04-30T10:24:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (743, 'e-enable robust partnerships', 'arcu libero', 354, 9, '2020-11-11T14:25:16Z', '2021-02-12T11:25:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (744, 'grow next-generation web services', 'molestie sed', 99, 73, '2021-05-05T23:52:24Z',
        '2021-04-05T02:12:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (745, 'whiteboard front-end infrastructures', 'porttitor', 610, 75, '2020-11-02T02:26:45Z',
        '2020-11-28T06:04:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (746, 'reinvent B2C e-markets', 'cras pellentesque', 864, 73, '2021-07-29T10:30:42Z', '2021-09-20T01:05:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (747, 'matrix proactive functionalities', 'sem mauris', 522, 63, '2021-01-09T22:54:58Z', '2021-09-24T06:50:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (748, 'matrix magnetic vortals', 'sollicitudin ut', 250, 62, '2021-05-28T06:22:11Z', '2021-07-29T22:51:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (749, 'incubate clicks-and-mortar models', 'in lectus', 651, 61, '2021-07-11T22:28:05Z', '2021-09-13T03:21:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (750, 'reinvent dynamic action-items', 'fusce', 310, 72, '2021-07-12T04:54:17Z', '2021-10-14T12:59:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (751, 'scale cross-platform ROI', 'sit', 773, 70, '2021-07-01T10:58:57Z', '2021-06-26T07:01:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (752, 'matrix one-to-one applications', 'sit amet', 120, 50, '2021-10-14T18:47:36Z', '2020-11-12T15:44:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (753, 'monetize rich infrastructures', 'ac nulla', 62, 47, '2020-10-03T21:14:23Z', '2021-07-16T10:40:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (754, 'harness frictionless content', 'at', 288, 42, '2021-07-25T05:36:39Z', '2021-01-11T02:36:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (755, 'unleash B2C convergence', 'interdum', 50, 50, '2021-07-08T06:57:40Z', '2021-08-03T01:56:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (756, 'utilize web-enabled experiences', 'tortor quis', 421, 34, '2021-06-26T14:25:54Z', '2021-09-09T05:17:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (757, 'enhance revolutionary markets', 'dapibus augue', 923, 25, '2021-09-03T04:00:18Z', '2020-12-06T09:02:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (758, 'unleash granular action-items', 'nonummy maecenas', 942, 29, '2020-10-13T13:05:51Z',
        '2021-08-21T07:42:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (759, 'brand front-end communities', 'non mattis', 449, 67, '2020-11-23T03:07:37Z', '2020-09-29T12:27:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (760, 'seize strategic web services', 'velit', 48, 86, '2020-11-27T01:05:40Z', '2021-01-11T23:18:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (761, 'evolve revolutionary initiatives', 'dictumst', 777, 70, '2021-06-05T19:09:45Z', '2021-05-09T23:22:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (762, 'repurpose virtual supply-chains', 'ac leo', 244, 11, '2021-04-14T09:06:11Z', '2021-04-13T16:02:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (763, 'productize enterprise markets', 'id', 531, 79, '2020-10-23T15:11:47Z', '2021-03-21T11:01:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (764, 'integrate rich markets', 'lorem', 971, 80, '2021-06-12T09:32:50Z', '2020-09-20T22:49:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (765, 'transform 24/7 channels', 'viverra', 896, 8, '2021-06-20T19:36:26Z', '2021-07-22T05:48:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (766, 'evolve viral technologies', 'integer ac', 339, 27, '2021-05-11T11:13:45Z', '2021-10-03T03:48:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (767, 'iterate efficient functionalities', 'morbi', 428, 30, '2020-09-15T22:22:51Z', '2020-12-04T10:55:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (768, 'e-enable killer technologies', 'nonummy integer', 140, 22, '2021-11-23T00:31:32Z',
        '2021-06-16T00:46:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (769, 'productize seamless systems', 'sit amet', 223, 51, '2020-10-18T10:35:18Z', '2021-08-29T04:39:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (770, 'exploit open-source supply-chains', 'arcu', 566, 7, '2020-10-01T00:18:01Z', '2021-03-23T16:46:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (771, 'orchestrate plug-and-play vortals', 'venenatis lacinia', 602, 4, '2020-09-29T21:55:16Z',
        '2021-11-04T11:15:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (772, 'target e-business networks', 'quisque', 884, 89, '2021-04-06T01:53:43Z', '2020-12-03T10:53:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (773, 'enhance frictionless partnerships', 'tincidunt lacus', 214, 6, '2021-07-02T12:18:56Z',
        '2021-05-07T19:23:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (774, 'disintermediate bleeding-edge metrics', 'congue vivamus', 125, 46, '2021-03-12T13:25:47Z',
        '2021-03-21T15:37:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (775, 'whiteboard global web-readiness', 'pede malesuada', 542, 70, '2021-07-29T03:22:30Z',
        '2020-10-03T07:28:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (776, 'engineer plug-and-play synergies', 'auctor gravida', 326, 43, '2020-11-28T00:17:12Z',
        '2020-11-19T12:16:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (777, 'target user-centric communities', 'hac', 835, 7, '2021-06-12T07:27:03Z', '2020-11-27T10:23:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (778, 'transform sexy e-tailers', 'hac', 592, 46, '2021-04-23T00:12:18Z', '2021-03-03T18:30:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (779, 'optimize leading-edge systems', 'molestie sed', 394, 19, '2021-08-16T05:39:06Z', '2021-01-11T02:50:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (780, 'architect synergistic content', 'nullam', 491, 81, '2021-03-05T06:49:33Z', '2021-11-10T04:59:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (781, 'scale killer e-commerce', 'ullamcorper purus', 504, 36, '2021-03-09T17:19:41Z', '2020-12-18T06:12:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (782, 'visualize wireless deliverables', 'lorem quisque', 52, 36, '2021-03-21T23:10:07Z',
        '2021-01-21T08:41:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (783, 'incubate B2C convergence', 'varius integer', 687, 68, '2021-09-18T02:51:57Z', '2021-07-13T12:54:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (784, 'extend cross-platform metrics', 'vel pede', 831, 4, '2020-12-26T02:47:03Z', '2021-07-13T12:12:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (785, 'unleash out-of-the-box e-commerce', 'sagittis', 593, 24, '2021-07-27T23:52:35Z', '2021-11-08T12:00:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (786, 'integrate magnetic technologies', 'sociis', 897, 5, '2020-10-31T02:29:34Z', '2021-09-28T17:49:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (787, 'benchmark sticky portals', 'non', 4, 28, '2021-03-29T02:51:26Z', '2021-08-08T22:55:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (788, 'expedite innovative action-items', 'sit amet', 550, 85, '2020-11-10T16:38:44Z', '2020-09-07T03:46:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (789, 'benchmark dynamic niches', 'erat', 256, 10, '2021-08-15T11:50:10Z', '2021-03-24T03:48:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (790, 'matrix real-time niches', 'placerat', 975, 90, '2021-06-04T19:30:41Z', '2021-02-23T02:09:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (791, 'drive out-of-the-box functionalities', 'at dolor', 873, 4, '2021-03-23T01:10:40Z',
        '2021-06-01T17:07:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (792, 'reintermediate customized paradigms', 'eu pede', 331, 65, '2021-05-07T19:51:14Z', '2021-02-23T19:12:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (793, 'extend viral deliverables', 'congue elementum', 116, 79, '2021-06-03T20:26:24Z', '2021-07-24T17:58:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (794, 'empower intuitive e-services', 'justo', 470, 20, '2021-01-24T23:03:45Z', '2021-11-15T09:57:42Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (795, 'utilize synergistic platforms', 'congue', 655, 14, '2021-08-20T17:25:56Z', '2021-03-05T09:35:37Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (796, 'architect 24/7 e-services', 'id', 285, 10, '2020-09-23T19:10:25Z', '2020-12-06T08:48:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (797, 'engage sexy markets', 'nisi volutpat', 37, 23, '2021-07-12T15:33:11Z', '2020-10-05T07:34:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (798, 'benchmark front-end niches', 'magna ac', 554, 54, '2021-02-05T22:41:25Z', '2021-10-18T14:07:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (799, 'integrate best-of-breed content', 'curabitur', 351, 68, '2021-02-18T01:46:10Z', '2021-03-26T22:22:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (800, 'integrate one-to-one solutions', 'primis', 942, 32, '2020-09-03T13:14:00Z', '2021-07-20T03:11:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (801, 'mesh bricks-and-clicks channels', 'quam pharetra', 664, 82, '2021-06-03T06:13:55Z',
        '2020-11-06T18:54:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (802, 'repurpose real-time niches', 'aliquam sit', 762, 76, '2021-01-19T07:51:36Z', '2021-01-18T23:30:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (803, 'repurpose visionary deliverables', 'consequat', 746, 66, '2021-04-22T08:26:48Z', '2021-11-22T20:35:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (804, 'transition e-business users', 'pellentesque ultrices', 861, 1, '2021-02-13T05:10:37Z',
        '2021-02-07T00:41:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (805, 'incentivize virtual supply-chains', 'ac', 298, 69, '2020-11-23T04:11:08Z', '2021-04-16T09:32:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (806, 'incentivize cross-media methodologies', 'tincidunt', 659, 58, '2021-06-13T07:28:58Z',
        '2021-10-20T11:10:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (807, 'redefine plug-and-play e-tailers', 'maecenas leo', 95, 83, '2021-11-08T21:11:38Z',
        '2021-07-31T07:40:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (808, 'integrate cross-media applications', 'eu tincidunt', 805, 85, '2021-08-24T03:20:03Z',
        '2021-08-29T21:13:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (809, 'enhance bricks-and-clicks markets', 'sapien', 684, 12, '2020-11-19T00:28:58Z', '2021-04-15T03:03:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (810, 'architect integrated relationships', 'lobortis est', 491, 33, '2021-01-01T22:50:55Z',
        '2021-07-15T21:43:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (811, 'evolve plug-and-play technologies', 'fusce lacus', 816, 33, '2021-03-20T01:48:55Z',
        '2021-05-06T09:45:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (812, 'scale bleeding-edge metrics', 'sapien', 51, 42, '2021-08-25T19:47:39Z', '2021-04-23T19:00:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (813, 'repurpose user-centric platforms', 'sed', 202, 6, '2020-11-23T23:12:48Z', '2021-03-15T15:16:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (814, 'e-enable user-centric portals', 'dolor sit', 383, 6, '2021-03-17T12:07:13Z', '2021-08-13T14:23:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (815, 'engineer impactful interfaces', 'aenean', 887, 18, '2021-05-02T18:32:04Z', '2021-01-21T23:40:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (816, 'scale value-added niches', 'nisi', 427, 82, '2021-08-20T10:32:15Z', '2021-03-16T11:42:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (817, 'transition bleeding-edge users', 'quis', 785, 78, '2021-02-03T01:19:20Z', '2021-07-17T11:38:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (818, 'transform end-to-end applications', 'in', 44, 34, '2020-10-22T18:09:41Z', '2021-08-22T03:44:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (819, 'e-enable integrated interfaces', 'porta volutpat', 206, 73, '2021-10-02T04:44:08Z',
        '2021-10-25T01:04:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (820, 'mesh B2C methodologies', 'interdum mauris', 813, 87, '2020-09-06T03:41:38Z', '2021-08-11T03:38:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (821, 'embrace transparent schemas', 'ridiculus mus', 266, 68, '2021-09-16T16:12:11Z', '2021-10-25T12:52:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (822, 'transition customized action-items', 'donec posuere', 480, 10, '2021-09-30T16:02:49Z',
        '2021-06-06T05:25:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (823, 'streamline B2B initiatives', 'id', 197, 39, '2021-03-01T23:03:11Z', '2021-08-12T15:53:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (824, 'visualize cross-media systems', 'amet eros', 830, 36, '2021-07-08T08:21:57Z', '2021-07-04T08:56:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (825, 'maximize out-of-the-box eyeballs', 'vitae', 285, 42, '2021-05-18T12:52:42Z', '2021-06-19T20:38:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (826, 'scale best-of-breed functionalities', 'penatibus', 286, 12, '2021-02-01T01:35:15Z',
        '2020-09-30T15:11:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (827, 'leverage seamless portals', 'interdum', 520, 22, '2021-06-05T02:13:08Z', '2021-06-08T03:50:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (828, 'implement 24/365 e-services', 'mauris morbi', 407, 73, '2021-05-03T10:45:51Z', '2020-11-06T23:52:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (829, 'extend front-end schemas', 'proin leo', 855, 76, '2020-09-21T09:10:58Z', '2021-01-09T15:00:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (830, 'empower distributed e-commerce', 'at', 660, 85, '2021-05-28T20:42:57Z', '2020-10-19T08:06:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (831, 'empower world-class supply-chains', 'suspendisse', 794, 19, '2020-11-20T14:06:45Z',
        '2021-08-20T22:35:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (832, 'productize value-added supply-chains', 'congue diam', 32, 58, '2020-09-16T20:30:30Z',
        '2021-09-01T09:35:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (833, 'innovate scalable deliverables', 'nec', 511, 16, '2020-09-04T04:59:00Z', '2020-11-21T21:10:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (834, 'visualize B2C vortals', 'nulla suspendisse', 642, 67, '2021-10-22T15:08:24Z', '2020-10-07T16:28:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (835, 'whiteboard open-source bandwidth', 'ac', 927, 88, '2021-07-14T22:47:16Z', '2020-09-20T00:56:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (836, 'grow efficient experiences', 'est', 942, 14, '2021-04-05T17:58:26Z', '2020-10-05T12:00:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (837, 'synthesize best-of-breed supply-chains', 'rhoncus dui', 570, 54, '2020-09-20T03:47:06Z',
        '2020-10-20T08:41:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (838, 'deploy open-source relationships', 'nunc', 555, 16, '2021-06-14T06:34:45Z', '2021-09-26T16:35:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (839, 'monetize magnetic eyeballs', 'ante', 469, 55, '2020-12-13T23:14:42Z', '2021-03-19T01:04:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (840, 'deploy front-end e-commerce', 'vel est', 179, 82, '2020-12-28T20:47:24Z', '2021-11-16T03:04:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (841, 'brand proactive infomediaries', 'sollicitudin mi', 778, 41, '2020-09-10T17:32:10Z',
        '2021-02-18T16:54:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (842, 'deliver dynamic ROI', 'quis', 519, 48, '2020-09-23T00:46:49Z', '2021-03-16T13:02:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (843, 'engage virtual e-services', 'nec nisi', 432, 90, '2021-04-13T09:38:51Z', '2021-01-30T14:31:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (844, 'seize plug-and-play networks', 'in', 437, 45, '2020-09-27T23:07:29Z', '2021-02-03T22:49:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (845, 'drive user-centric action-items', 'integer', 433, 84, '2021-02-18T03:43:01Z', '2021-03-16T11:22:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (846, 'envisioneer ubiquitous markets', 'augue luctus', 329, 81, '2020-10-10T18:47:52Z', '2020-11-11T20:41:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (847, 'evolve web-enabled schemas', 'a', 81, 65, '2021-08-28T14:15:58Z', '2021-04-02T06:14:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (848, 'morph transparent e-business', 'amet justo', 723, 32, '2021-01-12T20:58:31Z', '2021-07-14T21:18:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (849, 'reintermediate plug-and-play architectures', 'vestibulum rutrum', 803, 54, '2021-04-10T19:48:23Z',
        '2020-10-15T18:50:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (850, 'brand ubiquitous content', 'nulla', 333, 48, '2021-02-28T08:49:47Z', '2020-09-11T05:02:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (851, 'harness synergistic e-services', 'ut at', 525, 30, '2021-02-21T18:28:13Z', '2021-05-11T02:51:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (852, 'enable robust deliverables', 'lectus', 806, 17, '2021-05-21T08:22:31Z', '2021-10-09T14:19:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (853, 'cultivate strategic functionalities', 'sagittis dui', 386, 43, '2021-06-23T14:07:40Z',
        '2021-04-02T09:18:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (854, 'generate scalable e-commerce', 'nisi', 294, 33, '2021-03-08T07:40:07Z', '2021-03-17T12:43:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (855, 'evolve transparent channels', 'neque', 899, 1, '2021-08-09T15:53:29Z', '2021-11-16T04:44:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (856, 'scale dynamic communities', 'sed', 301, 8, '2021-06-05T03:14:33Z', '2021-11-18T09:43:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (857, 'envisioneer value-added deliverables', 'nulla', 972, 44, '2020-12-19T02:06:32Z', '2021-10-11T12:35:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (858, 'engineer robust methodologies', 'ipsum primis', 129, 51, '2021-08-25T10:47:30Z', '2021-04-05T09:27:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (859, 'benchmark cutting-edge metrics', 'ligula sit', 530, 86, '2020-10-19T17:23:18Z', '2020-10-13T11:56:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (860, 'cultivate magnetic functionalities', 'pulvinar', 358, 82, '2021-05-19T18:23:37Z', '2021-06-27T03:54:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (861, 'architect B2C infomediaries', 'vestibulum', 293, 81, '2021-08-07T00:55:37Z', '2021-07-30T09:46:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (862, 'optimize 24/7 e-services', 'nulla', 78, 62, '2021-06-21T11:18:02Z', '2021-06-17T14:13:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (863, 'streamline robust convergence', 'eget vulputate', 542, 54, '2020-11-02T13:25:52Z',
        '2021-08-21T08:29:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (864, 'engineer end-to-end platforms', 'aliquam quis', 998, 13, '2020-09-27T04:34:53Z', '2020-11-26T10:06:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (865, 'enable B2C methodologies', 'maecenas tincidunt', 900, 54, '2021-03-03T21:59:30Z', '2021-01-09T15:10:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (866, 'target back-end niches', 'sit amet', 120, 56, '2021-08-18T07:10:33Z', '2021-05-17T19:18:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (867, 'unleash frictionless systems', 'vulputate', 254, 37, '2020-10-10T13:46:24Z', '2021-05-18T03:00:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (868, 'cultivate dynamic e-markets', 'nulla', 900, 24, '2020-12-12T03:48:50Z', '2021-07-22T01:49:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (869, 'grow one-to-one communities', 'semper', 85, 80, '2021-11-10T15:49:43Z', '2021-11-17T13:19:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (870, 'revolutionize compelling technologies', 'vel nisl', 393, 12, '2021-04-16T16:49:22Z',
        '2020-10-02T01:36:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (871, 'scale bleeding-edge web services', 'integer pede', 721, 4, '2021-01-25T07:09:27Z',
        '2021-05-18T18:06:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (872, 'leverage enterprise partnerships', 'aliquet pulvinar', 838, 64, '2021-10-08T03:33:03Z',
        '2021-03-07T16:44:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (873, 'incentivize transparent infomediaries', 'orci', 115, 73, '2021-07-11T15:02:50Z', '2021-11-01T16:45:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (874, 'drive revolutionary synergies', 'ante ipsum', 771, 31, '2020-10-06T09:53:05Z', '2021-06-01T02:39:13Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (875, 'redefine 24/365 models', 'sit', 827, 14, '2021-08-29T08:33:11Z', '2021-04-14T00:05:47Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (876, 'brand viral technologies', 'purus phasellus', 20, 81, '2020-12-28T09:29:17Z', '2021-04-15T14:25:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (877, 'empower open-source schemas', 'sed tristique', 771, 29, '2021-01-05T06:13:29Z', '2021-04-14T12:04:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (878, 'visualize innovative systems', 'magna bibendum', 162, 1, '2021-02-09T01:33:37Z', '2021-06-07T13:06:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (879, 'leverage leading-edge interfaces', 'montes nascetur', 479, 74, '2020-10-15T16:54:51Z',
        '2021-03-21T12:15:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (880, 'evolve user-centric technologies', 'eleifend quam', 864, 26, '2021-10-03T01:20:21Z',
        '2021-11-15T17:14:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (881, 'synergize frictionless platforms', 'fusce consequat', 596, 75, '2021-05-05T11:44:44Z',
        '2021-07-26T02:45:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (882, 'redefine 24/7 e-commerce', 'quis orci', 325, 75, '2021-04-06T10:35:02Z', '2021-07-27T20:12:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (883, 'architect efficient methodologies', 'tortor', 282, 26, '2021-08-14T21:35:25Z', '2021-08-20T00:41:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (884, 'utilize scalable content', 'quis turpis', 277, 22, '2021-10-21T20:55:37Z', '2021-02-04T09:35:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (885, 'integrate world-class initiatives', 'vestibulum', 282, 72, '2020-11-20T23:23:17Z',
        '2021-04-01T07:46:04Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (886, 'deploy global e-business', 'tristique', 828, 26, '2021-05-03T09:06:22Z', '2021-02-15T12:46:02Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (887, 'enhance granular schemas', 'vulputate', 552, 12, '2021-04-09T18:27:47Z', '2020-12-14T22:12:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (888, 'brand bleeding-edge interfaces', 'ut blandit', 369, 23, '2021-07-06T12:44:32Z', '2021-02-24T16:18:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (889, 'envisioneer end-to-end e-markets', 'erat', 829, 9, '2021-07-13T13:28:58Z', '2020-10-19T21:05:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (890, 'target killer deliverables', 'etiam', 257, 66, '2021-02-18T22:55:44Z', '2020-09-01T01:54:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (891, 'enhance strategic action-items', 'morbi', 396, 26, '2020-12-23T17:54:23Z', '2021-09-23T08:32:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (892, 'enable innovative niches', 'euismod', 415, 41, '2021-09-02T18:02:34Z', '2021-07-18T00:46:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (893, 'iterate extensible infomediaries', 'pede', 935, 70, '2021-11-22T19:08:41Z', '2021-10-20T01:34:12Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (894, 'engineer B2C applications', 'a nibh', 713, 34, '2021-01-12T23:09:57Z', '2021-03-16T14:02:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (895, 'incentivize visionary systems', 'magna', 878, 67, '2021-09-30T06:47:31Z', '2020-09-25T11:55:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (896, 'e-enable strategic web services', 'turpis', 557, 33, '2021-02-25T00:58:06Z', '2021-02-27T16:10:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (897, 'incubate innovative systems', 'sit amet', 702, 12, '2021-04-16T15:10:04Z', '2021-10-05T14:12:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (898, 'exploit turn-key systems', 'cras mi', 553, 19, '2020-12-04T20:21:22Z', '2021-04-06T09:38:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (899, 'reinvent cutting-edge platforms', 'suspendisse accumsan', 22, 9, '2021-02-03T07:50:28Z',
        '2021-09-09T01:17:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (900, 'streamline plug-and-play e-business', 'duis', 398, 77, '2021-02-01T08:39:06Z', '2021-05-20T07:18:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (901, 'iterate granular deliverables', 'ante', 249, 74, '2021-11-07T16:39:15Z', '2020-09-27T00:05:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (902, 'matrix e-business applications', 'accumsan', 503, 14, '2021-06-24T06:11:11Z', '2020-10-09T04:34:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (903, 'cultivate B2B deliverables', 'sed', 726, 5, '2020-10-15T13:17:53Z', '2021-06-24T00:23:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (904, 'unleash magnetic mindshare', 'ridiculus', 393, 16, '2021-10-26T01:46:56Z', '2021-01-04T00:07:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (905, 'disintermediate mission-critical relationships', 'etiam pretium', 475, 70, '2021-04-07T11:08:36Z',
        '2021-03-30T14:38:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (906, 'seize virtual metrics', 'metus sapien', 925, 28, '2021-01-22T08:40:40Z', '2021-04-01T18:56:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (907, 'implement killer infrastructures', 'mi in', 186, 43, '2021-09-18T08:34:05Z', '2021-07-17T15:21:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (908, 'architect next-generation infrastructures', 'diam', 528, 17, '2021-07-22T08:34:27Z',
        '2021-07-12T21:00:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (909, 'seize magnetic communities', 'nec', 901, 85, '2021-10-31T14:00:50Z', '2021-05-27T22:35:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (910, 'recontextualize killer web services', 'nibh', 753, 44, '2020-11-15T21:10:27Z', '2021-09-29T11:21:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (911, 'integrate value-added deliverables', 'posuere', 642, 73, '2021-09-03T00:59:39Z', '2021-09-26T16:30:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (912, 'streamline 24/365 functionalities', 'amet', 639, 85, '2021-02-15T12:44:36Z', '2021-03-30T23:30:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (913, 'e-enable user-centric networks', 'duis', 478, 47, '2021-09-28T05:46:41Z', '2021-11-13T09:35:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (914, 'streamline distributed functionalities', 'amet sem', 889, 38, '2021-11-04T19:12:34Z',
        '2020-10-25T08:17:10Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (915, 'redefine innovative markets', 'vel', 515, 84, '2020-09-12T23:03:38Z', '2021-01-03T10:21:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (916, 'facilitate cross-media schemas', 'bibendum morbi', 573, 48, '2021-08-17T18:46:29Z',
        '2021-09-10T20:35:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (917, 'leverage synergistic content', 'massa id', 108, 35, '2021-05-28T02:38:21Z', '2021-09-08T06:07:03Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (918, 'synthesize intuitive action-items', 'feugiat et', 167, 31, '2021-08-10T03:38:00Z',
        '2021-06-01T04:08:00Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (919, 'extend out-of-the-box platforms', 'dapibus at', 242, 77, '2021-10-08T08:08:23Z', '2021-06-22T01:43:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (920, 'integrate extensible solutions', 'eu sapien', 513, 26, '2021-07-15T12:29:44Z', '2020-12-19T22:54:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (921, 'strategize cutting-edge deliverables', 'viverra', 662, 56, '2021-09-14T18:35:36Z',
        '2020-11-06T04:17:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (922, 'facilitate customized methodologies', 'sapien', 988, 51, '2021-05-21T00:00:59Z', '2021-08-08T14:41:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (923, 'aggregate collaborative vortals', 'commodo vulputate', 435, 18, '2021-05-02T18:20:26Z',
        '2021-01-09T09:46:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (924, 'generate end-to-end niches', 'vestibulum', 986, 53, '2021-07-09T10:22:05Z', '2020-12-22T18:24:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (925, 'generate vertical e-services', 'luctus ultricies', 563, 23, '2021-09-17T17:03:34Z',
        '2021-08-21T15:31:05Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (926, 'grow impactful applications', 'et', 941, 79, '2021-01-08T08:21:03Z', '2021-11-15T21:55:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (927, 'productize sticky portals', 'magna at', 701, 83, '2021-10-09T17:39:20Z', '2021-04-04T12:41:29Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (928, 'unleash customized partnerships', 'in congue', 385, 34, '2021-04-13T02:28:06Z', '2021-04-13T07:53:07Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (929, 'strategize distributed communities', 'tempus', 301, 88, '2020-11-04T11:32:08Z', '2021-10-08T08:26:15Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (930, 'drive proactive supply-chains', 'pede', 653, 86, '2021-10-07T15:54:41Z', '2021-03-14T06:11:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (931, 'evolve virtual technologies', 'pretium', 457, 18, '2021-06-22T00:14:46Z', '2021-06-28T06:47:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (932, 'deploy magnetic architectures', 'eleifend pede', 683, 40, '2021-06-02T14:03:50Z', '2021-10-13T18:09:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (933, 'enable turn-key web services', 'vivamus', 342, 49, '2021-03-11T19:25:52Z', '2021-07-09T08:34:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (934, 'iterate bleeding-edge metrics', 'pulvinar nulla', 354, 19, '2021-03-11T18:39:27Z',
        '2021-04-08T23:17:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (935, 'leverage mission-critical deliverables', 'in', 723, 45, '2020-12-24T17:52:42Z', '2021-02-23T05:08:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (936, 'exploit integrated paradigms', 'luctus rutrum', 116, 43, '2021-07-01T18:02:59Z', '2021-07-25T17:08:35Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (937, 'innovate bleeding-edge communities', 'purus eu', 395, 28, '2021-03-25T05:43:35Z', '2021-01-21T05:22:50Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (938, 'synergize value-added eyeballs', 'quam turpis', 692, 29, '2021-06-12T02:51:03Z', '2021-04-27T21:31:26Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (939, 'benchmark interactive initiatives', 'nulla eget', 221, 49, '2020-11-23T03:45:10Z',
        '2021-10-06T04:48:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (940, 'integrate one-to-one e-services', 'vivamus vestibulum', 552, 66, '2021-02-20T08:40:12Z',
        '2021-11-10T01:24:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (941, 'scale mission-critical channels', 'ante', 833, 3, '2021-09-03T07:14:20Z', '2021-01-18T01:15:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (942, 'generate sexy channels', 'elit', 743, 84, '2021-11-09T02:46:44Z', '2021-01-19T06:23:30Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (943, 'redefine revolutionary channels', 'curabitur', 552, 37, '2021-05-23T15:48:39Z', '2020-09-08T14:27:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (944, 'unleash dynamic metrics', 'cras non', 480, 13, '2021-06-25T15:09:14Z', '2021-04-29T23:22:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (945, 'matrix clicks-and-mortar deliverables', 'aliquam erat', 412, 86, '2020-12-15T06:06:34Z',
        '2021-03-30T03:07:21Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (946, 'syndicate B2B e-services', 'nunc purus', 88, 39, '2021-06-19T19:05:28Z', '2021-03-23T11:02:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (947, 'target customized eyeballs', 'elit proin', 465, 31, '2020-12-28T15:16:15Z', '2020-09-02T02:31:39Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (948, 'maximize leading-edge architectures', 'vulputate', 569, 43, '2021-06-29T07:08:30Z',
        '2021-01-29T11:48:43Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (949, 'transform open-source web-readiness', 'cursus urna', 555, 89, '2021-03-05T06:57:31Z',
        '2021-01-12T06:19:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (950, 'exploit e-business users', 'nisi volutpat', 888, 57, '2021-03-29T15:24:54Z', '2020-09-24T09:05:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (951, 'target mission-critical bandwidth', 'luctus et', 209, 1, '2021-03-02T19:24:39Z', '2021-01-14T13:03:19Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (952, 'facilitate bricks-and-clicks networks', 'magna vestibulum', 85, 43, '2021-02-09T17:26:14Z',
        '2021-02-08T03:47:09Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (953, 'mesh cross-media portals', 'iaculis', 651, 81, '2020-09-02T04:48:57Z', '2021-03-30T06:45:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (954, 'redefine magnetic relationships', 'in tempus', 974, 9, '2020-12-19T16:29:40Z', '2021-05-11T20:30:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (955, 'revolutionize synergistic infomediaries', 'fusce congue', 980, 65, '2020-09-21T17:29:48Z',
        '2021-01-29T15:25:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (956, 'innovate vertical architectures', 'sapien non', 881, 38, '2021-08-01T08:57:56Z', '2020-11-21T23:52:16Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (957, 'mesh customized mindshare', 'eu', 758, 87, '2020-12-08T22:00:58Z', '2021-01-28T06:35:58Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (958, 'enable out-of-the-box methodologies', 'consequat lectus', 386, 81, '2021-01-14T09:14:56Z',
        '2021-01-16T11:29:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (959, 'drive front-end infrastructures', 'augue quam', 49, 82, '2020-11-09T23:33:44Z', '2020-12-07T16:18:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (960, 'transform efficient infrastructures', 'id nulla', 868, 52, '2021-01-31T16:06:26Z',
        '2021-05-15T17:23:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (961, 'repurpose virtual experiences', 'pede', 762, 51, '2021-02-05T01:06:44Z', '2021-06-23T10:24:32Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (962, 'reintermediate web-enabled systems', 'faucibus', 377, 65, '2021-09-30T03:30:54Z', '2021-02-05T10:30:46Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (963, 'streamline vertical schemas', 'et ultrices', 243, 79, '2020-09-10T04:32:57Z', '2021-01-22T19:56:28Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (964, 'morph dot-com markets', 'condimentum', 389, 23, '2020-10-15T14:20:16Z', '2021-05-07T06:27:20Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (965, 'streamline granular technologies', 'dictumst aliquam', 389, 40, '2021-09-09T12:34:03Z',
        '2021-03-17T15:32:41Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (966, 'repurpose virtual niches', 'habitasse platea', 101, 79, '2021-05-22T03:49:03Z', '2020-11-18T06:49:33Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (967, 'orchestrate robust metrics', 'placerat praesent', 489, 87, '2021-09-29T03:09:07Z',
        '2020-12-29T12:26:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (968, 'facilitate back-end supply-chains', 'vestibulum sagittis', 285, 29, '2021-10-22T12:53:23Z',
        '2020-09-16T11:25:59Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (969, 'morph killer supply-chains', 'vel enim', 562, 24, '2021-08-01T16:53:11Z', '2021-11-14T18:39:38Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (970, 'embrace dot-com channels', 'venenatis', 380, 84, '2021-05-27T01:09:07Z', '2020-09-04T11:04:54Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (971, 'optimize bleeding-edge e-tailers', 'eu tincidunt', 984, 56, '2021-03-21T08:26:30Z',
        '2021-04-18T12:46:57Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (972, 'optimize end-to-end networks', 'a pede', 256, 13, '2021-04-15T06:58:33Z', '2021-04-09T05:20:53Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (973, 'evolve 24/365 interfaces', 'nisi', 112, 55, '2021-04-17T02:33:06Z', '2020-09-27T01:17:34Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (974, 'architect distributed channels', 'tortor quis', 376, 42, '2021-03-30T10:35:26Z', '2021-08-04T03:41:36Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (975, 'visualize e-business infomediaries', 'enim', 109, 68, '2020-10-14T02:10:35Z', '2021-08-21T20:28:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (976, 'reintermediate 24/7 portals', 'eros', 944, 88, '2021-10-25T11:50:31Z', '2021-05-10T02:41:27Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (977, 'monetize cutting-edge systems', 'non pretium', 616, 71, '2021-04-01T18:07:47Z', '2020-10-06T07:29:17Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (978, 'enable distributed markets', 'convallis', 97, 40, '2021-01-23T22:18:28Z', '2021-09-24T11:14:24Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (979, 'productize innovative vortals', 'tincidunt', 570, 41, '2020-11-01T06:49:01Z', '2021-04-25T00:50:14Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (980, 'harness cross-media channels', 'suscipit', 46, 10, '2021-10-30T13:44:28Z', '2021-10-07T15:11:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (981, 'recontextualize extensible deliverables', 'neque vestibulum', 569, 76, '2021-09-18T15:15:38Z',
        '2021-01-07T03:28:22Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (982, 'implement mission-critical convergence', 'justo morbi', 414, 5, '2021-03-25T05:10:18Z',
        '2021-08-19T11:04:01Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (983, 'empower cutting-edge content', 'morbi', 965, 55, '2021-10-28T23:19:22Z', '2021-11-02T16:45:08Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (984, 'e-enable extensible e-markets', 'platea dictumst', 232, 5, '2021-05-19T06:56:13Z',
        '2021-02-22T22:41:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (985, 'e-enable efficient web services', 'praesent blandit', 825, 65, '2020-10-10T20:27:02Z',
        '2020-12-19T20:55:18Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (986, 'implement magnetic methodologies', 'lorem', 394, 85, '2021-01-20T20:47:42Z', '2021-07-08T07:03:25Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (987, 'iterate magnetic platforms', 'eget eleifend', 892, 20, '2021-03-12T15:43:40Z', '2021-10-16T03:42:56Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (988, 'cultivate back-end applications', 'semper porta', 515, 78, '2021-03-01T22:32:21Z',
        '2021-10-09T21:03:55Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (989, 'orchestrate out-of-the-box solutions', 'phasellus id', 195, 90, '2021-03-12T14:02:01Z',
        '2021-03-29T13:25:48Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (990, 'innovate holistic architectures', 'lacinia nisi', 696, 49, '2021-10-03T14:08:12Z',
        '2021-11-23T05:05:40Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (991, 'incubate distributed partnerships', 'est lacinia', 849, 87, '2021-10-13T00:01:41Z',
        '2020-09-26T21:10:44Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (992, 'evolve dot-com functionalities', 'leo', 281, 57, '2021-09-08T17:35:58Z', '2020-10-30T19:10:45Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (993, 'strategize dot-com partnerships', 'in faucibus', 669, 41, '2021-08-16T13:13:05Z', '2020-09-01T22:58:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (994, 'innovate customized platforms', 'donec', 971, 85, '2021-03-31T10:29:41Z', '2021-09-19T11:12:23Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (995, 'grow ubiquitous schemas', 'velit eu', 896, 4, '2020-11-12T12:24:24Z', '2020-11-19T22:28:11Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (996, 'visualize cutting-edge content', 'mi pede', 340, 68, '2021-02-23T04:41:20Z', '2021-01-03T17:27:49Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (997, 'transition compelling e-markets', 'ac', 466, 30, '2021-03-12T00:17:25Z', '2021-06-10T14:01:52Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (998, 'empower frictionless e-tailers', 'felis', 817, 20, '2021-01-10T05:33:17Z', '2020-09-13T22:09:51Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (999, 'scale out-of-the-box niches', 'nisi', 267, 30, '2021-11-20T19:37:50Z', '2021-11-20T05:33:06Z');
insert into certificates (id, description, name, price, duration, create_date, last_update_date)
values (1000, 'deploy scalable e-commerce', 'semper rutrum', 847, 66, '2020-10-15T00:38:26Z', '2021-07-31T10:18:48Z');



insert into certificate_tag (tag_id, certificate_id)
values (908, 987);
insert into certificate_tag (tag_id, certificate_id)
values (118, 847);
insert into certificate_tag (tag_id, certificate_id)
values (764, 783);
insert into certificate_tag (tag_id, certificate_id)
values (483, 664);
insert into certificate_tag (tag_id, certificate_id)
values (282, 310);
insert into certificate_tag (tag_id, certificate_id)
values (638, 800);
insert into certificate_tag (tag_id, certificate_id)
values (571, 605);
insert into certificate_tag (tag_id, certificate_id)
values (559, 816);
insert into certificate_tag (tag_id, certificate_id)
values (207, 246);
insert into certificate_tag (tag_id, certificate_id)
values (56, 372);
insert into certificate_tag (tag_id, certificate_id)
values (484, 220);
insert into certificate_tag (tag_id, certificate_id)
values (979, 726);
insert into certificate_tag (tag_id, certificate_id)
values (565, 702);
insert into certificate_tag (tag_id, certificate_id)
values (204, 441);
insert into certificate_tag (tag_id, certificate_id)
values (311, 87);
insert into certificate_tag (tag_id, certificate_id)
values (86, 166);
insert into certificate_tag (tag_id, certificate_id)
values (191, 323);
insert into certificate_tag (tag_id, certificate_id)
values (214, 413);
insert into certificate_tag (tag_id, certificate_id)
values (303, 725);
insert into certificate_tag (tag_id, certificate_id)
values (141, 310);
insert into certificate_tag (tag_id, certificate_id)
values (875, 730);
insert into certificate_tag (tag_id, certificate_id)
values (134, 165);
insert into certificate_tag (tag_id, certificate_id)
values (224, 935);
insert into certificate_tag (tag_id, certificate_id)
values (866, 752);
insert into certificate_tag (tag_id, certificate_id)
values (478, 240);
insert into certificate_tag (tag_id, certificate_id)
values (548, 998);
insert into certificate_tag (tag_id, certificate_id)
values (930, 685);
insert into certificate_tag (tag_id, certificate_id)
values (149, 877);
insert into certificate_tag (tag_id, certificate_id)
values (535, 595);
insert into certificate_tag (tag_id, certificate_id)
values (814, 779);
insert into certificate_tag (tag_id, certificate_id)
values (542, 124);
insert into certificate_tag (tag_id, certificate_id)
values (246, 292);
insert into certificate_tag (tag_id, certificate_id)
values (45, 796);
insert into certificate_tag (tag_id, certificate_id)
values (1, 227);
insert into certificate_tag (tag_id, certificate_id)
values (476, 103);
insert into certificate_tag (tag_id, certificate_id)
values (829, 378);
insert into certificate_tag (tag_id, certificate_id)
values (986, 811);
insert into certificate_tag (tag_id, certificate_id)
values (941, 523);
insert into certificate_tag (tag_id, certificate_id)
values (101, 451);
insert into certificate_tag (tag_id, certificate_id)
values (981, 7);
insert into certificate_tag (tag_id, certificate_id)
values (908, 272);
insert into certificate_tag (tag_id, certificate_id)
values (725, 628);
insert into certificate_tag (tag_id, certificate_id)
values (1, 885);
insert into certificate_tag (tag_id, certificate_id)
values (212, 271);
insert into certificate_tag (tag_id, certificate_id)
values (217, 846);
insert into certificate_tag (tag_id, certificate_id)
values (510, 11);
insert into certificate_tag (tag_id, certificate_id)
values (974, 622);
insert into certificate_tag (tag_id, certificate_id)
values (91, 611);
insert into certificate_tag (tag_id, certificate_id)
values (465, 990);
insert into certificate_tag (tag_id, certificate_id)
values (84, 372);
insert into certificate_tag (tag_id, certificate_id)
values (93, 194);
insert into certificate_tag (tag_id, certificate_id)
values (916, 253);
insert into certificate_tag (tag_id, certificate_id)
values (294, 863);
insert into certificate_tag (tag_id, certificate_id)
values (460, 347);
insert into certificate_tag (tag_id, certificate_id)
values (167, 272);
insert into certificate_tag (tag_id, certificate_id)
values (680, 571);
insert into certificate_tag (tag_id, certificate_id)
values (486, 113);
insert into certificate_tag (tag_id, certificate_id)
values (150, 535);
insert into certificate_tag (tag_id, certificate_id)
values (983, 797);
insert into certificate_tag (tag_id, certificate_id)
values (592, 546);
insert into certificate_tag (tag_id, certificate_id)
values (514, 197);
insert into certificate_tag (tag_id, certificate_id)
values (79, 689);
insert into certificate_tag (tag_id, certificate_id)
values (628, 155);
insert into certificate_tag (tag_id, certificate_id)
values (947, 512);
insert into certificate_tag (tag_id, certificate_id)
values (471, 379);
insert into certificate_tag (tag_id, certificate_id)
values (355, 649);
insert into certificate_tag (tag_id, certificate_id)
values (557, 798);
insert into certificate_tag (tag_id, certificate_id)
values (220, 348);
insert into certificate_tag (tag_id, certificate_id)
values (676, 596);
insert into certificate_tag (tag_id, certificate_id)
values (868, 89);
insert into certificate_tag (tag_id, certificate_id)
values (42, 631);
insert into certificate_tag (tag_id, certificate_id)
values (585, 30);
insert into certificate_tag (tag_id, certificate_id)
values (189, 140);
insert into certificate_tag (tag_id, certificate_id)
values (377, 691);
insert into certificate_tag (tag_id, certificate_id)
values (451, 913);
insert into certificate_tag (tag_id, certificate_id)
values (33, 933);
insert into certificate_tag (tag_id, certificate_id)
values (856, 967);
insert into certificate_tag (tag_id, certificate_id)
values (894, 308);
insert into certificate_tag (tag_id, certificate_id)
values (20, 106);
insert into certificate_tag (tag_id, certificate_id)
values (682, 795);
insert into certificate_tag (tag_id, certificate_id)
values (290, 98);
insert into certificate_tag (tag_id, certificate_id)
values (417, 18);
insert into certificate_tag (tag_id, certificate_id)
values (683, 527);
insert into certificate_tag (tag_id, certificate_id)
values (622, 103);
insert into certificate_tag (tag_id, certificate_id)
values (68, 506);
insert into certificate_tag (tag_id, certificate_id)
values (940, 228);
insert into certificate_tag (tag_id, certificate_id)
values (386, 295);
insert into certificate_tag (tag_id, certificate_id)
values (184, 609);
insert into certificate_tag (tag_id, certificate_id)
values (546, 521);
insert into certificate_tag (tag_id, certificate_id)
values (403, 116);
insert into certificate_tag (tag_id, certificate_id)
values (763, 707);
insert into certificate_tag (tag_id, certificate_id)
values (963, 325);
insert into certificate_tag (tag_id, certificate_id)
values (22, 130);
insert into certificate_tag (tag_id, certificate_id)
values (517, 541);
insert into certificate_tag (tag_id, certificate_id)
values (798, 421);
insert into certificate_tag (tag_id, certificate_id)
values (266, 149);
insert into certificate_tag (tag_id, certificate_id)
values (625, 112);
insert into certificate_tag (tag_id, certificate_id)
values (908, 778);
insert into certificate_tag (tag_id, certificate_id)
values (226, 939);
insert into certificate_tag (tag_id, certificate_id)
values (763, 818);
insert into certificate_tag (tag_id, certificate_id)
values (297, 583);
insert into certificate_tag (tag_id, certificate_id)
values (165, 552);
insert into certificate_tag (tag_id, certificate_id)
values (788, 869);
insert into certificate_tag (tag_id, certificate_id)
values (642, 273);
insert into certificate_tag (tag_id, certificate_id)
values (677, 222);
insert into certificate_tag (tag_id, certificate_id)
values (496, 53);
insert into certificate_tag (tag_id, certificate_id)
values (297, 926);
insert into certificate_tag (tag_id, certificate_id)
values (943, 89);
insert into certificate_tag (tag_id, certificate_id)
values (692, 612);
insert into certificate_tag (tag_id, certificate_id)
values (708, 898);
insert into certificate_tag (tag_id, certificate_id)
values (317, 743);
insert into certificate_tag (tag_id, certificate_id)
values (650, 132);
insert into certificate_tag (tag_id, certificate_id)
values (565, 555);
insert into certificate_tag (tag_id, certificate_id)
values (816, 713);
insert into certificate_tag (tag_id, certificate_id)
values (122, 52);
insert into certificate_tag (tag_id, certificate_id)
values (86, 935);
insert into certificate_tag (tag_id, certificate_id)
values (191, 35);
insert into certificate_tag (tag_id, certificate_id)
values (176, 180);
insert into certificate_tag (tag_id, certificate_id)
values (5, 750);
insert into certificate_tag (tag_id, certificate_id)
values (188, 769);
insert into certificate_tag (tag_id, certificate_id)
values (466, 268);
insert into certificate_tag (tag_id, certificate_id)
values (512, 375);
insert into certificate_tag (tag_id, certificate_id)
values (163, 81);
insert into certificate_tag (tag_id, certificate_id)
values (465, 754);
insert into certificate_tag (tag_id, certificate_id)
values (521, 852);
insert into certificate_tag (tag_id, certificate_id)
values (346, 486);
insert into certificate_tag (tag_id, certificate_id)
values (357, 54);
insert into certificate_tag (tag_id, certificate_id)
values (972, 483);
insert into certificate_tag (tag_id, certificate_id)
values (19, 497);
insert into certificate_tag (tag_id, certificate_id)
values (714, 781);
insert into certificate_tag (tag_id, certificate_id)
values (919, 139);
insert into certificate_tag (tag_id, certificate_id)
values (827, 911);
insert into certificate_tag (tag_id, certificate_id)
values (557, 631);
insert into certificate_tag (tag_id, certificate_id)
values (303, 978);
insert into certificate_tag (tag_id, certificate_id)
values (960, 848);
insert into certificate_tag (tag_id, certificate_id)
values (424, 344);
insert into certificate_tag (tag_id, certificate_id)
values (406, 243);
insert into certificate_tag (tag_id, certificate_id)
values (702, 880);
insert into certificate_tag (tag_id, certificate_id)
values (152, 948);
insert into certificate_tag (tag_id, certificate_id)
values (821, 83);
insert into certificate_tag (tag_id, certificate_id)
values (489, 643);
insert into certificate_tag (tag_id, certificate_id)
values (173, 197);
insert into certificate_tag (tag_id, certificate_id)
values (695, 780);
insert into certificate_tag (tag_id, certificate_id)
values (961, 182);
insert into certificate_tag (tag_id, certificate_id)
values (944, 73);
insert into certificate_tag (tag_id, certificate_id)
values (153, 572);
insert into certificate_tag (tag_id, certificate_id)
values (565, 31);
insert into certificate_tag (tag_id, certificate_id)
values (280, 814);
insert into certificate_tag (tag_id, certificate_id)
values (313, 517);
insert into certificate_tag (tag_id, certificate_id)
values (804, 356);
insert into certificate_tag (tag_id, certificate_id)
values (94, 346);
insert into certificate_tag (tag_id, certificate_id)
values (596, 745);
insert into certificate_tag (tag_id, certificate_id)
values (901, 34);
insert into certificate_tag (tag_id, certificate_id)
values (505, 987);
insert into certificate_tag (tag_id, certificate_id)
values (940, 413);
insert into certificate_tag (tag_id, certificate_id)
values (314, 496);
insert into certificate_tag (tag_id, certificate_id)
values (540, 749);
insert into certificate_tag (tag_id, certificate_id)
values (142, 620);
insert into certificate_tag (tag_id, certificate_id)
values (406, 533);
insert into certificate_tag (tag_id, certificate_id)
values (928, 899);
insert into certificate_tag (tag_id, certificate_id)
values (962, 669);
insert into certificate_tag (tag_id, certificate_id)
values (524, 289);
insert into certificate_tag (tag_id, certificate_id)
values (992, 138);
insert into certificate_tag (tag_id, certificate_id)
values (284, 591);
insert into certificate_tag (tag_id, certificate_id)
values (541, 227);
insert into certificate_tag (tag_id, certificate_id)
values (780, 553);
insert into certificate_tag (tag_id, certificate_id)
values (935, 618);
insert into certificate_tag (tag_id, certificate_id)
values (906, 149);
insert into certificate_tag (tag_id, certificate_id)
values (946, 978);
insert into certificate_tag (tag_id, certificate_id)
values (728, 687);
insert into certificate_tag (tag_id, certificate_id)
values (989, 427);
insert into certificate_tag (tag_id, certificate_id)
values (862, 941);
insert into certificate_tag (tag_id, certificate_id)
values (777, 401);
insert into certificate_tag (tag_id, certificate_id)
values (68, 27);
insert into certificate_tag (tag_id, certificate_id)
values (315, 362);
insert into certificate_tag (tag_id, certificate_id)
values (420, 580);
insert into certificate_tag (tag_id, certificate_id)
values (110, 626);
insert into certificate_tag (tag_id, certificate_id)
values (295, 732);
insert into certificate_tag (tag_id, certificate_id)
values (606, 528);
insert into certificate_tag (tag_id, certificate_id)
values (799, 173);
insert into certificate_tag (tag_id, certificate_id)
values (718, 910);
insert into certificate_tag (tag_id, certificate_id)
values (27, 638);
insert into certificate_tag (tag_id, certificate_id)
values (269, 110);
insert into certificate_tag (tag_id, certificate_id)
values (429, 407);
insert into certificate_tag (tag_id, certificate_id)
values (767, 471);
insert into certificate_tag (tag_id, certificate_id)
values (2, 230);
insert into certificate_tag (tag_id, certificate_id)
values (605, 160);
insert into certificate_tag (tag_id, certificate_id)
values (433, 506);
insert into certificate_tag (tag_id, certificate_id)
values (492, 706);
insert into certificate_tag (tag_id, certificate_id)
values (493, 224);
insert into certificate_tag (tag_id, certificate_id)
values (427, 186);
insert into certificate_tag (tag_id, certificate_id)
values (445, 117);
insert into certificate_tag (tag_id, certificate_id)
values (245, 73);
insert into certificate_tag (tag_id, certificate_id)
values (422, 281);
insert into certificate_tag (tag_id, certificate_id)
values (179, 710);
insert into certificate_tag (tag_id, certificate_id)
values (711, 179);
insert into certificate_tag (tag_id, certificate_id)
values (529, 375);
insert into certificate_tag (tag_id, certificate_id)
values (65, 658);
insert into certificate_tag (tag_id, certificate_id)
values (252, 836);
insert into certificate_tag (tag_id, certificate_id)
values (517, 292);
insert into certificate_tag (tag_id, certificate_id)
values (185, 633);
insert into certificate_tag (tag_id, certificate_id)
values (211, 137);
insert into certificate_tag (tag_id, certificate_id)
values (851, 423);
insert into certificate_tag (tag_id, certificate_id)
values (84, 661);
insert into certificate_tag (tag_id, certificate_id)
values (331, 185);
insert into certificate_tag (tag_id, certificate_id)
values (992, 346);
insert into certificate_tag (tag_id, certificate_id)
values (549, 738);
insert into certificate_tag (tag_id, certificate_id)
values (31, 645);
insert into certificate_tag (tag_id, certificate_id)
values (168, 125);
insert into certificate_tag (tag_id, certificate_id)
values (555, 697);
insert into certificate_tag (tag_id, certificate_id)
values (562, 310);
insert into certificate_tag (tag_id, certificate_id)
values (329, 91);
insert into certificate_tag (tag_id, certificate_id)
values (75, 393);
insert into certificate_tag (tag_id, certificate_id)
values (947, 108);
insert into certificate_tag (tag_id, certificate_id)
values (544, 201);
insert into certificate_tag (tag_id, certificate_id)
values (237, 312);
insert into certificate_tag (tag_id, certificate_id)
values (459, 144);
insert into certificate_tag (tag_id, certificate_id)
values (163, 102);
insert into certificate_tag (tag_id, certificate_id)
values (990, 289);
insert into certificate_tag (tag_id, certificate_id)
values (129, 730);
insert into certificate_tag (tag_id, certificate_id)
values (783, 400);
insert into certificate_tag (tag_id, certificate_id)
values (830, 167);
insert into certificate_tag (tag_id, certificate_id)
values (306, 199);
insert into certificate_tag (tag_id, certificate_id)
values (92, 121);
insert into certificate_tag (tag_id, certificate_id)
values (686, 970);
insert into certificate_tag (tag_id, certificate_id)
values (316, 74);
insert into certificate_tag (tag_id, certificate_id)
values (322, 351);
insert into certificate_tag (tag_id, certificate_id)
values (613, 149);
insert into certificate_tag (tag_id, certificate_id)
values (523, 644);
insert into certificate_tag (tag_id, certificate_id)
values (387, 857);
insert into certificate_tag (tag_id, certificate_id)
values (968, 822);
insert into certificate_tag (tag_id, certificate_id)
values (73, 307);
insert into certificate_tag (tag_id, certificate_id)
values (935, 342);
insert into certificate_tag (tag_id, certificate_id)
values (567, 301);
insert into certificate_tag (tag_id, certificate_id)
values (947, 877);
insert into certificate_tag (tag_id, certificate_id)
values (987, 486);
insert into certificate_tag (tag_id, certificate_id)
values (753, 197);
insert into certificate_tag (tag_id, certificate_id)
values (495, 624);
insert into certificate_tag (tag_id, certificate_id)
values (521, 707);
insert into certificate_tag (tag_id, certificate_id)
values (265, 450);
insert into certificate_tag (tag_id, certificate_id)
values (505, 205);
insert into certificate_tag (tag_id, certificate_id)
values (772, 637);
insert into certificate_tag (tag_id, certificate_id)
values (663, 326);
insert into certificate_tag (tag_id, certificate_id)
values (236, 997);
insert into certificate_tag (tag_id, certificate_id)
values (798, 304);
insert into certificate_tag (tag_id, certificate_id)
values (854, 494);
insert into certificate_tag (tag_id, certificate_id)
values (231, 909);
insert into certificate_tag (tag_id, certificate_id)
values (978, 592);
insert into certificate_tag (tag_id, certificate_id)
values (862, 568);
insert into certificate_tag (tag_id, certificate_id)
values (332, 222);
insert into certificate_tag (tag_id, certificate_id)
values (804, 19);
insert into certificate_tag (tag_id, certificate_id)
values (5, 235);
insert into certificate_tag (tag_id, certificate_id)
values (910, 886);
insert into certificate_tag (tag_id, certificate_id)
values (954, 881);
insert into certificate_tag (tag_id, certificate_id)
values (97, 295);
insert into certificate_tag (tag_id, certificate_id)
values (353, 187);
insert into certificate_tag (tag_id, certificate_id)
values (811, 118);
insert into certificate_tag (tag_id, certificate_id)
values (338, 87);
insert into certificate_tag (tag_id, certificate_id)
values (595, 341);
insert into certificate_tag (tag_id, certificate_id)
values (876, 249);
insert into certificate_tag (tag_id, certificate_id)
values (750, 961);
insert into certificate_tag (tag_id, certificate_id)
values (733, 416);
insert into certificate_tag (tag_id, certificate_id)
values (332, 315);
insert into certificate_tag (tag_id, certificate_id)
values (55, 817);
insert into certificate_tag (tag_id, certificate_id)
values (3, 775);
insert into certificate_tag (tag_id, certificate_id)
values (362, 988);
insert into certificate_tag (tag_id, certificate_id)
values (130, 531);
insert into certificate_tag (tag_id, certificate_id)
values (95, 233);
insert into certificate_tag (tag_id, certificate_id)
values (42, 185);
insert into certificate_tag (tag_id, certificate_id)
values (252, 890);
insert into certificate_tag (tag_id, certificate_id)
values (394, 834);
insert into certificate_tag (tag_id, certificate_id)
values (521, 872);
insert into certificate_tag (tag_id, certificate_id)
values (914, 205);
insert into certificate_tag (tag_id, certificate_id)
values (205, 705);
insert into certificate_tag (tag_id, certificate_id)
values (97, 110);
insert into certificate_tag (tag_id, certificate_id)
values (801, 631);
insert into certificate_tag (tag_id, certificate_id)
values (254, 88);
insert into certificate_tag (tag_id, certificate_id)
values (585, 279);
insert into certificate_tag (tag_id, certificate_id)
values (557, 723);
insert into certificate_tag (tag_id, certificate_id)
values (891, 424);
insert into certificate_tag (tag_id, certificate_id)
values (63, 32);
insert into certificate_tag (tag_id, certificate_id)
values (214, 957);
insert into certificate_tag (tag_id, certificate_id)
values (393, 677);
insert into certificate_tag (tag_id, certificate_id)
values (809, 44);
insert into certificate_tag (tag_id, certificate_id)
values (330, 976);
insert into certificate_tag (tag_id, certificate_id)
values (561, 27);
insert into certificate_tag (tag_id, certificate_id)
values (870, 77);
insert into certificate_tag (tag_id, certificate_id)
values (567, 277);
insert into certificate_tag (tag_id, certificate_id)
values (422, 520);
insert into certificate_tag (tag_id, certificate_id)
values (21, 648);
insert into certificate_tag (tag_id, certificate_id)
values (423, 284);
insert into certificate_tag (tag_id, certificate_id)
values (727, 998);
insert into certificate_tag (tag_id, certificate_id)
values (134, 544);
insert into certificate_tag (tag_id, certificate_id)
values (386, 827);
insert into certificate_tag (tag_id, certificate_id)
values (849, 509);
insert into certificate_tag (tag_id, certificate_id)
values (311, 817);
insert into certificate_tag (tag_id, certificate_id)
values (45, 315);
insert into certificate_tag (tag_id, certificate_id)
values (180, 530);
insert into certificate_tag (tag_id, certificate_id)
values (946, 770);
insert into certificate_tag (tag_id, certificate_id)
values (624, 153);
insert into certificate_tag (tag_id, certificate_id)
values (874, 520);
insert into certificate_tag (tag_id, certificate_id)
values (467, 19);
insert into certificate_tag (tag_id, certificate_id)
values (264, 838);
insert into certificate_tag (tag_id, certificate_id)
values (228, 225);
insert into certificate_tag (tag_id, certificate_id)
values (910, 90);
insert into certificate_tag (tag_id, certificate_id)
values (727, 192);
insert into certificate_tag (tag_id, certificate_id)
values (623, 487);
insert into certificate_tag (tag_id, certificate_id)
values (931, 490);
insert into certificate_tag (tag_id, certificate_id)
values (821, 609);
insert into certificate_tag (tag_id, certificate_id)
values (247, 151);
insert into certificate_tag (tag_id, certificate_id)
values (333, 749);
insert into certificate_tag (tag_id, certificate_id)
values (292, 204);
insert into certificate_tag (tag_id, certificate_id)
values (94, 156);
insert into certificate_tag (tag_id, certificate_id)
values (966, 330);
insert into certificate_tag (tag_id, certificate_id)
values (351, 288);
insert into certificate_tag (tag_id, certificate_id)
values (170, 948);
insert into certificate_tag (tag_id, certificate_id)
values (557, 506);
insert into certificate_tag (tag_id, certificate_id)
values (679, 634);
insert into certificate_tag (tag_id, certificate_id)
values (791, 664);
insert into certificate_tag (tag_id, certificate_id)
values (731, 236);
insert into certificate_tag (tag_id, certificate_id)
values (750, 384);
insert into certificate_tag (tag_id, certificate_id)
values (401, 753);
insert into certificate_tag (tag_id, certificate_id)
values (327, 871);
insert into certificate_tag (tag_id, certificate_id)
values (200, 13);
insert into certificate_tag (tag_id, certificate_id)
values (7, 359);
insert into certificate_tag (tag_id, certificate_id)
values (461, 310);
insert into certificate_tag (tag_id, certificate_id)
values (997, 673);
insert into certificate_tag (tag_id, certificate_id)
values (976, 319);
insert into certificate_tag (tag_id, certificate_id)
values (628, 632);
insert into certificate_tag (tag_id, certificate_id)
values (836, 877);
insert into certificate_tag (tag_id, certificate_id)
values (235, 237);
insert into certificate_tag (tag_id, certificate_id)
values (979, 718);
insert into certificate_tag (tag_id, certificate_id)
values (76, 242);
insert into certificate_tag (tag_id, certificate_id)
values (362, 136);
insert into certificate_tag (tag_id, certificate_id)
values (570, 478);
insert into certificate_tag (tag_id, certificate_id)
values (358, 100);
insert into certificate_tag (tag_id, certificate_id)
values (817, 335);
insert into certificate_tag (tag_id, certificate_id)
values (647, 57);
insert into certificate_tag (tag_id, certificate_id)
values (433, 849);
insert into certificate_tag (tag_id, certificate_id)
values (954, 455);
insert into certificate_tag (tag_id, certificate_id)
values (136, 415);
insert into certificate_tag (tag_id, certificate_id)
values (156, 737);
insert into certificate_tag (tag_id, certificate_id)
values (758, 430);
insert into certificate_tag (tag_id, certificate_id)
values (353, 201);
insert into certificate_tag (tag_id, certificate_id)
values (302, 216);
insert into certificate_tag (tag_id, certificate_id)
values (927, 552);
insert into certificate_tag (tag_id, certificate_id)
values (320, 689);
insert into certificate_tag (tag_id, certificate_id)
values (849, 359);
insert into certificate_tag (tag_id, certificate_id)
values (703, 41);
insert into certificate_tag (tag_id, certificate_id)
values (786, 296);
insert into certificate_tag (tag_id, certificate_id)
values (782, 615);
insert into certificate_tag (tag_id, certificate_id)
values (451, 419);
insert into certificate_tag (tag_id, certificate_id)
values (997, 753);
insert into certificate_tag (tag_id, certificate_id)
values (848, 195);
insert into certificate_tag (tag_id, certificate_id)
values (200, 555);
insert into certificate_tag (tag_id, certificate_id)
values (587, 9);
insert into certificate_tag (tag_id, certificate_id)
values (298, 720);
insert into certificate_tag (tag_id, certificate_id)
values (516, 160);
insert into certificate_tag (tag_id, certificate_id)
values (960, 110);
insert into certificate_tag (tag_id, certificate_id)
values (500, 640);
insert into certificate_tag (tag_id, certificate_id)
values (476, 235);
insert into certificate_tag (tag_id, certificate_id)
values (363, 697);
insert into certificate_tag (tag_id, certificate_id)
values (356, 135);
insert into certificate_tag (tag_id, certificate_id)
values (523, 133);
insert into certificate_tag (tag_id, certificate_id)
values (892, 674);
insert into certificate_tag (tag_id, certificate_id)
values (985, 268);
insert into certificate_tag (tag_id, certificate_id)
values (911, 586);
insert into certificate_tag (tag_id, certificate_id)
values (786, 929);
insert into certificate_tag (tag_id, certificate_id)
values (874, 278);
insert into certificate_tag (tag_id, certificate_id)
values (599, 15);
insert into certificate_tag (tag_id, certificate_id)
values (936, 54);
insert into certificate_tag (tag_id, certificate_id)
values (4, 964);
insert into certificate_tag (tag_id, certificate_id)
values (648, 800);
insert into certificate_tag (tag_id, certificate_id)
values (834, 855);
insert into certificate_tag (tag_id, certificate_id)
values (425, 154);
insert into certificate_tag (tag_id, certificate_id)
values (618, 113);
insert into certificate_tag (tag_id, certificate_id)
values (789, 528);
insert into certificate_tag (tag_id, certificate_id)
values (136, 104);
insert into certificate_tag (tag_id, certificate_id)
values (960, 496);
insert into certificate_tag (tag_id, certificate_id)
values (598, 776);
insert into certificate_tag (tag_id, certificate_id)
values (221, 467);
insert into certificate_tag (tag_id, certificate_id)
values (48, 5);
insert into certificate_tag (tag_id, certificate_id)
values (636, 783);
insert into certificate_tag (tag_id, certificate_id)
values (648, 698);
insert into certificate_tag (tag_id, certificate_id)
values (122, 14);
insert into certificate_tag (tag_id, certificate_id)
values (67, 170);
insert into certificate_tag (tag_id, certificate_id)
values (924, 55);
insert into certificate_tag (tag_id, certificate_id)
values (34, 549);
insert into certificate_tag (tag_id, certificate_id)
values (883, 381);
insert into certificate_tag (tag_id, certificate_id)
values (854, 962);
insert into certificate_tag (tag_id, certificate_id)
values (721, 41);
insert into certificate_tag (tag_id, certificate_id)
values (515, 284);
insert into certificate_tag (tag_id, certificate_id)
values (584, 412);
insert into certificate_tag (tag_id, certificate_id)
values (356, 6);
insert into certificate_tag (tag_id, certificate_id)
values (559, 826);
insert into certificate_tag (tag_id, certificate_id)
values (219, 77);
insert into certificate_tag (tag_id, certificate_id)
values (181, 551);
insert into certificate_tag (tag_id, certificate_id)
values (445, 670);
insert into certificate_tag (tag_id, certificate_id)
values (263, 163);
insert into certificate_tag (tag_id, certificate_id)
values (48, 592);
insert into certificate_tag (tag_id, certificate_id)
values (849, 35);
insert into certificate_tag (tag_id, certificate_id)
values (313, 409);
insert into certificate_tag (tag_id, certificate_id)
values (600, 899);
insert into certificate_tag (tag_id, certificate_id)
values (823, 101);
insert into certificate_tag (tag_id, certificate_id)
values (769, 469);
insert into certificate_tag (tag_id, certificate_id)
values (111, 778);
insert into certificate_tag (tag_id, certificate_id)
values (295, 490);
insert into certificate_tag (tag_id, certificate_id)
values (892, 262);
insert into certificate_tag (tag_id, certificate_id)
values (636, 396);
insert into certificate_tag (tag_id, certificate_id)
values (54, 689);
insert into certificate_tag (tag_id, certificate_id)
values (643, 783);
insert into certificate_tag (tag_id, certificate_id)
values (443, 781);
insert into certificate_tag (tag_id, certificate_id)
values (226, 320);
insert into certificate_tag (tag_id, certificate_id)
values (934, 993);
insert into certificate_tag (tag_id, certificate_id)
values (994, 111);
insert into certificate_tag (tag_id, certificate_id)
values (536, 435);
insert into certificate_tag (tag_id, certificate_id)
values (538, 709);
insert into certificate_tag (tag_id, certificate_id)
values (559, 432);
insert into certificate_tag (tag_id, certificate_id)
values (324, 282);
insert into certificate_tag (tag_id, certificate_id)
values (469, 793);
insert into certificate_tag (tag_id, certificate_id)
values (112, 446);
insert into certificate_tag (tag_id, certificate_id)
values (385, 886);
insert into certificate_tag (tag_id, certificate_id)
values (837, 24);
insert into certificate_tag (tag_id, certificate_id)
values (539, 632);
insert into certificate_tag (tag_id, certificate_id)
values (267, 364);
insert into certificate_tag (tag_id, certificate_id)
values (445, 930);
insert into certificate_tag (tag_id, certificate_id)
values (524, 562);
insert into certificate_tag (tag_id, certificate_id)
values (874, 596);
insert into certificate_tag (tag_id, certificate_id)
values (449, 502);
insert into certificate_tag (tag_id, certificate_id)
values (593, 397);
insert into certificate_tag (tag_id, certificate_id)
values (614, 21);
insert into certificate_tag (tag_id, certificate_id)
values (800, 526);
insert into certificate_tag (tag_id, certificate_id)
values (835, 218);
insert into certificate_tag (tag_id, certificate_id)
values (27, 549);
insert into certificate_tag (tag_id, certificate_id)
values (124, 937);
insert into certificate_tag (tag_id, certificate_id)
values (904, 889);
insert into certificate_tag (tag_id, certificate_id)
values (171, 887);
insert into certificate_tag (tag_id, certificate_id)
values (812, 17);
insert into certificate_tag (tag_id, certificate_id)
values (282, 906);
insert into certificate_tag (tag_id, certificate_id)
values (160, 940);
insert into certificate_tag (tag_id, certificate_id)
values (69, 687);
insert into certificate_tag (tag_id, certificate_id)
values (652, 705);
insert into certificate_tag (tag_id, certificate_id)
values (466, 577);
insert into certificate_tag (tag_id, certificate_id)
values (919, 11);
insert into certificate_tag (tag_id, certificate_id)
values (178, 930);
insert into certificate_tag (tag_id, certificate_id)
values (11, 19);
insert into certificate_tag (tag_id, certificate_id)
values (943, 243);
insert into certificate_tag (tag_id, certificate_id)
values (394, 880);
insert into certificate_tag (tag_id, certificate_id)
values (88, 150);
insert into certificate_tag (tag_id, certificate_id)
values (641, 526);
insert into certificate_tag (tag_id, certificate_id)
values (4, 719);
insert into certificate_tag (tag_id, certificate_id)
values (353, 645);
insert into certificate_tag (tag_id, certificate_id)
values (749, 428);
insert into certificate_tag (tag_id, certificate_id)
values (661, 100);
insert into certificate_tag (tag_id, certificate_id)
values (218, 467);
insert into certificate_tag (tag_id, certificate_id)
values (481, 166);
insert into certificate_tag (tag_id, certificate_id)
values (946, 869);
insert into certificate_tag (tag_id, certificate_id)
values (449, 999);
insert into certificate_tag (tag_id, certificate_id)
values (141, 599);
insert into certificate_tag (tag_id, certificate_id)
values (466, 371);
insert into certificate_tag (tag_id, certificate_id)
values (840, 437);
insert into certificate_tag (tag_id, certificate_id)
values (40, 359);
insert into certificate_tag (tag_id, certificate_id)
values (862, 418);
insert into certificate_tag (tag_id, certificate_id)
values (531, 497);
insert into certificate_tag (tag_id, certificate_id)
values (694, 13);
insert into certificate_tag (tag_id, certificate_id)
values (601, 522);
insert into certificate_tag (tag_id, certificate_id)
values (914, 994);
insert into certificate_tag (tag_id, certificate_id)
values (584, 219);
insert into certificate_tag (tag_id, certificate_id)
values (593, 269);
insert into certificate_tag (tag_id, certificate_id)
values (705, 19);
insert into certificate_tag (tag_id, certificate_id)
values (248, 24);
insert into certificate_tag (tag_id, certificate_id)
values (325, 180);
insert into certificate_tag (tag_id, certificate_id)
values (224, 408);
insert into certificate_tag (tag_id, certificate_id)
values (685, 138);
insert into certificate_tag (tag_id, certificate_id)
values (903, 710);
insert into certificate_tag (tag_id, certificate_id)
values (685, 155);
insert into certificate_tag (tag_id, certificate_id)
values (762, 184);
insert into certificate_tag (tag_id, certificate_id)
values (350, 388);
insert into certificate_tag (tag_id, certificate_id)
values (105, 985);
insert into certificate_tag (tag_id, certificate_id)
values (665, 927);
insert into certificate_tag (tag_id, certificate_id)
values (43, 63);
insert into certificate_tag (tag_id, certificate_id)
values (939, 939);
insert into certificate_tag (tag_id, certificate_id)
values (387, 825);
insert into certificate_tag (tag_id, certificate_id)
values (416, 714);
insert into certificate_tag (tag_id, certificate_id)
values (970, 529);
insert into certificate_tag (tag_id, certificate_id)
values (92, 572);
insert into certificate_tag (tag_id, certificate_id)
values (662, 585);
insert into certificate_tag (tag_id, certificate_id)
values (956, 165);
insert into certificate_tag (tag_id, certificate_id)
values (208, 150);
insert into certificate_tag (tag_id, certificate_id)
values (723, 364);
insert into certificate_tag (tag_id, certificate_id)
values (738, 837);
insert into certificate_tag (tag_id, certificate_id)
values (973, 245);
insert into certificate_tag (tag_id, certificate_id)
values (626, 588);
insert into certificate_tag (tag_id, certificate_id)
values (31, 138);
insert into certificate_tag (tag_id, certificate_id)
values (61, 674);
insert into certificate_tag (tag_id, certificate_id)
values (940, 805);
insert into certificate_tag (tag_id, certificate_id)
values (96, 657);
insert into certificate_tag (tag_id, certificate_id)
values (807, 878);
insert into certificate_tag (tag_id, certificate_id)
values (931, 546);
insert into certificate_tag (tag_id, certificate_id)
values (629, 324);
insert into certificate_tag (tag_id, certificate_id)
values (732, 427);
insert into certificate_tag (tag_id, certificate_id)
values (715, 897);
insert into certificate_tag (tag_id, certificate_id)
values (35, 286);
insert into certificate_tag (tag_id, certificate_id)
values (715, 790);
insert into certificate_tag (tag_id, certificate_id)
values (165, 179);
insert into certificate_tag (tag_id, certificate_id)
values (166, 126);
insert into certificate_tag (tag_id, certificate_id)
values (48, 584);
insert into certificate_tag (tag_id, certificate_id)
values (373, 914);
insert into certificate_tag (tag_id, certificate_id)
values (479, 464);
insert into certificate_tag (tag_id, certificate_id)
values (217, 294);
insert into certificate_tag (tag_id, certificate_id)
values (242, 879);
insert into certificate_tag (tag_id, certificate_id)
values (497, 371);
insert into certificate_tag (tag_id, certificate_id)
values (179, 525);
insert into certificate_tag (tag_id, certificate_id)
values (404, 899);
insert into certificate_tag (tag_id, certificate_id)
values (145, 645);
insert into certificate_tag (tag_id, certificate_id)
values (24, 154);
insert into certificate_tag (tag_id, certificate_id)
values (893, 198);
insert into certificate_tag (tag_id, certificate_id)
values (576, 957);
insert into certificate_tag (tag_id, certificate_id)
values (795, 365);
insert into certificate_tag (tag_id, certificate_id)
values (64, 798);
insert into certificate_tag (tag_id, certificate_id)
values (505, 195);
insert into certificate_tag (tag_id, certificate_id)
values (376, 856);
insert into certificate_tag (tag_id, certificate_id)
values (65, 286);
insert into certificate_tag (tag_id, certificate_id)
values (650, 248);
insert into certificate_tag (tag_id, certificate_id)
values (646, 632);
insert into certificate_tag (tag_id, certificate_id)
values (706, 557);
insert into certificate_tag (tag_id, certificate_id)
values (133, 81);
insert into certificate_tag (tag_id, certificate_id)
values (975, 341);
insert into certificate_tag (tag_id, certificate_id)
values (703, 371);
insert into certificate_tag (tag_id, certificate_id)
values (115, 249);
insert into certificate_tag (tag_id, certificate_id)
values (678, 284);
insert into certificate_tag (tag_id, certificate_id)
values (601, 988);
insert into certificate_tag (tag_id, certificate_id)
values (159, 264);
insert into certificate_tag (tag_id, certificate_id)
values (115, 743);
insert into certificate_tag (tag_id, certificate_id)
values (510, 571);
insert into certificate_tag (tag_id, certificate_id)
values (515, 449);
insert into certificate_tag (tag_id, certificate_id)
values (302, 910);
insert into certificate_tag (tag_id, certificate_id)
values (393, 561);
insert into certificate_tag (tag_id, certificate_id)
values (807, 93);
insert into certificate_tag (tag_id, certificate_id)
values (789, 621);
insert into certificate_tag (tag_id, certificate_id)
values (575, 990);
insert into certificate_tag (tag_id, certificate_id)
values (862, 715);
insert into certificate_tag (tag_id, certificate_id)
values (831, 78);
insert into certificate_tag (tag_id, certificate_id)
values (635, 144);
insert into certificate_tag (tag_id, certificate_id)
values (356, 640);
insert into certificate_tag (tag_id, certificate_id)
values (742, 698);
insert into certificate_tag (tag_id, certificate_id)
values (683, 601);
insert into certificate_tag (tag_id, certificate_id)
values (754, 348);
insert into certificate_tag (tag_id, certificate_id)
values (797, 263);
insert into certificate_tag (tag_id, certificate_id)
values (349, 911);
insert into certificate_tag (tag_id, certificate_id)
values (404, 347);
insert into certificate_tag (tag_id, certificate_id)
values (148, 123);
insert into certificate_tag (tag_id, certificate_id)
values (445, 150);
insert into certificate_tag (tag_id, certificate_id)
values (932, 824);
insert into certificate_tag (tag_id, certificate_id)
values (477, 120);
insert into certificate_tag (tag_id, certificate_id)
values (667, 668);
insert into certificate_tag (tag_id, certificate_id)
values (310, 453);
insert into certificate_tag (tag_id, certificate_id)
values (981, 375);
insert into certificate_tag (tag_id, certificate_id)
values (466, 885);
insert into certificate_tag (tag_id, certificate_id)
values (308, 87);
insert into certificate_tag (tag_id, certificate_id)
values (629, 200);
insert into certificate_tag (tag_id, certificate_id)
values (382, 317);
insert into certificate_tag (tag_id, certificate_id)
values (260, 825);
insert into certificate_tag (tag_id, certificate_id)
values (105, 756);
insert into certificate_tag (tag_id, certificate_id)
values (993, 582);
insert into certificate_tag (tag_id, certificate_id)
values (201, 106);
insert into certificate_tag (tag_id, certificate_id)
values (914, 977);
insert into certificate_tag (tag_id, certificate_id)
values (415, 485);
insert into certificate_tag (tag_id, certificate_id)
values (411, 989);
insert into certificate_tag (tag_id, certificate_id)
values (374, 644);
insert into certificate_tag (tag_id, certificate_id)
values (585, 490);
insert into certificate_tag (tag_id, certificate_id)
values (578, 58);
insert into certificate_tag (tag_id, certificate_id)
values (254, 214);
insert into certificate_tag (tag_id, certificate_id)
values (947, 818);
insert into certificate_tag (tag_id, certificate_id)
values (208, 24);
insert into certificate_tag (tag_id, certificate_id)
values (640, 302);
insert into certificate_tag (tag_id, certificate_id)
values (841, 317);
insert into certificate_tag (tag_id, certificate_id)
values (748, 526);
insert into certificate_tag (tag_id, certificate_id)
values (637, 59);
insert into certificate_tag (tag_id, certificate_id)
values (924, 494);
insert into certificate_tag (tag_id, certificate_id)
values (545, 522);
insert into certificate_tag (tag_id, certificate_id)
values (192, 666);
insert into certificate_tag (tag_id, certificate_id)
values (934, 392);
insert into certificate_tag (tag_id, certificate_id)
values (700, 333);
insert into certificate_tag (tag_id, certificate_id)
values (133, 72);
insert into certificate_tag (tag_id, certificate_id)
values (294, 953);
insert into certificate_tag (tag_id, certificate_id)
values (784, 176);
insert into certificate_tag (tag_id, certificate_id)
values (527, 116);
insert into certificate_tag (tag_id, certificate_id)
values (613, 291);
insert into certificate_tag (tag_id, certificate_id)
values (254, 594);
insert into certificate_tag (tag_id, certificate_id)
values (419, 158);
insert into certificate_tag (tag_id, certificate_id)
values (327, 391);
insert into certificate_tag (tag_id, certificate_id)
values (290, 91);
insert into certificate_tag (tag_id, certificate_id)
values (732, 193);
insert into certificate_tag (tag_id, certificate_id)
values (722, 166);
insert into certificate_tag (tag_id, certificate_id)
values (637, 352);
insert into certificate_tag (tag_id, certificate_id)
values (8, 280);
insert into certificate_tag (tag_id, certificate_id)
values (151, 724);
insert into certificate_tag (tag_id, certificate_id)
values (958, 979);
insert into certificate_tag (tag_id, certificate_id)
values (943, 809);
insert into certificate_tag (tag_id, certificate_id)
values (826, 428);
insert into certificate_tag (tag_id, certificate_id)
values (613, 948);
insert into certificate_tag (tag_id, certificate_id)
values (198, 16);
insert into certificate_tag (tag_id, certificate_id)
values (403, 492);
insert into certificate_tag (tag_id, certificate_id)
values (579, 653);
insert into certificate_tag (tag_id, certificate_id)
values (716, 178);
insert into certificate_tag (tag_id, certificate_id)
values (243, 11);
insert into certificate_tag (tag_id, certificate_id)
values (360, 743);
insert into certificate_tag (tag_id, certificate_id)
values (580, 79);
insert into certificate_tag (tag_id, certificate_id)
values (229, 166);
insert into certificate_tag (tag_id, certificate_id)
values (354, 524);
insert into certificate_tag (tag_id, certificate_id)
values (694, 908);
insert into certificate_tag (tag_id, certificate_id)
values (699, 839);
insert into certificate_tag (tag_id, certificate_id)
values (861, 174);
insert into certificate_tag (tag_id, certificate_id)
values (366, 95);
insert into certificate_tag (tag_id, certificate_id)
values (841, 63);
insert into certificate_tag (tag_id, certificate_id)
values (147, 858);
insert into certificate_tag (tag_id, certificate_id)
values (178, 310);
insert into certificate_tag (tag_id, certificate_id)
values (34, 955);
insert into certificate_tag (tag_id, certificate_id)
values (794, 702);
insert into certificate_tag (tag_id, certificate_id)
values (586, 265);
insert into certificate_tag (tag_id, certificate_id)
values (934, 872);
insert into certificate_tag (tag_id, certificate_id)
values (91, 934);
insert into certificate_tag (tag_id, certificate_id)
values (447, 670);
insert into certificate_tag (tag_id, certificate_id)
values (211, 887);
insert into certificate_tag (tag_id, certificate_id)
values (783, 805);
insert into certificate_tag (tag_id, certificate_id)
values (223, 935);
insert into certificate_tag (tag_id, certificate_id)
values (457, 293);
insert into certificate_tag (tag_id, certificate_id)
values (945, 11);
insert into certificate_tag (tag_id, certificate_id)
values (292, 583);
insert into certificate_tag (tag_id, certificate_id)
values (754, 529);
insert into certificate_tag (tag_id, certificate_id)
values (404, 283);
insert into certificate_tag (tag_id, certificate_id)
values (360, 933);
insert into certificate_tag (tag_id, certificate_id)
values (756, 288);
insert into certificate_tag (tag_id, certificate_id)
values (19, 954);
insert into certificate_tag (tag_id, certificate_id)
values (993, 570);
insert into certificate_tag (tag_id, certificate_id)
values (603, 465);
insert into certificate_tag (tag_id, certificate_id)
values (406, 696);
insert into certificate_tag (tag_id, certificate_id)
values (223, 729);
insert into certificate_tag (tag_id, certificate_id)
values (550, 23);
insert into certificate_tag (tag_id, certificate_id)
values (446, 319);
insert into certificate_tag (tag_id, certificate_id)
values (662, 105);
insert into certificate_tag (tag_id, certificate_id)
values (240, 603);
insert into certificate_tag (tag_id, certificate_id)
values (970, 683);
insert into certificate_tag (tag_id, certificate_id)
values (65, 287);
insert into certificate_tag (tag_id, certificate_id)
values (186, 211);
insert into certificate_tag (tag_id, certificate_id)
values (650, 692);
insert into certificate_tag (tag_id, certificate_id)
values (728, 428);
insert into certificate_tag (tag_id, certificate_id)
values (963, 438);
insert into certificate_tag (tag_id, certificate_id)
values (124, 13);
insert into certificate_tag (tag_id, certificate_id)
values (523, 654);
insert into certificate_tag (tag_id, certificate_id)
values (936, 252);
insert into certificate_tag (tag_id, certificate_id)
values (403, 749);
insert into certificate_tag (tag_id, certificate_id)
values (6, 435);
insert into certificate_tag (tag_id, certificate_id)
values (212, 233);
insert into certificate_tag (tag_id, certificate_id)
values (809, 111);
insert into certificate_tag (tag_id, certificate_id)
values (160, 425);
insert into certificate_tag (tag_id, certificate_id)
values (900, 166);
insert into certificate_tag (tag_id, certificate_id)
values (556, 597);
insert into certificate_tag (tag_id, certificate_id)
values (461, 357);
insert into certificate_tag (tag_id, certificate_id)
values (405, 216);
insert into certificate_tag (tag_id, certificate_id)
values (556, 546);
insert into certificate_tag (tag_id, certificate_id)
values (205, 714);
insert into certificate_tag (tag_id, certificate_id)
values (529, 24);
insert into certificate_tag (tag_id, certificate_id)
values (565, 904);
insert into certificate_tag (tag_id, certificate_id)
values (562, 275);
insert into certificate_tag (tag_id, certificate_id)
values (161, 614);
insert into certificate_tag (tag_id, certificate_id)
values (857, 167);
insert into certificate_tag (tag_id, certificate_id)
values (260, 205);
insert into certificate_tag (tag_id, certificate_id)
values (140, 205);
insert into certificate_tag (tag_id, certificate_id)
values (419, 372);
insert into certificate_tag (tag_id, certificate_id)
values (54, 587);
insert into certificate_tag (tag_id, certificate_id)
values (139, 248);
insert into certificate_tag (tag_id, certificate_id)
values (899, 815);
insert into certificate_tag (tag_id, certificate_id)
values (498, 356);
insert into certificate_tag (tag_id, certificate_id)
values (938, 823);
insert into certificate_tag (tag_id, certificate_id)
values (193, 750);
insert into certificate_tag (tag_id, certificate_id)
values (459, 925);
insert into certificate_tag (tag_id, certificate_id)
values (73, 37);
insert into certificate_tag (tag_id, certificate_id)
values (210, 361);
insert into certificate_tag (tag_id, certificate_id)
values (500, 211);
insert into certificate_tag (tag_id, certificate_id)
values (851, 837);
insert into certificate_tag (tag_id, certificate_id)
values (150, 515);
insert into certificate_tag (tag_id, certificate_id)
values (668, 753);
insert into certificate_tag (tag_id, certificate_id)
values (340, 315);
insert into certificate_tag (tag_id, certificate_id)
values (877, 224);
insert into certificate_tag (tag_id, certificate_id)
values (45, 85);
insert into certificate_tag (tag_id, certificate_id)
values (180, 574);
insert into certificate_tag (tag_id, certificate_id)
values (100, 976);
insert into certificate_tag (tag_id, certificate_id)
values (552, 419);
insert into certificate_tag (tag_id, certificate_id)
values (795, 883);
insert into certificate_tag (tag_id, certificate_id)
values (476, 388);
insert into certificate_tag (tag_id, certificate_id)
values (778, 481);
insert into certificate_tag (tag_id, certificate_id)
values (823, 637);
insert into certificate_tag (tag_id, certificate_id)
values (645, 170);
insert into certificate_tag (tag_id, certificate_id)
values (513, 976);
insert into certificate_tag (tag_id, certificate_id)
values (244, 366);
insert into certificate_tag (tag_id, certificate_id)
values (722, 45);
insert into certificate_tag (tag_id, certificate_id)
values (680, 991);
insert into certificate_tag (tag_id, certificate_id)
values (53, 788);
insert into certificate_tag (tag_id, certificate_id)
values (227, 490);
insert into certificate_tag (tag_id, certificate_id)
values (212, 212);
insert into certificate_tag (tag_id, certificate_id)
values (620, 786);
insert into certificate_tag (tag_id, certificate_id)
values (992, 421);
insert into certificate_tag (tag_id, certificate_id)
values (300, 801);
insert into certificate_tag (tag_id, certificate_id)
values (319, 678);
insert into certificate_tag (tag_id, certificate_id)
values (150, 627);
insert into certificate_tag (tag_id, certificate_id)
values (239, 667);
insert into certificate_tag (tag_id, certificate_id)
values (740, 545);
insert into certificate_tag (tag_id, certificate_id)
values (608, 758);
insert into certificate_tag (tag_id, certificate_id)
values (474, 35);
insert into certificate_tag (tag_id, certificate_id)
values (215, 834);
insert into certificate_tag (tag_id, certificate_id)
values (562, 845);
insert into certificate_tag (tag_id, certificate_id)
values (250, 171);
insert into certificate_tag (tag_id, certificate_id)
values (930, 428);
insert into certificate_tag (tag_id, certificate_id)
values (752, 712);
insert into certificate_tag (tag_id, certificate_id)
values (399, 251);
insert into certificate_tag (tag_id, certificate_id)
values (311, 146);
insert into certificate_tag (tag_id, certificate_id)
values (813, 75);
insert into certificate_tag (tag_id, certificate_id)
values (655, 590);
insert into certificate_tag (tag_id, certificate_id)
values (220, 669);
insert into certificate_tag (tag_id, certificate_id)
values (889, 133);
insert into certificate_tag (tag_id, certificate_id)
values (553, 80);
insert into certificate_tag (tag_id, certificate_id)
values (952, 25);
insert into certificate_tag (tag_id, certificate_id)
values (537, 648);
insert into certificate_tag (tag_id, certificate_id)
values (788, 595);
insert into certificate_tag (tag_id, certificate_id)
values (830, 372);
insert into certificate_tag (tag_id, certificate_id)
values (348, 311);
insert into certificate_tag (tag_id, certificate_id)
values (1000, 100);
insert into certificate_tag (tag_id, certificate_id)
values (217, 174);
insert into certificate_tag (tag_id, certificate_id)
values (162, 172);
insert into certificate_tag (tag_id, certificate_id)
values (595, 680);
insert into certificate_tag (tag_id, certificate_id)
values (406, 736);
insert into certificate_tag (tag_id, certificate_id)
values (869, 147);
insert into certificate_tag (tag_id, certificate_id)
values (362, 20);
insert into certificate_tag (tag_id, certificate_id)
values (465, 643);
insert into certificate_tag (tag_id, certificate_id)
values (43, 525);
insert into certificate_tag (tag_id, certificate_id)
values (484, 1000);
insert into certificate_tag (tag_id, certificate_id)
values (788, 161);
insert into certificate_tag (tag_id, certificate_id)
values (545, 811);
insert into certificate_tag (tag_id, certificate_id)
values (9, 329);
insert into certificate_tag (tag_id, certificate_id)
values (564, 195);
insert into certificate_tag (tag_id, certificate_id)
values (37, 741);
insert into certificate_tag (tag_id, certificate_id)
values (174, 308);
insert into certificate_tag (tag_id, certificate_id)
values (742, 510);
insert into certificate_tag (tag_id, certificate_id)
values (218, 362);
insert into certificate_tag (tag_id, certificate_id)
values (321, 855);
insert into certificate_tag (tag_id, certificate_id)
values (861, 13);
insert into certificate_tag (tag_id, certificate_id)
values (99, 143);
insert into certificate_tag (tag_id, certificate_id)
values (520, 790);
insert into certificate_tag (tag_id, certificate_id)
values (326, 528);
insert into certificate_tag (tag_id, certificate_id)
values (968, 367);
insert into certificate_tag (tag_id, certificate_id)
values (782, 343);
insert into certificate_tag (tag_id, certificate_id)
values (97, 884);
insert into certificate_tag (tag_id, certificate_id)
values (579, 756);
insert into certificate_tag (tag_id, certificate_id)
values (613, 964);
insert into certificate_tag (tag_id, certificate_id)
values (100, 173);
insert into certificate_tag (tag_id, certificate_id)
values (320, 429);
insert into certificate_tag (tag_id, certificate_id)
values (884, 671);
insert into certificate_tag (tag_id, certificate_id)
values (163, 47);
insert into certificate_tag (tag_id, certificate_id)
values (604, 276);
insert into certificate_tag (tag_id, certificate_id)
values (860, 881);
insert into certificate_tag (tag_id, certificate_id)
values (458, 844);
insert into certificate_tag (tag_id, certificate_id)
values (20, 967);
insert into certificate_tag (tag_id, certificate_id)
values (427, 350);
insert into certificate_tag (tag_id, certificate_id)
values (785, 585);
insert into certificate_tag (tag_id, certificate_id)
values (726, 549);
insert into certificate_tag (tag_id, certificate_id)
values (752, 359);
insert into certificate_tag (tag_id, certificate_id)
values (143, 92);
insert into certificate_tag (tag_id, certificate_id)
values (537, 456);
insert into certificate_tag (tag_id, certificate_id)
values (138, 670);
insert into certificate_tag (tag_id, certificate_id)
values (357, 653);
insert into certificate_tag (tag_id, certificate_id)
values (372, 898);
insert into certificate_tag (tag_id, certificate_id)
values (234, 274);
insert into certificate_tag (tag_id, certificate_id)
values (665, 169);
insert into certificate_tag (tag_id, certificate_id)
values (51, 750);
insert into certificate_tag (tag_id, certificate_id)
values (456, 370);
insert into certificate_tag (tag_id, certificate_id)
values (903, 969);
insert into certificate_tag (tag_id, certificate_id)
values (271, 127);
insert into certificate_tag (tag_id, certificate_id)
values (795, 33);
insert into certificate_tag (tag_id, certificate_id)
values (370, 700);
insert into certificate_tag (tag_id, certificate_id)
values (154, 816);
insert into certificate_tag (tag_id, certificate_id)
values (327, 727);
insert into certificate_tag (tag_id, certificate_id)
values (604, 705);
insert into certificate_tag (tag_id, certificate_id)
values (905, 445);
insert into certificate_tag (tag_id, certificate_id)
values (354, 288);
insert into certificate_tag (tag_id, certificate_id)
values (525, 617);
insert into certificate_tag (tag_id, certificate_id)
values (439, 445);
insert into certificate_tag (tag_id, certificate_id)
values (393, 263);
insert into certificate_tag (tag_id, certificate_id)
values (386, 328);
insert into certificate_tag (tag_id, certificate_id)
values (335, 755);
insert into certificate_tag (tag_id, certificate_id)
values (537, 460);
insert into certificate_tag (tag_id, certificate_id)
values (407, 688);
insert into certificate_tag (tag_id, certificate_id)
values (163, 59);
insert into certificate_tag (tag_id, certificate_id)
values (51, 40);
insert into certificate_tag (tag_id, certificate_id)
values (942, 797);
insert into certificate_tag (tag_id, certificate_id)
values (154, 203);
insert into certificate_tag (tag_id, certificate_id)
values (406, 650);
insert into certificate_tag (tag_id, certificate_id)
values (879, 675);
insert into certificate_tag (tag_id, certificate_id)
values (901, 753);
insert into certificate_tag (tag_id, certificate_id)
values (359, 438);
insert into certificate_tag (tag_id, certificate_id)
values (31, 89);
insert into certificate_tag (tag_id, certificate_id)
values (58, 339);
insert into certificate_tag (tag_id, certificate_id)
values (4, 509);
insert into certificate_tag (tag_id, certificate_id)
values (81, 41);
insert into certificate_tag (tag_id, certificate_id)
values (330, 510);
insert into certificate_tag (tag_id, certificate_id)
values (454, 704);
insert into certificate_tag (tag_id, certificate_id)
values (33, 906);
insert into certificate_tag (tag_id, certificate_id)
values (723, 625);
insert into certificate_tag (tag_id, certificate_id)
values (945, 476);
insert into certificate_tag (tag_id, certificate_id)
values (428, 36);
insert into certificate_tag (tag_id, certificate_id)
values (347, 629);
insert into certificate_tag (tag_id, certificate_id)
values (101, 96);
insert into certificate_tag (tag_id, certificate_id)
values (452, 282);
insert into certificate_tag (tag_id, certificate_id)
values (221, 624);
insert into certificate_tag (tag_id, certificate_id)
values (135, 417);
insert into certificate_tag (tag_id, certificate_id)
values (570, 967);
insert into certificate_tag (tag_id, certificate_id)
values (197, 488);
insert into certificate_tag (tag_id, certificate_id)
values (556, 642);
insert into certificate_tag (tag_id, certificate_id)
values (956, 967);
insert into certificate_tag (tag_id, certificate_id)
values (936, 550);
insert into certificate_tag (tag_id, certificate_id)
values (845, 827);
insert into certificate_tag (tag_id, certificate_id)
values (526, 204);
insert into certificate_tag (tag_id, certificate_id)
values (544, 206);
insert into certificate_tag (tag_id, certificate_id)
values (990, 73);
insert into certificate_tag (tag_id, certificate_id)
values (468, 697);
insert into certificate_tag (tag_id, certificate_id)
values (45, 464);
insert into certificate_tag (tag_id, certificate_id)
values (733, 785);
insert into certificate_tag (tag_id, certificate_id)
values (991, 270);
insert into certificate_tag (tag_id, certificate_id)
values (905, 1);
insert into certificate_tag (tag_id, certificate_id)
values (157, 30);
insert into certificate_tag (tag_id, certificate_id)
values (512, 547);
insert into certificate_tag (tag_id, certificate_id)
values (912, 687);
insert into certificate_tag (tag_id, certificate_id)
values (895, 458);
insert into certificate_tag (tag_id, certificate_id)
values (473, 437);
insert into certificate_tag (tag_id, certificate_id)
values (877, 941);
insert into certificate_tag (tag_id, certificate_id)
values (601, 15);
insert into certificate_tag (tag_id, certificate_id)
values (177, 217);
insert into certificate_tag (tag_id, certificate_id)
values (369, 307);
insert into certificate_tag (tag_id, certificate_id)
values (141, 725);
insert into certificate_tag (tag_id, certificate_id)
values (392, 655);
insert into certificate_tag (tag_id, certificate_id)
values (914, 419);
insert into certificate_tag (tag_id, certificate_id)
values (12, 32);
insert into certificate_tag (tag_id, certificate_id)
values (250, 109);
insert into certificate_tag (tag_id, certificate_id)
values (578, 749);
insert into certificate_tag (tag_id, certificate_id)
values (104, 943);
insert into certificate_tag (tag_id, certificate_id)
values (417, 566);
insert into certificate_tag (tag_id, certificate_id)
values (753, 121);
insert into certificate_tag (tag_id, certificate_id)
values (326, 60);
insert into certificate_tag (tag_id, certificate_id)
values (565, 68);
insert into certificate_tag (tag_id, certificate_id)
values (420, 887);
insert into certificate_tag (tag_id, certificate_id)
values (505, 436);
insert into certificate_tag (tag_id, certificate_id)
values (251, 231);
insert into certificate_tag (tag_id, certificate_id)
values (419, 655);
insert into certificate_tag (tag_id, certificate_id)
values (59, 407);
insert into certificate_tag (tag_id, certificate_id)
values (81, 90);
insert into certificate_tag (tag_id, certificate_id)
values (989, 128);
insert into certificate_tag (tag_id, certificate_id)
values (662, 638);
insert into certificate_tag (tag_id, certificate_id)
values (957, 802);
insert into certificate_tag (tag_id, certificate_id)
values (68, 677);
insert into certificate_tag (tag_id, certificate_id)
values (770, 248);
insert into certificate_tag (tag_id, certificate_id)
values (223, 913);
insert into certificate_tag (tag_id, certificate_id)
values (991, 803);
insert into certificate_tag (tag_id, certificate_id)
values (532, 862);
insert into certificate_tag (tag_id, certificate_id)
values (103, 213);
insert into certificate_tag (tag_id, certificate_id)
values (577, 942);
insert into certificate_tag (tag_id, certificate_id)
values (154, 96);
insert into certificate_tag (tag_id, certificate_id)
values (921, 904);
insert into certificate_tag (tag_id, certificate_id)
values (530, 940);
insert into certificate_tag (tag_id, certificate_id)
values (486, 40);
insert into certificate_tag (tag_id, certificate_id)
values (527, 745);
insert into certificate_tag (tag_id, certificate_id)
values (336, 424);
insert into certificate_tag (tag_id, certificate_id)
values (173, 879);
insert into certificate_tag (tag_id, certificate_id)
values (573, 122);
insert into certificate_tag (tag_id, certificate_id)
values (558, 207);
insert into certificate_tag (tag_id, certificate_id)
values (564, 167);
insert into certificate_tag (tag_id, certificate_id)
values (738, 84);
insert into certificate_tag (tag_id, certificate_id)
values (757, 74);
insert into certificate_tag (tag_id, certificate_id)
values (189, 448);
insert into certificate_tag (tag_id, certificate_id)
values (825, 646);
insert into certificate_tag (tag_id, certificate_id)
values (802, 960);
insert into certificate_tag (tag_id, certificate_id)
values (774, 216);
insert into certificate_tag (tag_id, certificate_id)
values (607, 375);
insert into certificate_tag (tag_id, certificate_id)
values (247, 900);
insert into certificate_tag (tag_id, certificate_id)
values (531, 938);
insert into certificate_tag (tag_id, certificate_id)
values (976, 182);
insert into certificate_tag (tag_id, certificate_id)
values (96, 736);
insert into certificate_tag (tag_id, certificate_id)
values (729, 116);
insert into certificate_tag (tag_id, certificate_id)
values (732, 2);
insert into certificate_tag (tag_id, certificate_id)
values (600, 631);
insert into certificate_tag (tag_id, certificate_id)
values (295, 869);
insert into certificate_tag (tag_id, certificate_id)
values (958, 348);
insert into certificate_tag (tag_id, certificate_id)
values (72, 241);
insert into certificate_tag (tag_id, certificate_id)
values (760, 161);
insert into certificate_tag (tag_id, certificate_id)
values (487, 802);
insert into certificate_tag (tag_id, certificate_id)
values (588, 162);
insert into certificate_tag (tag_id, certificate_id)
values (132, 857);
insert into certificate_tag (tag_id, certificate_id)
values (408, 322);
insert into certificate_tag (tag_id, certificate_id)
values (117, 225);
insert into certificate_tag (tag_id, certificate_id)
values (870, 549);
insert into certificate_tag (tag_id, certificate_id)
values (851, 119);
insert into certificate_tag (tag_id, certificate_id)
values (523, 456);
insert into certificate_tag (tag_id, certificate_id)
values (727, 352);
insert into certificate_tag (tag_id, certificate_id)
values (957, 841);
insert into certificate_tag (tag_id, certificate_id)
values (156, 440);
insert into certificate_tag (tag_id, certificate_id)
values (641, 979);
insert into certificate_tag (tag_id, certificate_id)
values (61, 207);
insert into certificate_tag (tag_id, certificate_id)
values (464, 724);
insert into certificate_tag (tag_id, certificate_id)
values (663, 576);
insert into certificate_tag (tag_id, certificate_id)
values (852, 91);
insert into certificate_tag (tag_id, certificate_id)
values (480, 396);
insert into certificate_tag (tag_id, certificate_id)
values (439, 189);
insert into certificate_tag (tag_id, certificate_id)
values (413, 346);
insert into certificate_tag (tag_id, certificate_id)
values (436, 271);
insert into certificate_tag (tag_id, certificate_id)
values (77, 864);
insert into certificate_tag (tag_id, certificate_id)
values (957, 481);
insert into certificate_tag (tag_id, certificate_id)
values (630, 439);
insert into certificate_tag (tag_id, certificate_id)
values (977, 920);
insert into certificate_tag (tag_id, certificate_id)
values (427, 33);
insert into certificate_tag (tag_id, certificate_id)
values (579, 683);
insert into certificate_tag (tag_id, certificate_id)
values (358, 533);
insert into certificate_tag (tag_id, certificate_id)
values (606, 174);
insert into certificate_tag (tag_id, certificate_id)
values (131, 127);
insert into certificate_tag (tag_id, certificate_id)
values (264, 797);
insert into certificate_tag (tag_id, certificate_id)
values (136, 683);
insert into certificate_tag (tag_id, certificate_id)
values (592, 478);
insert into certificate_tag (tag_id, certificate_id)
values (436, 773);
insert into certificate_tag (tag_id, certificate_id)
values (195, 760);
insert into certificate_tag (tag_id, certificate_id)
values (900, 413);
insert into certificate_tag (tag_id, certificate_id)
values (11, 587);
insert into certificate_tag (tag_id, certificate_id)
values (211, 313);
insert into certificate_tag (tag_id, certificate_id)
values (861, 686);
insert into certificate_tag (tag_id, certificate_id)
values (528, 379);
insert into certificate_tag (tag_id, certificate_id)
values (919, 842);
insert into certificate_tag (tag_id, certificate_id)
values (875, 492);
insert into certificate_tag (tag_id, certificate_id)
values (789, 389);
insert into certificate_tag (tag_id, certificate_id)
values (899, 784);
insert into certificate_tag (tag_id, certificate_id)
values (802, 490);
insert into certificate_tag (tag_id, certificate_id)
values (322, 687);
insert into certificate_tag (tag_id, certificate_id)
values (804, 692);
insert into certificate_tag (tag_id, certificate_id)
values (260, 578);
insert into certificate_tag (tag_id, certificate_id)
values (397, 576);
insert into certificate_tag (tag_id, certificate_id)
values (957, 229);
insert into certificate_tag (tag_id, certificate_id)
values (605, 146);
insert into certificate_tag (tag_id, certificate_id)
values (73, 252);
insert into certificate_tag (tag_id, certificate_id)
values (257, 742);
insert into certificate_tag (tag_id, certificate_id)
values (338, 422);
insert into certificate_tag (tag_id, certificate_id)
values (826, 163);
insert into certificate_tag (tag_id, certificate_id)
values (746, 9);
insert into certificate_tag (tag_id, certificate_id)
values (113, 744);
insert into certificate_tag (tag_id, certificate_id)
values (813, 549);
insert into certificate_tag (tag_id, certificate_id)
values (248, 108);
insert into certificate_tag (tag_id, certificate_id)
values (63, 696);
insert into certificate_tag (tag_id, certificate_id)
values (207, 172);
insert into certificate_tag (tag_id, certificate_id)
values (391, 389);
insert into certificate_tag (tag_id, certificate_id)
values (370, 800);
insert into certificate_tag (tag_id, certificate_id)
values (566, 577);
insert into certificate_tag (tag_id, certificate_id)
values (754, 897);
insert into certificate_tag (tag_id, certificate_id)
values (621, 286);
insert into certificate_tag (tag_id, certificate_id)
values (638, 282);
insert into certificate_tag (tag_id, certificate_id)
values (917, 531);
insert into certificate_tag (tag_id, certificate_id)
values (318, 873);
insert into certificate_tag (tag_id, certificate_id)
values (276, 517);
insert into certificate_tag (tag_id, certificate_id)
values (931, 517);
insert into certificate_tag (tag_id, certificate_id)
values (60, 841);
insert into certificate_tag (tag_id, certificate_id)
values (945, 100);
insert into certificate_tag (tag_id, certificate_id)
values (529, 91);
insert into certificate_tag (tag_id, certificate_id)
values (33, 98);
insert into certificate_tag (tag_id, certificate_id)
values (798, 824);
insert into certificate_tag (tag_id, certificate_id)
values (195, 774);
insert into certificate_tag (tag_id, certificate_id)
values (117, 178);
insert into certificate_tag (tag_id, certificate_id)
values (203, 595);
insert into certificate_tag (tag_id, certificate_id)
values (670, 26);
insert into certificate_tag (tag_id, certificate_id)
values (262, 447);
insert into certificate_tag (tag_id, certificate_id)
values (963, 638);
insert into certificate_tag (tag_id, certificate_id)
values (947, 850);
insert into certificate_tag (tag_id, certificate_id)
values (307, 257);
insert into certificate_tag (tag_id, certificate_id)
values (620, 51);
insert into certificate_tag (tag_id, certificate_id)
values (336, 635);
insert into certificate_tag (tag_id, certificate_id)
values (484, 479);
insert into certificate_tag (tag_id, certificate_id)
values (247, 260);
insert into certificate_tag (tag_id, certificate_id)
values (816, 442);
insert into certificate_tag (tag_id, certificate_id)
values (648, 947);
insert into certificate_tag (tag_id, certificate_id)
values (850, 106);
insert into certificate_tag (tag_id, certificate_id)
values (357, 580);
insert into certificate_tag (tag_id, certificate_id)
values (748, 194);
insert into certificate_tag (tag_id, certificate_id)
values (718, 47);
insert into certificate_tag (tag_id, certificate_id)
values (913, 24);
insert into certificate_tag (tag_id, certificate_id)
values (334, 580);
insert into certificate_tag (tag_id, certificate_id)
values (932, 551);
insert into certificate_tag (tag_id, certificate_id)
values (545, 264);
insert into certificate_tag (tag_id, certificate_id)
values (851, 678);
insert into certificate_tag (tag_id, certificate_id)
values (111, 137);
insert into certificate_tag (tag_id, certificate_id)
values (956, 316);
insert into certificate_tag (tag_id, certificate_id)
values (37, 71);
insert into certificate_tag (tag_id, certificate_id)
values (200, 356);
insert into certificate_tag (tag_id, certificate_id)
values (898, 54);
insert into certificate_tag (tag_id, certificate_id)
values (896, 674);
insert into certificate_tag (tag_id, certificate_id)
values (139, 340);
insert into certificate_tag (tag_id, certificate_id)
values (613, 737);



insert into user_orders (user_id, certificate_id, price, date)
values (81, 716, 61, '2021-04-09T12:38:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (544, 200, 67, '2021-07-10T10:02:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (212, 874, 285, '2021-07-27T03:15:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (206, 47, 350, '2021-02-21T08:03:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (515, 8, 511, '2021-08-28T22:21:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (729, 212, 249, '2021-03-13T07:53:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (463, 20, 14, '2021-09-08T23:49:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (385, 880, 472, '2021-03-23T08:21:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (868, 180, 102, '2020-12-15T05:57:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (861, 259, 894, '2021-06-13T12:51:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (985, 332, 379, '2021-08-18T21:02:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (282, 759, 605, '2021-06-14T13:50:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (889, 243, 59, '2021-05-30T02:39:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (500, 200, 588, '2021-09-17T04:48:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (607, 296, 670, '2021-02-24T05:59:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (685, 671, 725, '2021-05-20T18:17:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (489, 660, 214, '2020-12-18T16:11:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (515, 935, 547, '2021-05-30T04:29:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (775, 149, 871, '2021-09-16T17:47:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (78, 833, 576, '2020-11-16T01:38:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (379, 523, 73, '2021-10-10T17:17:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (513, 573, 999, '2021-01-02T18:04:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (389, 6, 848, '2021-09-09T17:06:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (586, 193, 245, '2021-09-25T08:14:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (998, 902, 532, '2021-11-06T22:49:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (478, 820, 627, '2021-08-28T15:52:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (317, 962, 965, '2021-07-17T06:46:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (64, 456, 787, '2021-06-01T15:43:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (97, 228, 700, '2021-04-29T22:21:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (810, 966, 988, '2021-07-20T15:39:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (662, 982, 65, '2021-10-05T13:00:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (771, 615, 744, '2021-04-04T23:06:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (248, 801, 65, '2021-08-13T10:32:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (529, 998, 535, '2021-04-19T12:17:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (591, 903, 181, '2021-07-12T14:47:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (729, 970, 762, '2021-07-28T18:45:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (444, 430, 389, '2021-06-28T05:24:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (325, 852, 461, '2021-10-21T08:22:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (647, 353, 73, '2021-02-21T08:14:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (580, 209, 181, '2021-01-05T04:03:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (55, 868, 711, '2021-04-26T05:27:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (394, 443, 558, '2021-06-11T12:17:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (901, 748, 30, '2021-08-09T21:13:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (972, 675, 986, '2020-11-17T08:57:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (534, 334, 488, '2021-05-20T20:03:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (112, 335, 264, '2021-08-13T18:14:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (800, 295, 411, '2021-07-09T07:20:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (288, 985, 320, '2021-04-29T20:42:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (29, 737, 291, '2021-08-12T00:12:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (327, 874, 697, '2021-03-04T16:06:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (140, 365, 897, '2021-03-14T15:37:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (846, 871, 740, '2021-05-30T10:08:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (967, 73, 453, '2021-04-15T20:58:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (220, 722, 696, '2021-01-08T07:00:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (206, 292, 951, '2021-07-01T23:42:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (916, 76, 131, '2020-11-16T09:45:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (682, 80, 324, '2020-12-09T06:00:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (699, 427, 455, '2021-06-06T05:29:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (725, 331, 243, '2021-01-26T10:57:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (261, 294, 836, '2021-10-03T10:15:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (487, 197, 919, '2021-02-05T18:31:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (386, 382, 79, '2021-07-23T20:38:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (759, 681, 887, '2021-05-24T21:55:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (240, 952, 943, '2021-04-22T17:55:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (848, 87, 406, '2020-12-18T05:42:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (800, 73, 343, '2021-04-05T14:35:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (253, 188, 289, '2021-08-05T10:42:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (678, 977, 384, '2021-02-06T20:20:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (574, 373, 981, '2021-01-14T09:51:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (24, 438, 723, '2021-04-10T15:33:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (188, 154, 578, '2021-01-15T13:05:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (50, 150, 355, '2021-08-26T11:37:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (824, 934, 318, '2021-07-25T19:55:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (69, 560, 510, '2021-06-18T23:20:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (57, 740, 443, '2021-01-09T19:27:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (71, 486, 457, '2021-07-25T07:20:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (339, 159, 648, '2021-02-09T00:42:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (123, 114, 650, '2021-01-10T11:56:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (273, 44, 359, '2021-08-30T08:56:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (819, 873, 854, '2020-12-28T23:54:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (175, 267, 793, '2021-04-08T01:31:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (836, 662, 852, '2021-03-19T22:32:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (683, 867, 81, '2021-02-12T15:41:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (67, 72, 340, '2021-07-15T04:51:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (532, 467, 173, '2020-12-08T20:51:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (273, 196, 304, '2021-07-21T06:15:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (290, 136, 367, '2021-02-24T04:59:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (542, 826, 273, '2021-11-20T21:23:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (386, 979, 918, '2020-12-09T00:00:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (204, 349, 179, '2021-06-23T19:29:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (526, 75, 369, '2020-12-08T05:33:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (742, 211, 163, '2021-02-05T14:16:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (180, 316, 486, '2021-06-09T03:16:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (828, 786, 217, '2021-11-22T03:09:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (156, 365, 351, '2021-08-15T09:18:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (746, 590, 984, '2021-08-01T11:20:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (361, 253, 400, '2020-11-10T22:10:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (779, 219, 713, '2021-06-28T13:31:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (647, 495, 539, '2021-05-17T15:26:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (184, 799, 748, '2021-08-27T10:54:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (155, 752, 739, '2021-05-29T17:42:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (937, 996, 858, '2021-04-15T17:14:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (385, 428, 993, '2021-04-19T10:12:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (392, 530, 749, '2021-08-31T07:25:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (850, 803, 732, '2021-04-26T02:27:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (252, 550, 622, '2021-11-23T10:53:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (144, 501, 675, '2021-08-30T16:04:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (108, 634, 921, '2021-08-24T16:51:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (258, 984, 434, '2020-12-29T23:01:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (423, 47, 713, '2021-03-13T21:54:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (990, 901, 398, '2021-07-30T21:31:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (442, 135, 139, '2021-09-01T07:59:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (247, 564, 578, '2021-01-17T18:46:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (479, 404, 862, '2021-04-03T11:58:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (723, 36, 544, '2020-12-10T07:02:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (834, 120, 566, '2021-05-29T22:21:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (929, 508, 880, '2021-10-15T14:46:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (589, 49, 789, '2020-12-07T14:03:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (538, 446, 760, '2021-09-30T05:27:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (381, 638, 825, '2021-01-05T04:43:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (857, 885, 119, '2021-01-21T18:45:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (593, 413, 73, '2021-01-27T15:01:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (938, 465, 451, '2021-08-31T04:32:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (249, 95, 346, '2021-09-29T14:28:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (963, 946, 282, '2021-05-18T07:47:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (320, 163, 790, '2021-10-14T16:01:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (71, 607, 127, '2021-01-27T03:08:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (330, 144, 664, '2021-03-04T09:14:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (628, 761, 248, '2021-09-25T21:35:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (805, 893, 732, '2021-07-06T22:41:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (833, 67, 96, '2021-03-03T21:24:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (66, 444, 421, '2021-11-07T20:15:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (859, 948, 229, '2021-01-26T18:37:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (995, 441, 465, '2021-08-01T07:28:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (543, 129, 955, '2020-11-15T22:51:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (953, 220, 692, '2020-12-29T02:45:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (998, 590, 567, '2021-09-23T13:28:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (90, 876, 445, '2021-05-25T12:58:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (255, 206, 650, '2021-10-01T06:34:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (682, 660, 730, '2021-07-12T20:03:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (816, 953, 561, '2021-03-17T20:56:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (663, 300, 265, '2020-12-15T16:46:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (879, 101, 609, '2021-09-05T01:44:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (993, 858, 386, '2021-01-18T23:25:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (95, 649, 908, '2020-11-08T16:51:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (258, 428, 546, '2021-04-15T10:31:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (194, 672, 646, '2021-10-29T18:49:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (18, 731, 120, '2020-11-23T06:21:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (19, 209, 305, '2021-10-25T22:36:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (289, 916, 254, '2021-02-01T15:26:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (405, 487, 986, '2021-06-01T11:07:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (976, 69, 247, '2021-02-17T20:27:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (766, 360, 115, '2021-05-13T09:56:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (698, 665, 476, '2021-08-06T08:34:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (387, 459, 297, '2021-05-13T13:36:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (956, 366, 560, '2020-12-19T04:21:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (104, 986, 530, '2020-11-09T19:56:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (529, 563, 224, '2021-03-29T18:20:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (605, 777, 907, '2021-02-13T16:28:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (385, 172, 665, '2021-02-12T09:16:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (325, 693, 783, '2021-06-24T23:46:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (341, 366, 194, '2021-02-12T17:52:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (255, 238, 505, '2021-09-14T14:35:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (660, 845, 212, '2021-06-30T04:01:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (99, 162, 704, '2021-04-23T03:28:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (174, 547, 968, '2020-12-13T17:03:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (68, 192, 364, '2020-12-23T04:21:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (576, 28, 613, '2021-01-31T05:26:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (444, 609, 263, '2021-10-09T09:12:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (305, 735, 998, '2021-01-22T14:42:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (710, 689, 50, '2021-01-09T09:04:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (782, 1000, 275, '2021-09-16T03:57:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (188, 327, 920, '2020-12-03T13:16:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (228, 632, 829, '2021-05-17T05:52:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (548, 739, 914, '2021-03-27T22:41:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (227, 925, 853, '2021-01-07T08:15:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (719, 92, 933, '2021-07-17T03:22:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (144, 538, 286, '2021-01-27T18:11:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (262, 111, 774, '2021-05-25T05:02:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (954, 941, 652, '2021-07-28T19:51:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (188, 585, 686, '2021-08-01T20:58:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (15, 604, 625, '2021-03-20T16:07:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (363, 945, 344, '2020-11-27T05:06:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (526, 590, 146, '2021-09-30T07:13:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (21, 568, 721, '2021-02-15T03:48:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (586, 720, 255, '2021-02-25T04:17:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (253, 946, 188, '2021-04-04T05:12:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (801, 132, 451, '2021-09-03T07:43:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (852, 606, 409, '2021-06-08T00:43:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (728, 314, 804, '2021-05-02T20:13:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (51, 164, 290, '2021-06-16T23:38:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (341, 252, 832, '2021-08-27T11:11:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (701, 192, 117, '2021-06-28T07:15:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (625, 726, 211, '2021-01-19T19:57:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (234, 469, 28, '2021-07-07T19:32:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (123, 490, 978, '2021-03-14T05:57:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (984, 713, 947, '2021-07-17T11:30:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (380, 235, 201, '2021-05-02T21:26:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (384, 904, 869, '2021-09-18T14:53:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (170, 112, 169, '2021-07-12T07:46:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (736, 265, 255, '2021-07-23T11:04:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (996, 622, 591, '2021-05-15T22:38:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (635, 419, 338, '2021-04-16T13:56:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (349, 104, 323, '2021-08-24T00:19:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (746, 569, 295, '2021-04-06T08:29:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (273, 171, 144, '2021-02-27T10:21:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (500, 542, 66, '2021-11-13T16:15:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (726, 669, 104, '2021-02-27T02:07:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (983, 963, 405, '2020-12-08T16:05:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (597, 435, 727, '2021-03-16T06:42:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (396, 512, 478, '2021-09-18T19:09:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (207, 637, 798, '2020-11-24T05:23:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (553, 335, 191, '2021-05-09T02:29:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (265, 175, 550, '2021-08-07T20:36:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (765, 488, 493, '2020-11-15T01:55:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (975, 371, 779, '2021-04-20T14:08:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (694, 24, 951, '2021-10-30T15:02:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (767, 518, 230, '2021-07-22T04:35:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (548, 590, 240, '2021-01-12T10:50:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (532, 313, 766, '2021-10-26T03:36:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (119, 918, 601, '2020-11-22T08:11:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (892, 572, 242, '2021-09-27T17:00:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (603, 668, 520, '2021-11-06T07:38:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (123, 938, 987, '2020-12-16T09:54:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (965, 701, 338, '2021-04-11T07:16:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (425, 457, 7, '2021-04-09T21:28:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (497, 48, 382, '2021-07-19T23:23:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (793, 518, 322, '2021-01-31T04:05:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (772, 805, 803, '2021-08-19T05:12:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (671, 568, 590, '2021-03-23T01:05:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (800, 747, 768, '2021-04-06T10:09:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (42, 509, 369, '2021-02-06T00:44:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (146, 353, 890, '2021-07-30T06:48:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (32, 411, 722, '2021-08-04T09:59:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (969, 653, 517, '2020-12-27T11:16:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (492, 440, 97, '2020-11-05T20:01:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (811, 708, 887, '2021-10-18T22:06:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (896, 809, 961, '2021-04-20T09:01:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (570, 693, 22, '2021-03-31T01:32:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (213, 363, 223, '2021-01-18T22:22:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (864, 855, 261, '2020-11-21T17:31:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (287, 544, 116, '2021-02-02T09:34:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (941, 847, 907, '2021-11-05T15:07:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (254, 749, 993, '2021-03-18T03:55:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (506, 978, 521, '2020-12-04T09:53:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (379, 20, 538, '2021-02-01T03:13:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (494, 252, 793, '2021-08-15T02:13:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (766, 858, 400, '2020-11-28T14:39:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (298, 74, 864, '2021-08-06T15:41:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (697, 438, 343, '2021-07-23T06:57:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (461, 787, 963, '2021-08-27T06:25:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (180, 295, 79, '2021-03-13T11:58:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (801, 319, 995, '2021-11-15T14:22:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (417, 690, 355, '2021-08-01T08:26:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (78, 627, 677, '2021-03-01T12:31:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (603, 67, 587, '2021-02-07T05:48:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (57, 607, 786, '2021-03-05T03:43:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (768, 35, 231, '2020-12-18T13:24:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (923, 101, 475, '2021-01-29T23:40:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (880, 192, 686, '2021-05-15T15:53:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (466, 527, 293, '2021-10-26T09:16:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (234, 965, 254, '2021-01-19T17:03:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (19, 945, 456, '2020-12-31T17:19:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (97, 160, 892, '2021-07-25T05:36:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (263, 115, 819, '2021-04-13T15:52:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (434, 871, 971, '2021-01-31T07:54:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (645, 305, 892, '2021-01-12T10:53:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (782, 200, 602, '2021-01-12T15:21:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (127, 666, 136, '2021-11-08T00:04:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (10, 669, 684, '2021-10-31T00:23:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (683, 123, 440, '2021-04-20T08:35:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (164, 803, 476, '2021-07-07T13:33:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (264, 292, 150, '2021-02-20T02:19:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (229, 238, 853, '2021-04-20T20:35:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (663, 256, 112, '2021-08-20T03:01:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (190, 296, 432, '2021-11-16T07:57:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (671, 616, 473, '2021-05-07T15:36:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (326, 365, 127, '2021-08-27T17:57:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (581, 350, 915, '2020-11-12T14:58:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (895, 913, 431, '2021-02-16T23:37:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (521, 276, 731, '2021-05-03T23:24:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (348, 523, 542, '2021-03-24T07:18:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (898, 664, 656, '2021-11-11T16:23:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (752, 117, 437, '2021-02-03T18:00:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (22, 239, 7, '2021-04-08T16:53:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (870, 714, 827, '2021-03-05T20:34:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (639, 472, 443, '2020-12-17T17:47:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (660, 883, 844, '2020-11-07T14:00:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (89, 859, 646, '2021-08-14T19:24:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (644, 841, 299, '2021-11-10T12:00:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (180, 764, 73, '2021-04-04T02:47:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (613, 92, 44, '2021-07-04T14:42:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (98, 175, 508, '2021-11-23T03:12:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (482, 638, 9, '2021-01-07T16:07:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (173, 249, 873, '2021-01-02T13:03:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (103, 768, 635, '2021-01-03T10:51:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (609, 174, 244, '2021-07-01T04:28:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (140, 113, 144, '2021-07-25T09:30:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (808, 692, 47, '2021-09-17T14:07:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (628, 502, 874, '2021-04-14T23:38:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (910, 208, 788, '2021-05-23T19:00:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (125, 416, 624, '2020-12-16T14:43:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (668, 5, 435, '2021-06-07T21:43:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (313, 979, 20, '2021-05-15T10:33:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (675, 78, 682, '2021-04-17T00:19:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (743, 47, 262, '2021-04-02T08:43:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (521, 358, 425, '2021-11-09T14:20:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (167, 169, 377, '2021-06-05T12:43:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (168, 159, 591, '2021-01-19T03:33:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (339, 491, 79, '2021-08-28T22:49:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (172, 240, 452, '2021-01-06T06:15:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (255, 745, 239, '2021-05-08T00:23:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (302, 606, 228, '2020-11-01T00:04:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (565, 501, 171, '2021-04-29T23:40:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (901, 626, 329, '2021-08-31T13:01:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (934, 630, 448, '2021-06-15T13:12:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (373, 762, 512, '2021-02-05T02:31:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (985, 829, 627, '2021-10-20T22:49:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (531, 165, 770, '2021-06-07T12:17:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (893, 803, 471, '2021-10-06T06:29:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (924, 268, 294, '2021-06-27T01:42:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (460, 220, 154, '2021-10-25T09:56:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (703, 526, 932, '2021-03-30T00:01:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (193, 655, 215, '2021-05-12T10:42:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (437, 480, 151, '2021-11-19T14:32:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (213, 143, 422, '2021-07-23T08:15:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (846, 73, 759, '2020-12-14T14:28:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (827, 599, 709, '2021-04-20T18:33:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (396, 128, 46, '2021-02-22T14:28:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (128, 843, 600, '2021-03-13T09:18:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (452, 40, 142, '2020-11-24T07:30:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (173, 275, 427, '2021-07-17T12:07:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (262, 862, 469, '2021-01-09T17:14:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (192, 868, 238, '2021-02-19T21:59:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (218, 526, 440, '2021-01-11T13:03:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (811, 923, 363, '2021-11-05T12:44:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (110, 516, 292, '2021-05-08T17:29:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (895, 933, 385, '2021-09-03T07:35:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (267, 805, 881, '2021-02-20T06:33:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (685, 326, 851, '2021-10-22T05:21:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (247, 753, 268, '2021-01-07T13:37:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (867, 684, 708, '2021-11-12T11:40:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (808, 453, 1, '2021-04-28T05:00:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (272, 47, 755, '2021-04-17T20:26:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (996, 821, 686, '2021-01-12T21:14:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (728, 619, 864, '2021-01-21T17:15:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (165, 132, 426, '2021-11-18T20:06:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (799, 159, 319, '2021-05-20T18:32:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (935, 167, 29, '2021-07-09T02:36:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (984, 258, 615, '2021-06-06T13:48:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (841, 715, 504, '2021-07-03T17:17:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (301, 229, 266, '2021-08-18T13:00:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (265, 171, 938, '2021-10-03T10:15:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (590, 593, 469, '2021-02-14T07:13:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (367, 837, 589, '2021-03-05T22:42:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (622, 813, 783, '2021-03-04T23:36:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (101, 237, 482, '2021-08-25T15:37:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (282, 866, 215, '2021-11-17T11:08:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (664, 909, 466, '2021-01-13T12:53:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (68, 574, 909, '2021-05-27T00:04:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (99, 91, 528, '2021-05-02T11:44:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (95, 621, 10, '2021-09-10T01:47:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (585, 736, 750, '2021-06-23T16:31:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (809, 472, 47, '2021-05-23T11:22:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (986, 66, 85, '2021-06-06T19:23:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (175, 356, 524, '2021-11-21T15:25:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (795, 96, 851, '2021-10-26T14:28:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (734, 222, 260, '2021-04-30T05:49:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (230, 525, 894, '2021-09-20T02:22:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (888, 469, 880, '2020-12-16T15:37:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (85, 20, 289, '2021-06-16T23:42:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (956, 566, 111, '2021-08-02T00:24:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (558, 498, 627, '2021-06-26T01:01:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (804, 117, 1, '2020-11-22T17:33:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (372, 335, 267, '2020-12-10T06:42:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (423, 865, 422, '2021-06-27T21:53:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (48, 547, 926, '2021-02-10T20:04:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (278, 768, 415, '2021-04-24T14:43:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (655, 398, 900, '2021-03-16T14:02:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (527, 663, 946, '2021-08-23T14:54:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (476, 146, 49, '2021-01-04T15:25:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (650, 393, 914, '2021-01-27T22:26:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (56, 456, 43, '2021-07-18T00:30:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (694, 270, 686, '2021-03-27T09:29:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (429, 601, 888, '2021-07-26T04:18:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (383, 230, 389, '2021-06-26T04:03:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (853, 968, 330, '2021-09-16T01:29:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (653, 445, 668, '2020-12-15T09:46:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (738, 793, 870, '2021-06-23T20:52:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (18, 84, 686, '2021-01-15T13:30:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (652, 134, 91, '2021-10-15T18:36:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (115, 66, 150, '2021-01-11T06:46:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (333, 685, 963, '2021-07-06T14:14:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (227, 408, 563, '2021-08-31T04:29:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (543, 149, 829, '2021-01-19T22:31:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (640, 470, 347, '2021-02-18T20:22:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (859, 438, 686, '2020-11-29T05:49:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (598, 689, 569, '2021-01-04T02:20:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (815, 16, 446, '2021-11-12T15:16:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (271, 233, 395, '2021-10-08T21:42:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (74, 506, 371, '2021-05-24T14:18:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (905, 938, 46, '2021-02-04T02:41:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (670, 853, 548, '2021-10-17T02:49:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (951, 368, 174, '2021-05-31T14:52:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (178, 981, 644, '2021-10-21T12:08:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (335, 101, 169, '2021-08-17T07:16:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (132, 737, 711, '2020-11-30T05:58:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (840, 224, 504, '2020-11-03T07:41:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (647, 859, 513, '2021-07-02T05:13:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (469, 94, 347, '2021-02-23T22:04:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (732, 687, 668, '2021-06-02T10:24:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (323, 173, 883, '2021-11-01T15:11:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (684, 492, 84, '2021-02-14T01:54:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (764, 112, 780, '2021-09-29T06:00:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (447, 389, 188, '2021-06-28T06:26:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (685, 29, 439, '2021-08-20T07:45:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (223, 348, 65, '2021-10-16T02:12:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (869, 25, 9, '2020-12-25T01:50:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (825, 411, 678, '2021-08-01T19:36:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (9, 720, 198, '2021-08-22T14:00:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (968, 621, 715, '2020-11-10T19:13:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (682, 60, 73, '2021-09-23T02:53:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (940, 425, 641, '2021-08-09T13:22:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (119, 856, 50, '2021-11-17T22:48:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (745, 508, 892, '2021-04-26T14:58:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (990, 844, 211, '2021-10-05T15:17:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (236, 455, 834, '2021-03-19T01:30:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (286, 225, 1, '2021-03-19T21:13:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (310, 701, 400, '2021-01-03T00:34:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (204, 1, 902, '2021-04-20T01:48:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (314, 445, 583, '2021-08-19T05:14:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (923, 293, 928, '2020-12-23T15:15:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (195, 882, 914, '2021-04-21T06:46:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (514, 344, 706, '2021-06-08T22:49:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (593, 99, 496, '2021-11-12T12:39:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (235, 421, 172, '2021-02-23T06:18:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (78, 823, 215, '2021-08-06T10:36:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (777, 503, 934, '2021-09-19T10:34:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (301, 698, 330, '2021-01-06T23:50:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (198, 650, 190, '2021-02-08T00:23:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (316, 891, 797, '2021-06-27T21:42:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (13, 666, 358, '2021-06-06T12:43:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (191, 386, 908, '2020-11-20T10:26:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (9, 407, 359, '2021-02-17T22:21:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (355, 795, 590, '2021-05-30T02:07:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (306, 229, 601, '2021-07-14T16:51:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (345, 432, 235, '2021-04-09T00:02:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (623, 791, 256, '2021-05-16T08:58:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (141, 384, 233, '2021-05-24T13:57:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (516, 701, 285, '2021-09-13T22:33:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (106, 922, 77, '2021-09-17T18:14:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (119, 508, 293, '2021-01-07T13:36:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (479, 400, 140, '2021-05-13T22:37:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (266, 508, 888, '2021-10-23T18:19:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (595, 910, 967, '2021-10-23T18:05:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (58, 398, 44, '2021-05-06T06:17:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (953, 753, 468, '2021-10-06T05:54:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (737, 784, 954, '2021-10-17T23:18:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (702, 52, 600, '2020-11-24T02:45:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (46, 77, 712, '2021-08-13T05:49:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (444, 844, 271, '2021-07-08T13:56:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (303, 801, 908, '2021-07-31T13:45:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (657, 856, 547, '2021-06-20T04:14:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (94, 871, 105, '2021-05-05T10:54:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (118, 957, 933, '2021-07-14T03:39:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (132, 570, 151, '2021-05-14T07:32:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (382, 699, 293, '2021-10-13T01:11:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (113, 820, 676, '2021-08-07T23:18:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (676, 945, 126, '2021-05-05T04:11:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (324, 987, 6, '2020-12-17T17:25:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (655, 63, 14, '2021-08-24T19:37:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (89, 282, 743, '2021-06-04T15:49:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (810, 731, 29, '2021-04-21T12:26:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (631, 922, 859, '2021-07-16T08:20:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (513, 246, 803, '2021-02-25T21:42:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (875, 14, 371, '2021-07-23T00:19:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (167, 926, 312, '2021-10-17T20:20:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (354, 526, 726, '2021-06-28T09:08:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (304, 974, 115, '2020-11-24T07:42:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (209, 826, 73, '2020-11-29T09:31:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (988, 595, 159, '2021-04-13T00:31:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (932, 799, 379, '2021-06-07T02:26:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (330, 478, 321, '2021-10-30T01:05:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (989, 91, 805, '2021-04-29T18:20:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (858, 546, 13, '2021-04-27T04:09:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (229, 34, 950, '2021-07-20T12:23:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (950, 639, 353, '2020-12-01T04:01:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (646, 907, 929, '2021-01-01T22:48:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (587, 233, 639, '2021-01-12T21:45:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (387, 654, 516, '2021-05-09T12:40:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (953, 96, 914, '2021-02-15T16:00:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (97, 815, 106, '2021-10-05T01:11:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (167, 760, 165, '2021-05-15T22:10:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (344, 665, 184, '2021-02-08T18:11:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (738, 4, 333, '2021-05-31T01:36:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (123, 409, 827, '2021-07-25T17:00:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (715, 363, 210, '2021-10-21T12:12:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (460, 195, 527, '2021-04-23T12:41:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (599, 210, 326, '2020-11-17T04:43:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (662, 147, 884, '2021-07-24T23:05:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (493, 950, 684, '2020-12-04T07:51:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (304, 857, 163, '2021-08-28T11:55:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (737, 223, 963, '2021-01-16T11:29:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (744, 535, 244, '2021-10-02T04:16:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (782, 634, 729, '2021-11-14T23:44:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (371, 158, 280, '2020-12-31T05:17:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (355, 261, 169, '2021-09-06T15:35:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (929, 366, 107, '2021-01-16T03:07:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (463, 325, 222, '2021-11-13T01:43:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (166, 597, 412, '2021-04-25T15:19:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (657, 777, 265, '2021-08-22T02:55:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (249, 114, 210, '2021-02-07T09:51:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (390, 651, 945, '2021-04-05T00:08:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (689, 81, 681, '2021-09-19T07:16:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (816, 109, 71, '2021-10-31T16:10:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (514, 778, 683, '2021-06-15T09:33:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (396, 22, 220, '2021-10-03T21:47:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (511, 925, 642, '2021-11-08T17:12:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (206, 584, 788, '2021-06-17T00:52:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (623, 51, 959, '2021-01-11T15:07:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (445, 849, 726, '2021-05-05T19:16:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (163, 68, 565, '2021-08-31T22:43:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (791, 159, 740, '2021-06-07T13:00:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (989, 465, 564, '2021-04-14T22:35:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (310, 267, 838, '2021-01-25T04:12:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (592, 136, 379, '2021-02-06T07:10:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (59, 462, 284, '2021-02-27T00:33:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (803, 836, 750, '2021-10-25T22:30:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (994, 157, 749, '2021-08-04T04:50:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (250, 665, 159, '2021-09-24T12:04:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (809, 782, 163, '2021-11-13T23:03:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (904, 102, 714, '2021-08-23T02:14:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (179, 685, 970, '2021-11-10T01:32:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (722, 462, 901, '2021-08-03T02:26:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (309, 856, 3, '2021-04-03T15:03:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (88, 542, 501, '2021-09-01T08:28:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (822, 29, 477, '2021-10-30T23:28:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (562, 88, 14, '2021-01-09T18:53:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (732, 575, 625, '2021-08-15T23:26:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (638, 169, 400, '2021-05-02T06:55:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (542, 800, 178, '2021-01-08T02:34:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (445, 464, 377, '2020-12-16T18:02:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (519, 852, 782, '2021-08-16T16:18:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (524, 134, 760, '2021-01-30T03:20:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (198, 303, 89, '2021-08-26T12:20:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (304, 801, 480, '2021-08-18T11:55:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (872, 575, 493, '2021-07-08T07:31:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (744, 17, 273, '2021-07-14T19:33:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (479, 269, 151, '2021-05-03T17:06:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (68, 215, 488, '2021-10-12T22:10:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (595, 740, 564, '2021-03-13T19:04:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (696, 854, 141, '2021-10-07T12:51:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (45, 423, 901, '2021-10-21T12:50:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (574, 348, 274, '2021-01-09T04:29:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (101, 70, 706, '2021-03-05T14:02:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (290, 673, 931, '2021-03-04T18:36:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (431, 216, 636, '2021-07-31T10:41:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (257, 204, 521, '2021-05-03T08:22:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (290, 712, 998, '2021-08-17T15:40:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (136, 928, 756, '2021-03-14T19:16:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (103, 30, 426, '2021-09-04T09:25:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (318, 578, 352, '2021-11-02T18:24:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (903, 85, 671, '2021-03-27T09:13:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (10, 352, 844, '2020-12-06T05:46:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (690, 503, 992, '2021-02-10T19:04:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (935, 152, 518, '2021-03-29T03:45:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (699, 91, 569, '2021-04-21T04:17:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (697, 148, 19, '2021-04-07T19:55:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (403, 867, 752, '2021-06-04T01:39:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (259, 266, 343, '2021-09-10T01:07:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (495, 775, 183, '2020-12-31T06:00:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (482, 337, 715, '2021-05-27T19:44:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (774, 394, 332, '2021-11-14T12:36:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (722, 423, 732, '2021-10-05T21:02:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (997, 841, 528, '2021-04-28T14:52:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (597, 565, 637, '2020-11-29T02:09:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (715, 822, 895, '2021-01-31T05:35:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (375, 261, 827, '2021-10-21T23:22:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (252, 851, 566, '2020-11-30T19:37:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (406, 459, 224, '2021-04-14T04:55:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (222, 504, 56, '2021-09-06T06:52:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (219, 835, 312, '2021-08-10T00:57:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (472, 670, 522, '2020-12-30T13:23:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (587, 259, 890, '2021-11-11T03:55:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (348, 942, 366, '2020-12-04T13:23:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (636, 538, 919, '2021-11-05T19:52:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (316, 928, 270, '2020-11-20T08:17:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (379, 754, 837, '2021-07-17T07:26:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (723, 589, 754, '2020-12-03T04:07:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (433, 709, 426, '2021-10-22T20:08:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (508, 285, 361, '2021-05-02T16:59:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (736, 82, 536, '2021-01-20T09:31:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (853, 128, 679, '2021-02-24T12:01:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (928, 914, 937, '2020-12-15T05:14:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (383, 860, 988, '2021-03-22T10:05:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (953, 350, 524, '2021-04-22T17:40:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (112, 194, 99, '2021-04-17T12:14:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (974, 79, 217, '2021-01-12T12:04:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (525, 186, 680, '2021-02-04T20:13:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (540, 119, 22, '2021-07-14T21:17:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (489, 603, 595, '2020-12-29T23:23:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (442, 906, 20, '2021-11-09T03:38:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (40, 380, 845, '2021-07-04T19:35:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (300, 382, 616, '2021-01-10T09:08:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (303, 392, 211, '2021-04-14T15:26:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (948, 830, 814, '2021-06-05T01:31:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (106, 128, 681, '2021-08-15T08:31:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (581, 726, 851, '2021-08-15T18:11:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (69, 33, 905, '2021-04-05T19:02:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (716, 262, 515, '2021-03-30T20:12:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (776, 791, 392, '2021-01-24T01:35:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (742, 151, 74, '2020-11-29T22:33:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (634, 279, 770, '2021-01-06T06:21:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (755, 963, 136, '2021-09-09T12:54:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (298, 345, 377, '2021-06-08T17:40:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (846, 151, 867, '2021-09-25T17:36:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (478, 890, 630, '2020-11-01T19:16:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (337, 815, 33, '2020-12-31T14:11:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (823, 143, 116, '2021-04-20T14:30:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (440, 638, 308, '2021-01-06T20:14:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (670, 548, 992, '2020-12-17T01:51:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (237, 452, 376, '2020-11-21T14:57:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (803, 7, 109, '2021-01-07T20:13:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (374, 482, 458, '2021-08-03T19:17:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (92, 223, 366, '2021-08-30T17:04:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (941, 755, 515, '2021-08-13T17:14:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (655, 916, 369, '2020-11-03T23:45:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (760, 134, 418, '2021-05-14T19:14:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (744, 608, 289, '2021-04-22T23:41:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (803, 584, 492, '2021-07-25T17:00:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (310, 441, 333, '2021-03-23T09:57:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (149, 276, 719, '2021-04-09T20:36:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (244, 787, 992, '2021-11-14T20:06:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (746, 376, 789, '2021-07-24T10:08:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (597, 739, 938, '2021-05-14T12:06:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (824, 654, 120, '2021-05-13T16:45:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (279, 138, 78, '2021-02-21T08:52:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (751, 66, 429, '2021-02-26T23:36:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (394, 794, 355, '2021-07-02T08:27:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (169, 958, 968, '2021-07-18T06:03:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (573, 833, 765, '2020-12-03T04:37:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (850, 794, 274, '2020-12-31T16:53:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (477, 303, 470, '2021-11-11T00:47:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (348, 533, 254, '2021-07-28T11:40:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (603, 213, 973, '2021-11-01T20:10:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (1000, 326, 407, '2021-09-02T00:40:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (781, 493, 193, '2021-02-05T22:59:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (553, 808, 12, '2021-09-25T22:05:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (155, 842, 354, '2021-02-03T21:29:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (987, 318, 318, '2021-09-11T08:04:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (54, 660, 57, '2021-11-01T17:23:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (826, 145, 340, '2021-03-01T14:54:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (12, 358, 16, '2020-12-01T11:24:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (72, 714, 851, '2021-03-09T12:05:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (24, 650, 826, '2020-12-23T15:56:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (333, 441, 57, '2021-07-28T17:03:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (340, 758, 44, '2021-04-19T04:23:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (978, 330, 63, '2021-06-12T15:07:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (680, 742, 479, '2021-01-11T12:53:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (992, 563, 340, '2021-10-06T06:48:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (42, 280, 566, '2021-02-16T12:35:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (957, 860, 582, '2021-08-12T21:00:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (573, 413, 136, '2021-09-28T21:01:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (708, 966, 284, '2021-05-26T04:31:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (52, 536, 54, '2021-05-22T08:39:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (649, 531, 517, '2021-01-12T03:49:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (777, 80, 147, '2021-11-11T18:53:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (694, 794, 389, '2021-08-04T05:38:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (50, 541, 780, '2021-08-05T21:26:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (177, 623, 758, '2020-12-15T03:34:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (604, 320, 358, '2021-02-15T08:36:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (281, 541, 741, '2020-12-05T11:47:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (318, 253, 409, '2021-03-17T07:53:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (253, 179, 265, '2021-06-27T16:23:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (63, 135, 111, '2021-01-28T02:23:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (390, 674, 513, '2020-11-15T12:30:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (68, 870, 40, '2021-01-02T17:48:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (486, 400, 795, '2021-03-09T16:45:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (765, 431, 818, '2021-10-09T22:57:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (506, 191, 445, '2020-12-01T23:29:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (784, 892, 764, '2021-02-08T23:06:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (349, 661, 685, '2021-01-24T22:51:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (109, 415, 587, '2021-02-14T08:17:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (701, 548, 172, '2020-11-15T01:26:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (661, 373, 678, '2021-07-25T17:42:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (869, 998, 202, '2021-05-19T04:27:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (348, 283, 223, '2021-05-07T20:52:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (220, 87, 606, '2021-05-05T12:58:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (556, 816, 573, '2021-10-16T02:40:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (750, 391, 533, '2021-08-03T10:38:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (997, 19, 778, '2021-05-26T14:21:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (71, 820, 387, '2020-11-12T23:31:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (415, 956, 488, '2021-06-11T03:20:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (544, 826, 219, '2020-12-02T05:12:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (666, 790, 806, '2021-10-21T02:31:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (78, 295, 787, '2021-07-25T01:54:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (986, 576, 2, '2021-05-25T01:46:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (398, 677, 659, '2021-06-18T08:16:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (882, 1, 581, '2021-04-25T13:36:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (308, 30, 862, '2021-03-12T07:20:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (442, 959, 531, '2021-04-11T13:15:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (861, 448, 31, '2021-09-17T03:56:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (580, 777, 313, '2021-02-03T06:16:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (724, 490, 385, '2021-11-15T07:29:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (336, 64, 620, '2021-06-25T17:52:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (813, 716, 301, '2020-11-23T21:42:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (366, 66, 158, '2021-10-19T06:19:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (1000, 612, 570, '2021-11-09T01:53:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (847, 731, 104, '2021-01-03T05:19:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (174, 795, 927, '2021-08-19T05:50:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (376, 718, 627, '2020-12-11T02:18:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (322, 691, 984, '2021-04-13T09:50:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (639, 387, 612, '2020-11-07T03:09:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (540, 308, 466, '2021-04-03T14:10:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (391, 569, 425, '2021-02-25T15:50:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (568, 360, 122, '2021-04-01T21:50:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (24, 623, 927, '2021-07-31T19:11:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (270, 350, 768, '2021-10-17T01:08:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (858, 308, 133, '2021-10-27T19:14:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (751, 625, 14, '2021-01-22T06:22:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (540, 250, 384, '2020-12-08T01:32:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (701, 832, 320, '2021-05-11T10:11:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (27, 516, 90, '2021-07-07T01:56:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (542, 668, 598, '2020-12-16T10:54:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (217, 926, 630, '2021-01-30T00:21:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (323, 688, 767, '2020-11-05T07:44:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (329, 924, 589, '2021-11-19T14:49:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (952, 140, 958, '2021-02-09T02:56:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (97, 398, 451, '2021-02-06T12:15:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (918, 847, 870, '2021-11-10T20:19:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (11, 29, 359, '2021-07-28T07:50:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (102, 394, 383, '2021-01-19T19:09:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (688, 30, 798, '2021-06-02T14:38:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (810, 147, 871, '2021-01-15T10:32:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (912, 445, 183, '2021-06-15T12:03:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (925, 301, 943, '2021-10-01T18:35:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (44, 898, 462, '2021-11-15T22:42:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (767, 686, 240, '2021-04-12T02:57:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (497, 279, 503, '2020-11-11T16:11:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (486, 124, 23, '2021-03-29T12:36:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (588, 7, 657, '2021-09-30T02:45:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (905, 192, 164, '2021-07-07T11:39:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (180, 507, 512, '2021-09-17T02:36:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (44, 433, 49, '2021-07-19T06:37:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (976, 632, 390, '2021-01-05T22:08:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (10, 21, 583, '2021-06-13T08:46:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (337, 174, 975, '2021-02-22T00:29:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (712, 145, 873, '2020-12-20T11:28:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (312, 293, 931, '2021-08-31T04:33:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (542, 921, 765, '2020-12-11T01:40:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (933, 254, 725, '2021-08-01T09:51:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (703, 971, 504, '2021-05-09T18:13:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (972, 232, 190, '2020-12-10T15:21:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (858, 861, 413, '2020-11-05T07:29:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (144, 197, 708, '2021-02-19T15:02:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (777, 296, 733, '2021-09-16T00:00:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (526, 298, 88, '2021-05-07T06:39:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (755, 892, 200, '2021-03-08T20:36:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (864, 924, 688, '2021-03-29T08:14:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (702, 646, 351, '2021-04-29T10:23:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (153, 310, 744, '2021-07-30T00:10:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (382, 759, 354, '2021-01-19T13:35:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (207, 494, 821, '2021-04-18T20:44:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (723, 7, 36, '2020-11-05T13:04:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (218, 525, 352, '2020-11-12T06:53:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (578, 212, 65, '2021-04-13T23:14:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (544, 472, 623, '2020-11-20T18:43:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (362, 977, 486, '2021-01-09T23:35:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (86, 974, 226, '2021-08-06T12:53:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (834, 326, 335, '2021-08-05T12:36:24Z');
insert into user_orders (user_id, certificate_id, price, date)
values (601, 839, 192, '2021-09-25T05:29:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (754, 999, 390, '2021-03-28T22:27:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (590, 532, 616, '2021-02-08T23:18:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (476, 742, 792, '2020-11-07T06:16:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (295, 858, 460, '2021-03-13T19:39:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (38, 672, 776, '2021-05-19T21:35:11Z');
insert into user_orders (user_id, certificate_id, price, date)
values (601, 665, 776, '2021-09-18T21:11:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (491, 346, 526, '2021-10-27T02:47:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (527, 96, 836, '2021-01-28T21:00:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (393, 185, 301, '2021-05-13T09:47:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (493, 11, 216, '2021-02-11T00:31:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (418, 134, 397, '2021-06-30T15:09:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (724, 784, 217, '2021-05-26T07:49:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (416, 735, 1000, '2021-11-03T11:38:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (340, 824, 612, '2020-12-03T11:37:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (337, 77, 878, '2021-07-03T10:28:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (64, 727, 171, '2021-05-19T03:15:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (3, 365, 392, '2021-02-16T03:33:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (325, 943, 735, '2021-01-08T07:20:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (921, 346, 567, '2020-11-24T05:40:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (304, 207, 353, '2021-02-27T22:49:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (464, 897, 63, '2021-04-17T03:37:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (504, 699, 737, '2021-09-04T23:23:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (727, 99, 428, '2021-06-11T22:34:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (108, 535, 626, '2021-10-06T08:19:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (990, 110, 349, '2020-11-05T16:09:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (622, 334, 765, '2021-11-11T02:40:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (464, 506, 443, '2021-09-04T14:02:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (661, 284, 902, '2021-01-11T18:06:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (792, 812, 252, '2021-07-05T21:56:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (252, 145, 537, '2021-06-12T01:26:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (904, 967, 602, '2021-02-18T07:59:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (302, 586, 72, '2021-09-01T08:15:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (573, 236, 744, '2021-08-16T01:17:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (487, 887, 72, '2021-07-13T09:56:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (472, 63, 341, '2021-09-13T02:57:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (59, 736, 145, '2021-01-22T13:24:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (579, 111, 3, '2021-08-14T00:47:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (3, 796, 873, '2021-07-21T13:04:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (253, 484, 121, '2021-01-18T14:38:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (381, 223, 820, '2021-10-18T17:45:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (143, 382, 428, '2020-11-26T13:14:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (850, 145, 856, '2021-08-12T21:01:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (200, 84, 357, '2021-02-03T01:41:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (491, 754, 272, '2021-03-23T20:03:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (940, 826, 718, '2021-04-10T08:12:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (638, 699, 347, '2021-01-20T19:57:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (873, 876, 813, '2021-10-08T17:51:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (518, 71, 406, '2021-04-15T16:05:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (618, 57, 895, '2020-11-05T02:02:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (467, 860, 545, '2020-12-11T03:08:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (336, 915, 132, '2021-05-28T06:36:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (597, 694, 197, '2020-12-14T14:06:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (80, 333, 174, '2021-10-02T13:45:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (187, 714, 800, '2021-03-03T12:31:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (855, 548, 153, '2021-07-22T20:37:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (205, 932, 738, '2020-11-22T00:28:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (262, 586, 209, '2021-11-11T23:53:27Z');
insert into user_orders (user_id, certificate_id, price, date)
values (971, 122, 74, '2021-01-04T19:44:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (63, 377, 884, '2021-07-06T04:15:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (615, 67, 266, '2021-02-08T07:01:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (796, 917, 538, '2021-07-20T05:04:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (446, 113, 333, '2021-07-03T11:37:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (424, 392, 898, '2020-11-12T04:27:19Z');
insert into user_orders (user_id, certificate_id, price, date)
values (919, 100, 821, '2021-02-14T21:07:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (404, 621, 959, '2021-05-25T07:36:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (333, 840, 119, '2021-09-10T04:06:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (645, 895, 55, '2021-07-30T07:57:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (313, 103, 792, '2021-09-05T16:20:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (961, 456, 726, '2021-02-27T14:12:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (598, 876, 972, '2020-12-02T04:02:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (667, 985, 866, '2020-11-04T21:22:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (636, 271, 151, '2021-03-21T02:13:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (690, 169, 184, '2021-10-31T21:41:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (330, 520, 961, '2021-05-30T03:02:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (248, 300, 2, '2021-08-20T14:04:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (193, 268, 354, '2021-10-01T01:34:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (989, 294, 933, '2021-06-06T23:11:16Z');
insert into user_orders (user_id, certificate_id, price, date)
values (730, 760, 101, '2021-03-15T12:21:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (526, 896, 37, '2021-08-19T21:52:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (183, 308, 455, '2021-06-05T01:47:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (920, 198, 119, '2021-09-29T02:07:03Z');
insert into user_orders (user_id, certificate_id, price, date)
values (753, 81, 939, '2021-09-08T15:23:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (902, 571, 913, '2021-03-01T10:18:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (531, 135, 679, '2021-11-03T01:48:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (655, 750, 472, '2021-05-11T12:25:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (449, 406, 822, '2021-10-26T02:54:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (277, 985, 112, '2021-07-21T21:55:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (771, 978, 465, '2021-10-20T12:04:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (931, 212, 505, '2020-12-23T11:37:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (801, 434, 183, '2021-07-28T16:13:05Z');
insert into user_orders (user_id, certificate_id, price, date)
values (39, 898, 399, '2021-01-15T07:40:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (532, 388, 405, '2021-03-31T07:25:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (956, 379, 350, '2021-05-12T09:02:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (843, 126, 879, '2021-02-02T12:03:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (693, 719, 14, '2021-02-09T07:09:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (750, 242, 193, '2021-01-01T00:35:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (784, 56, 641, '2021-07-06T19:52:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (100, 395, 282, '2020-12-13T05:51:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (82, 404, 74, '2020-11-21T13:03:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (954, 510, 760, '2020-11-24T02:06:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (535, 638, 413, '2020-12-10T15:47:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (947, 456, 169, '2021-08-14T12:59:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (284, 778, 89, '2021-09-16T06:11:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (69, 242, 712, '2021-05-03T10:09:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (872, 226, 955, '2021-08-27T15:05:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (83, 408, 621, '2021-07-13T19:07:26Z');
insert into user_orders (user_id, certificate_id, price, date)
values (741, 366, 49, '2021-09-07T21:45:20Z');
insert into user_orders (user_id, certificate_id, price, date)
values (358, 650, 147, '2021-05-01T05:08:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (999, 176, 373, '2021-11-17T20:36:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (15, 814, 889, '2021-06-26T04:52:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (17, 942, 226, '2021-09-09T09:22:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (927, 573, 552, '2021-09-23T23:32:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (470, 368, 577, '2021-06-06T21:09:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (340, 390, 923, '2020-11-01T15:45:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (405, 396, 503, '2021-01-05T17:01:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (723, 466, 787, '2021-01-13T19:54:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (199, 736, 534, '2021-08-27T14:49:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (434, 742, 900, '2021-01-13T12:06:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (868, 510, 620, '2021-03-17T13:42:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (264, 385, 173, '2020-11-18T07:34:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (195, 958, 681, '2021-08-14T09:43:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (181, 618, 919, '2021-08-30T13:50:08Z');
insert into user_orders (user_id, certificate_id, price, date)
values (536, 358, 863, '2021-01-06T09:02:34Z');
insert into user_orders (user_id, certificate_id, price, date)
values (39, 664, 317, '2021-07-20T00:32:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (929, 219, 232, '2021-11-12T10:58:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (732, 585, 733, '2021-05-26T22:01:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (204, 690, 845, '2021-01-30T06:43:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (588, 602, 833, '2021-10-23T20:53:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (256, 402, 64, '2021-09-18T08:05:04Z');
insert into user_orders (user_id, certificate_id, price, date)
values (881, 722, 887, '2021-08-01T23:13:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (980, 473, 341, '2020-11-10T23:21:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (836, 553, 571, '2021-08-12T05:43:32Z');
insert into user_orders (user_id, certificate_id, price, date)
values (360, 986, 925, '2021-03-07T13:39:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (907, 905, 182, '2020-11-19T03:21:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (804, 243, 34, '2021-08-18T01:56:14Z');
insert into user_orders (user_id, certificate_id, price, date)
values (509, 51, 993, '2021-06-19T23:09:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (594, 44, 144, '2021-06-13T21:08:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (714, 192, 806, '2021-04-01T11:16:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (428, 771, 790, '2021-06-05T11:03:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (965, 934, 261, '2020-12-23T07:56:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (962, 106, 37, '2021-06-11T19:42:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (34, 452, 160, '2021-04-25T09:22:06Z');
insert into user_orders (user_id, certificate_id, price, date)
values (260, 842, 671, '2021-08-24T04:50:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (806, 350, 15, '2021-04-26T06:39:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (552, 583, 685, '2021-03-17T01:20:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (62, 550, 1000, '2021-06-27T23:39:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (778, 517, 906, '2021-08-11T06:39:29Z');
insert into user_orders (user_id, certificate_id, price, date)
values (63, 724, 136, '2021-06-03T01:32:09Z');
insert into user_orders (user_id, certificate_id, price, date)
values (536, 394, 419, '2021-06-04T18:36:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (871, 925, 7, '2021-04-21T08:26:01Z');
insert into user_orders (user_id, certificate_id, price, date)
values (58, 544, 86, '2021-03-30T15:23:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (786, 112, 116, '2021-01-23T16:15:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (268, 830, 689, '2021-01-31T23:55:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (590, 377, 68, '2020-11-02T14:46:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (781, 426, 314, '2020-11-05T13:38:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (766, 368, 244, '2021-07-13T17:24:23Z');
insert into user_orders (user_id, certificate_id, price, date)
values (361, 557, 894, '2021-10-16T22:40:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (629, 187, 383, '2021-10-21T19:44:38Z');
insert into user_orders (user_id, certificate_id, price, date)
values (112, 284, 365, '2021-09-18T23:50:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (306, 568, 974, '2021-09-24T14:59:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (543, 893, 439, '2020-12-13T08:26:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (136, 935, 749, '2021-03-07T19:14:54Z');
insert into user_orders (user_id, certificate_id, price, date)
values (260, 781, 948, '2020-12-19T23:16:47Z');
insert into user_orders (user_id, certificate_id, price, date)
values (999, 681, 559, '2021-06-24T23:21:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (234, 690, 319, '2021-04-29T20:00:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (524, 7, 839, '2021-03-23T05:10:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (276, 37, 288, '2020-11-25T08:54:58Z');
insert into user_orders (user_id, certificate_id, price, date)
values (803, 33, 172, '2021-02-11T14:10:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (861, 1000, 199, '2021-09-06T06:46:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (588, 270, 22, '2021-04-03T20:04:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (306, 293, 684, '2020-11-17T18:33:02Z');
insert into user_orders (user_id, certificate_id, price, date)
values (614, 687, 766, '2021-04-06T14:03:51Z');
insert into user_orders (user_id, certificate_id, price, date)
values (104, 831, 360, '2021-08-21T00:56:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (574, 783, 415, '2021-10-23T12:34:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (9, 711, 138, '2021-05-06T15:28:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (176, 372, 562, '2021-05-22T11:48:25Z');
insert into user_orders (user_id, certificate_id, price, date)
values (763, 920, 461, '2021-10-12T11:56:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (588, 15, 979, '2021-10-09T18:17:37Z');
insert into user_orders (user_id, certificate_id, price, date)
values (717, 524, 712, '2021-09-11T03:51:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (878, 614, 702, '2021-03-24T07:09:30Z');
insert into user_orders (user_id, certificate_id, price, date)
values (875, 908, 882, '2021-07-02T12:04:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (427, 940, 51, '2021-04-06T10:16:13Z');
insert into user_orders (user_id, certificate_id, price, date)
values (758, 468, 960, '2021-05-08T04:26:33Z');
insert into user_orders (user_id, certificate_id, price, date)
values (620, 290, 26, '2021-05-20T00:53:59Z');
insert into user_orders (user_id, certificate_id, price, date)
values (991, 710, 753, '2021-08-17T10:52:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (154, 126, 341, '2021-09-07T04:20:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (750, 231, 637, '2021-09-22T08:11:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (163, 965, 461, '2020-11-30T08:47:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (919, 562, 393, '2021-05-28T20:53:45Z');
insert into user_orders (user_id, certificate_id, price, date)
values (202, 315, 426, '2021-01-05T20:26:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (292, 91, 767, '2021-08-25T10:23:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (929, 960, 726, '2021-07-30T00:02:21Z');
insert into user_orders (user_id, certificate_id, price, date)
values (977, 169, 820, '2021-08-04T18:23:28Z');
insert into user_orders (user_id, certificate_id, price, date)
values (878, 623, 381, '2020-12-03T13:47:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (617, 478, 781, '2020-12-31T17:18:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (107, 506, 949, '2021-06-20T04:21:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (816, 238, 138, '2021-06-23T13:34:57Z');
insert into user_orders (user_id, certificate_id, price, date)
values (753, 184, 180, '2020-11-18T19:38:55Z');
insert into user_orders (user_id, certificate_id, price, date)
values (877, 18, 872, '2021-04-05T23:34:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (490, 70, 936, '2021-09-01T12:03:15Z');
insert into user_orders (user_id, certificate_id, price, date)
values (468, 534, 959, '2021-02-28T04:01:18Z');
insert into user_orders (user_id, certificate_id, price, date)
values (222, 131, 954, '2021-05-24T17:19:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (496, 657, 837, '2021-08-24T12:42:41Z');
insert into user_orders (user_id, certificate_id, price, date)
values (863, 944, 469, '2021-09-02T14:39:39Z');
insert into user_orders (user_id, certificate_id, price, date)
values (513, 749, 856, '2021-07-02T03:59:46Z');
insert into user_orders (user_id, certificate_id, price, date)
values (901, 627, 274, '2021-07-29T04:34:00Z');
insert into user_orders (user_id, certificate_id, price, date)
values (843, 532, 604, '2021-01-23T18:14:42Z');
insert into user_orders (user_id, certificate_id, price, date)
values (49, 261, 438, '2021-09-09T02:42:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (313, 645, 564, '2021-02-11T22:00:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (892, 532, 774, '2021-05-31T22:36:43Z');
insert into user_orders (user_id, certificate_id, price, date)
values (936, 501, 337, '2021-01-06T15:00:35Z');
insert into user_orders (user_id, certificate_id, price, date)
values (301, 839, 938, '2020-11-19T22:48:17Z');
insert into user_orders (user_id, certificate_id, price, date)
values (581, 271, 378, '2021-08-16T06:14:49Z');
insert into user_orders (user_id, certificate_id, price, date)
values (812, 994, 126, '2020-12-23T01:38:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (61, 190, 108, '2020-12-20T13:35:56Z');
insert into user_orders (user_id, certificate_id, price, date)
values (911, 313, 170, '2021-08-10T03:33:36Z');
insert into user_orders (user_id, certificate_id, price, date)
values (899, 661, 456, '2021-03-16T05:31:31Z');
insert into user_orders (user_id, certificate_id, price, date)
values (861, 189, 231, '2021-08-16T07:04:50Z');
insert into user_orders (user_id, certificate_id, price, date)
values (506, 172, 9, '2021-11-01T21:42:48Z');
insert into user_orders (user_id, certificate_id, price, date)
values (692, 74, 135, '2021-05-18T16:56:40Z');
insert into user_orders (user_id, certificate_id, price, date)
values (785, 702, 904, '2021-01-08T22:51:44Z');
insert into user_orders (user_id, certificate_id, price, date)
values (14, 442, 538, '2021-08-02T15:14:22Z');
insert into user_orders (user_id, certificate_id, price, date)
values (793, 72, 767, '2021-01-19T02:07:53Z');
insert into user_orders (user_id, certificate_id, price, date)
values (754, 94, 759, '2021-07-03T07:14:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (9, 709, 457, '2021-09-01T10:45:12Z');
insert into user_orders (user_id, certificate_id, price, date)
values (767, 87, 571, '2021-11-08T09:43:52Z');
insert into user_orders (user_id, certificate_id, price, date)
values (394, 160, 238, '2021-07-14T20:41:07Z');
insert into user_orders (user_id, certificate_id, price, date)
values (472, 5, 652, '2021-03-13T02:13:10Z');
insert into user_orders (user_id, certificate_id, price, date)
values (145, 48, 516, '2021-10-07T01:09:35Z');
