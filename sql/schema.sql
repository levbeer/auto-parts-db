-- create table product_categories
create table product_categories (
    id serial primary key ,
    name varchar(100) not null ,
    description text
);

--create table brands
create table brands (
    id serial primary key ,
    name varchar(100) not null ,
    country_code CHAR(2) CHECK (char_length(country_code) = 2)
);

--create table suppliers
create table suppliers (
    id serial primary key ,
    name varchar(100) ,
    contact_name varchar(100) ,
    phone varchar(20) ,
    email varchar(100) ,
    city varchar(100) ,
    country_code CHAR(2) CHECK (char_length(country_code) = 2)
);

--create table departments
create table departments (
    id   serial primary key,
    name varchar(100) ,
    head_id int null
);

--create table positions
create table positions (
    id serial primary key ,
    title varchar(50) ,
    min_salary numeric(10,2) ,
    max_salary numeric(10,2) ,
    bonus_percent numeric(5,2)
);

-- create table customer_segments
create table customer_segments (
    id serial primary key ,
    name varchar(100) ,
    description text
);

--create table delivery_regions
create table delivery_regions (
    id serial primary key ,
    name varchar(100) ,
    avg_delivery_time int ,
    delivery_cost numeric(8,2)
);

--create table products
create table products (
    id serial primary key ,
    name varchar(100) ,
    categories_id int references product_categories(id) ,
    brand_id int references brands(id) ,
    article_code varchar(50) unique ,
    price numeric(10,2) ,
    cost numeric(10,2) ,
    vat_rate numeric(4,2) default 20.00 ,
    stock_qty int default 0 ,
    supplier_id int references suppliers(id) ,
    created_at timestamp default now() ,
    is_active boolean default true
);

--create table
create table customers (
    id serial primary key ,
    first_name varchar(50) ,
    last_name varchar(50) ,
    email varchar(100) unique ,
    phone varchar(20) ,
    city varchar(100) ,
    region varchar(100) ,
    created_at timestamp default now() ,
    is_vip boolean ddefault false
);

--create table managers
create table managers (
    id serial primary key ,
    first_name varchar(50) ,
    last_name varchar(50) ,
    department_id int references departments(id) ,
    position_id int references positions(id) ,
    
)

