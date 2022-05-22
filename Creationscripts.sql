/* creation of ecommercedb */
create database ecommercedb;

/* using ecommercedb */
use ecommercedb;

/* Supplier table creation */
CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

/* supplier table description information */
desc supplier;

/* customer table creation */
CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

/* customer table  description information */
desc customer;

/* category table creation */
CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

/* category table description information */
desc category;
 
 /* product table creation */
CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60) NOT NULL,
    CAT_ID INT NOT NULL,
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);

/* product table description information */
desc product;

/* supplier_pricing table creation */
CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

/*supplier_pricing table description information */
desc supplier_pricing;

/* `order` table creation */
CREATE TABLE IF NOT EXISTS `order` (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES SUPPLIER_PRICING (PRICING_ID)
);

/* `order` table description information */
DESC `order`;

/* rating table creation */

CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID)
        REFERENCES `order` (ORD_ID)
);

/* rating table description information */
DESC rating;
