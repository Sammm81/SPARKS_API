CREATE DATABASE sparks;

use sparks;

CREATE TABLE users (
    id varchar(10) NOT NULL UNIQUE, 
    name varchar(20) NOT NULL, 
    email varchar(30) NOT NULL UNIQUE, 
    password varchar(500) NOT NULL, 
    admin bool DEFAULT 0 NOT NULL, 
    balance bigint DEFAULT 0 NOT NULL, 
    PRIMARY KEY (id)
);

CREATE TABLE place (
    id varchar(10) NOT NULL UNIQUE, 
    place_name varchar(30) NOT NULL, 
    full bool DEFAULT 0 NOT NULL, 
    PRIMARY KEY (ID)
);

CREATE TABLE area (
    id varchar(10) NOT NULL UNIQUE, 
    place_id varchar(10) NOT NULL, 
    area_name varchar(30) NOT NULL, 
    full bool DEFAULT 0 NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY (place_id) REFERENCES place(id)
); 

CREATE TABLE slot (
    id varchar(10) NOT NULL UNIQUE, 
    area_id varchar(10) NOT NULL, 
    slot_name varchar(30) NOT NULL, 
    book bool DEFAULT 0 NOT NULL, 
    available bool DEFAULT 1 NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY (area_id) REFERENCES area(id)
);

CREATE TABLE book (
    id varchar(10) NOT NULL UNIQUE, 
    user_id varchar(10) NOT NULL, 
    slot_id varchar(10) NOT NULL, 
    token varchar(20) NOT NULL UNIQUE, 
    verified bool DEFAULT 0 NOT NULL, 
    record timestamp DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (id), 
    FOREIGN KEY (user_id) REFERENCES users(id), 
    FOREIGN KEY (slot_id) REFERENCES slot(id)
);

CREATE TABLE payment (
    id varchar(10) NOT NULL UNIQUE, 
    book_id varchar(10) NOT NULL, 
    paid bool DEFAULT 0 NOT NULL, 
    record timestamp DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (id)
);