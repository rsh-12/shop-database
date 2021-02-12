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
VALUES ('Shop Name 1', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 32'),
       ('Shop Name 2', 'Novosibirskaya obl.', 'Novosibirsk', 'Address 3'),
       ('Shop Name 3', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 45'),
       ('Shop Name 4', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 3231'),
       ('Shop Name 5', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 321'),
       ('Shop Name 6', 'Permskaya obl.', 'Perm', 'Address 98'),
       ('Shop Name 7', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 43'),
       ('Shop Name 8', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 349'),
       ('Shop Name 9', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 90'),
       ('Shop Name 10', 'Novosibirskaya obl.', 'Novosibirsk', 'Address 374'),
       ('Shop Name 11', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 834'),
       ('Shop Name 12', 'Sverdlovskaya obl.', 'Yekaterinburg', 'Address 4');


-- employees
insert into employees(first_name, last_name, phone, e_mail, job_name, shop_id)
VALUES ('Полина', 'Большакова', '8-922-231-000', 'aojv@mail.ru', 'seller', 1),
       ('Александр', 'Бычков', '8-922-231-001', 'kggfpxw@yandex.ru', 'seller', 2),
       ('Ярослава', 'Волкова', '+7-922-231-002', 'yaroslava@yandex.ru', 'seller', 3),
       ('Таисия', 'Демидова', '8-922-231-003', 'tasya@gmail.com', 'seller', 4),
       ('Олег', 'Золотарев', '8-922-231-004', 'oleggg@mail.ru', 'manager', 5),
       ('Даниил', 'Иванов', '8-922-231-005', 'ahbg@yandex.ru', 'seller', 6),
       ('Михаил', 'Измайлов', '8-922-231-006', 'misha@yandex.ru', 'seller', 7),
       ('Екатерина', 'Калашникова', '8-922-231-007', 'qwerty@mail.ru', 'seller', 8),
       ('Максим', 'Кондратьев', '8-922-231-008', 'dsfjakl@mail.ru', 'seller', 9),
       ('Вадим', 'Логинов', '8-922-231-009', 'fdjsaikfh@mail.ru', 'manager', 10),
       ('Анна', 'Миронова', '8-922-231-010', 'anna@mail.ru', 'seller', 11),
       ('Милана', 'Михайлова', '8-922-231-011', 'pillow@mail.ru', 'seller', 12),
       ('Анастасия', 'Михайлова', '8-922-231-012', 'olla@mail.ru', 'manager', 1),
       ('Михаил', 'Некрасов', '8-922-231-013', 'daily@mail.ru', 'seller', 2),
       ('Мирослава', 'Никитина', '8-922-231-014', 'lila@mail.ru', 'seller', 3),
       ('Ксения', 'Овчинникова', '8-922-231-015', 'sadpod@mail.ru', 'seller', 4),
       ('Артур', 'Павлов', '8-922-231-016', 'artur@mail.ru', 'seller', 5),
       ('Кирилл', 'Попов', '8-922-231-017', 'plsql@mail.ru', 'seller', 6),
       ('Татьяна', 'Савельева', '8-922-231-018', 'sql@mail.ru', 'manager', 7),
       ('Сергей', 'Соловьев', '8-922-231-019', 'jinja@mail.ru', 'seller', 8),
       ('Ольга', 'Соловьева', '8-922-231-020', 'olga@gmail.com', 'seller', 9),
       ('Елизавета', 'Сорокина', '8-922-231-021', 'liza@gmail.com', 'seller', 10),
       ('Руслан', 'Трифонов', '8-922-231-022', 'ruslan@gmail.com', 'seller', 11),
       ('Михаил', 'Успенский', '8-922-231-023', 'uspex@gmail.com', 'manager', 12);


-- shops-employess: set manager id
update shops
set manager_id = e.id
from (select * from employees where job_name = 'manager') e
where shops.id = e.shop_id