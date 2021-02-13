-- products
insert into products(code, name)
VALUES ('aaa', 'product 1'),
       ('aab', 'product 2'),
       ('abb', 'product 3'),
       ('bbb', 'product 4'),
       ('bbc', 'product 5'),
       ('bcc', 'product 6'),
       ('ccc', 'product 7'),
       ('ccd', 'product 8'),
       ('cdd', 'product 9'),
       ('ddd', 'product 10'),
       ('dde', 'product 11');


-- shops
insert into shops(name, region, city, address)
VALUES ('Сеть магазинов Луч 1', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Мира 12'),
       ('Сеть магазинов Луч 2', 'Novosibirskaya obl.', 'Novosibirsk', 'Ленина 1'),
       ('Сеть магазинов Луч 3', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Космонавтов 721'),
       ('Сеть магазинов Луч 4', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Проспект Пушкина'),
       ('Сеть магазинов Луч 5', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Шварца 8А'),
       ('Сеть магазинов Луч 6', 'Permskaya obl.', 'Perm', 'Бардина 90'),
       ('Сеть магазинов Луч 7', 'Sverdlovskaya obl.', 'Yekaterinburg', '8 Марта 43'),
       ('Сеть магазинов Луч 8', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Студенческая 349'),
       ('Сеть магазинов Луч 9', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Красных героев 90'),
       ('Сеть магазинов Луч 10', 'Novosibirskaya obl.', 'Novosibirsk', 'Павлова 374'),
       ('Сеть магазинов Луч 11', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Алексеева 834'),
       ('Сеть магазинов Луч 12', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Алтайская 4');


-- employees
insert into employees(first_name, last_name, phone, e_mail, job_name, shop_id)
VALUES ('Полина', 'Большакова', '8-990-271-000', 'aojv@mail.ru', 'продавец', 1),
       ('Александр', 'Бычков', '8-922-181-001', 'kggfpxw@yandex.ru', 'продавец', 2),
       ('Ярослава', 'Волкова', '+7-922-137-002', 'yaroslava@yandex.ru', 'продавец', 3),
       ('Таисия', 'Демидова', '8-922-201-003', 'tasya@gmail.com', 'продавец', 4),
       ('Олег', 'Золотарев', '8-900-543-004', 'oleggg@mail.ru', 'менеджер', 5),
       ('Даниил', 'Иванов', '8-922-318-005', 'ahbg@yandex.ru', 'продавец', 6),
       ('Михаил', 'Измайлов', '8922430006', 'misha@yandex.ru', 'продавец', 7),
       ('Екатерина', 'Калашникова', '8-922-231-007', 'qwerty@mail.ru', 'продавец', 8),
       ('Максим', 'Кондратьев', '8-907-700-008', 'dsfjakl@mail.ru', 'продавец', 9),
       ('Вадим', 'Логинов', '8-922-241-009', 'fdjsaikfh@mail.ru', 'менеджер', 10),
       ('Анна', 'Миронова', '8-922-666-010', 'anna@mail.ru', 'продавец', 11),
       ('Милана', 'Михайлова', '8-922-131-011', 'pillow@mail.ru', 'продавец', 12),
       ('Анастасия', 'Михайлова', '8-922-546-012', 'olla@mail.ru', 'менеджер', 1),
       ('Михаил', 'Некрасов', '+7-922-455-013', 'daily@mail.ru', 'продавец', 2),
       ('Мирослава', 'Никитина', '8-999-737-014', 'lila@mail.ru', 'продавец', 3),
       ('Ксения', 'Овчинникова', '8-912-931-015', 'sadpod@mail.ru', 'продавец', 4),
       ('Артур', 'Павлов', '8-922-231-016', 'artur@mail.ru', 'продавец', 5),
       ('Кирилл', 'Попов', '8-922-478-017', 'plsql@mail.ru', 'продавец', 6),
       ('Татьяна', 'Савельева', '8-922-494-018', 'sql@mail.ru', 'менеджер', 7),
       ('Сергей', 'Соловьев', '8-922-569-019', 'jinja@mail.ru', 'продавец', 8),
       ('Ольга', 'Соловьева', '8952432020', 'olga@gmail.com', 'продавец', 9),
       ('Елизавета', 'Сорокина', '8-922-001-021', 'liza@gmail.com', 'продавец', 10),
       ('Руслан', 'Трифонов', '8-956-231-022', 'ruslan@gmail.com', 'продавец', 11),
       ('Михаил', 'Успенский', '+7911969023', 'uspex@gmail.com', 'менеджер', 12);


-- shops-employess: set менеджер id
update shops
set manager_id = e.id
from (select * from employees where job_name = 'менеджер') e
where shops.id = e.shop_id;


-- purchases
insert into purchases(datetime, amount, seller_id)
VALUES (current_timestamp - interval '2' month, 18000, 1),
       (current_timestamp - interval '1' month, 6800, 2),
       (current_timestamp - interval '2' month, 3200, 3),
       (current_timestamp - interval '1' month, 9000, 4),
       (current_timestamp - interval '1' month, 17000, 6),
       (current_timestamp - interval '2' month, 1325, 7),
       (current_timestamp - interval '1' month, 89000, 8);

-- purchases_receipts
insert into purchases_receipts(purchase_id, product_id, quantity, amount_full, amount_discount)
values (1, 1, 4, 20000, 2000),
       (2, 2, 1, 7000, 200),
       (3, 3, 4, 4000, 800),
       (4, 4, 18, 9000, 100),
       (5, 5, 1, 17000, 250),
       (6, 6, 1, 1500, 175),
       (7, 7, 10, 100000, 11000);