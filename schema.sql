/* POSTGRESQL */



/* PRODUCTS ------------------------------------------------- */
create table products
(
    id   serial primary key,
    code varchar(50) unique, -- null
    name varchar(200)        -- null
);

alter sequence products_id_seq rename to products_pk;
alter index products_code_key rename to products_code_uk;



/* SHOPS ---------------------------------------------------- */
create table if not exists shops
(
    id         serial primary key,
    name       varchar(200), -- null
    region     varchar(200), -- null
    city       varchar(200), -- null
    address    varchar(200), -- null
    manager_id integer,      -- null, fk

    check ( city ~* '^[^0-9]+$' or city is null ),
    check ( address ~* '^[^0-9]+$' or address is null ),
    check ( region ~* '^[^0-9]+$' or region is null )
);



/* EMPLOYESS ------------------------------------------------ */
create table if not exists employees
(
    id         serial primary key,
    first_name varchar(100) default null, -- null
    last_name  varchar(100) default null, -- null
    phone      varchar(50),               -- null
    e_mail     varchar(50),               -- null
    job_name   varchar(50),               -- null
    shop_id    integer,                   -- null, fk

    check ( first_name ~* '^[^0-9]+$' or first_name is null ),
    check ( last_name ~* '^[^0-9]+$' or last_name is null ),

    check ( phone ~ '^\+?(\d{0,3}\-?)(\d{0,3}\-?)(\d{0,3}\-?)(\d{0,3}\-?)(\d{0,3})'
        or phone is null ),

    check ( e_mail ~* '^[a-zA-Z]+[_-]?[a-zA-Z]+@[a-zA-Z_]+?\.[a-zA-Z]{2,4}$'
        or e_mail is null )
);



/* PURCHASES ------------------------------------------------ */
create table if not exists purchases
(
    id        serial primary key,
    datetime  timestamptz,
    amount    numeric(18, 2),
    seller_id integer -- fk
);



/* PURCHASES_RECEIPTS --------------------------------------- */
create table if not exists purchases_receipts
(
    purchase_id     serial,
    oridnal_number  serial,
    product_id      integer, --fk
    quantity        numeric(25, 5), -- null
    amount_full     numeric(18, 2),
    amount_discount numeric(18, 2),

    primary key (purchase_id, oridnal_number)
);


/* SETTING FKeys -------------------------------------------- */