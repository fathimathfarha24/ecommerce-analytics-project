SHOW VARIABLES LIKE 'local_infile';
show databases;
use ecommerce_analytics;
show tables;
CREATE TABLE customers (
    customer_id VARCHAR(35),
    customer_unique_id VARCHAR(35),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
customer_id,
customer_unique_id,
customer_zip_code_prefix,
customer_city,
customer_state
);
SHOW VARIABLES LIKE 'secure_file_priv';

CREATE TABLE geolocation (
    geolocation_zip_code_prefix int,
    geolocation_lat float,
    geolocation_lng float,
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_geolocation_dataset.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
geolocation_zip_code_prefix,
geolocation_lat,
geolocation_lng,
geolocation_city,
geolocation_state
);

CREATE TABLE items (
    order_id varchar(50),
    order_item_id int,
    product_id varchar(50),
    seller_id VARCHAR(50),
    shipping_limit_date datetime,
    price float,
    freight_value float
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_order_items_dataset.csv'
INTO TABLE items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
order_id,
order_item_id,
product_id,
seller_id,
shipping_limit_date,
price,
freight_value
);


CREATE TABLE payments (
    order_id varchar(50),
    payment_sequential int,
    payment_type varchar(50),
    payment_installments int,
    payment_value float
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 order_id,
payment_sequential,
payment_type,
payment_installments,
payment_value
);

CREATE TABLE reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
review_id,
order_id,
review_score,
review_comment_title,
review_comment_message,
@review_creation_date,
@review_answer_timestamp
)
SET
review_creation_date = STR_TO_DATE(@review_creation_date, '%d-%m-%Y %H:%i'),
review_answer_timestamp = STR_TO_DATE(@review_answer_timestamp, '%d-%m-%Y %H:%i');

CREATE TABLE orders (
    order_id varchar(50),
    customer_id varchar(50),
    order_status varchar(20),
    order_purchase_timestamp datetime,
    order_approved_at datetime,
    order_delivered_carrier_date datetime,
    order_delivered_customer_date datetime,
    order_estimated_delivery_date datetime
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    order_status,
    @order_purchase_timestamp,
    @order_approved_at,
    @order_delivered_carrier_date,
    @order_delivered_customer_date,
    @order_estimated_delivery_date
)
SET
order_purchase_timestamp =
    STR_TO_DATE(@order_purchase_timestamp, '%Y-%m-%d %H:%i:%s'),
order_approved_at =
    IF(@order_approved_at='', NULL,
       STR_TO_DATE(@order_approved_at, '%Y-%m-%d %H:%i:%s')),
order_delivered_carrier_date =
    IF(@order_delivered_carrier_date='', NULL,
       STR_TO_DATE(@order_delivered_carrier_date, '%Y-%m-%d %H:%i:%s')),
order_delivered_customer_date =
    IF(@order_delivered_customer_date='', NULL,
       STR_TO_DATE(@order_delivered_customer_date, '%Y-%m-%d %H:%i:%s')),
order_estimated_delivery_date =
    STR_TO_DATE(@order_estimated_delivery_date, '%Y-%m-%d %H:%i:%s');

CREATE TABLE products (
    product_id varchar(50),
    product_category_name varchar(50),
    product_name_lenght int,
    product_description_lenght int,
    product_photos_qty int,
    product_weight_g int,
    product_length_cm int,
    product_height_cm int,
    product_width_cm int
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 product_id,
product_category_name,
@product_name_lenght,
@product_description_lenght,
@product_photos_qty,
@product_weight_g,
@product_length_cm,
@product_height_cm,
@product_width_cm
)
SET
product_name_lenght = NULLIF(@product_name_lenght, ''),
product_description_lenght = NULLIF(@product_description_lenght, ''),
product_photos_qty = NULLIF(@product_photos_qty, ''),
product_weight_g = NULLIF(@product_weight_g, ''),
product_length_cm = NULLIF(@product_length_cm, ''),
product_height_cm = NULLIF(@product_height_cm, ''),
product_width_cm = NULLIF(@product_width_cm, '');

CREATE TABLE sellers (
    seller_id varchar(50),
    seller_zip_code_prefix bigint,
    seller_city varchar(50),
    seller_state varchar(5)
  );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
);

CREATE TABLE product_category_name_translation (
    product_category_name varchar(50),
    product_category_name_english varchar(50)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	product_category_name,
    product_category_name_english
);

SHOW TABLES;

