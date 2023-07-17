CREATE DATABASE tienda_partition;
\c tienda_partition;

tienda=# CREATE TABLE client (id_client INT, first_name VARCHAR(200), last_name VARCHAR(200), adreess VARCHAR(200), country VARCHAR(200), email VARCHAR(200), cellphone VARCHAR(60), telephone VARCHAR(60),tienda=# CREATE TABLE client (id_client INT, first_name VARCHAR(35), last_name VARCHAR(35), adreess VARCHAR(100), country VARCHAR(200), email VARCHAR(20), cellphone VARCHAR(20), telephone VARCHAR(60), job_title VARCHAR(60), gender VARCHAR(60), college VARCHAR(70));
CREATE TABLE

tienda=# CREATE TABLE product (id INT PRIMARY KEY, product_name VARCHAR(100) NOT NULL, price FLOAT NOT NULL);
CREATE TABLE

tienda=# SELECT * FROM product;

tienda=# CREATE TABLE product_partition_1 (CHECK (price >=1.00 AND price <=3000)) INHERITS (product);
CREATE TABLE
tienda=# CREATE TABLE product_partition_2 (CHECK (price >=3001 AND price <=6000)) INHERITS (product);
CREATE TABLE
tienda=# CREATE TABLE product_partition_3 (CHECK (price >=6001 AND price <=10000)) INHERITS (product);
CREATE TABLE

tienda=# INSERT INTO product_partition_1 ( id, product_name, price ) SELECT  id, product_name, price  FROM product WHERE price >=1.00 AND price <=3000;
INSERT 0 308
tienda=# INSERT INTO product_partition_2 ( id, product_name, price ) SELECT  id, product_name, price  FROM product WHERE price >=3001 AND price <=6000;
INSERT 0 294
tienda=# INSERT INTO product_partition_3 ( id, product_name, price ) SELECT  id, product_name, price  FROM product WHERE price >=6001 AND price <=10000;
INSERT 0 397
tienda=# CREATE TABLE client_female (CHECK (gender IN ('Female', 'female'))) INHERITS (client);
CREATE TABLE
tienda=# CREATE TABLE client_male (CHECK (gender IN ('Male', 'male'))) INHERITS (client);
CREATE TABLE
tienda=# INSERT INTO client_female (id_client, first_name, last_name, adreess, country, email, cellphone, telephone, job_title, gender, college) SELECT id_client, first_name, last_name, adreess, country, email, cellphone, telephone, job_title, gender, college FROM client WHERE gender IN ('Female', 'female');
INSERT 0 7879
tienda=# INSERT INTO client_male (id_client, first_name, last_name, adreess, country, email, cellphone, telephone, job_title, gender, college) SELECT id_client, first_name, last_name, adreess, country, email, cellphone, telephone, job_title, gender, college FROM client WHERE gender IN ('Male', 'male');
INSERT 0 8115
tienda=# 

