CREATE DATABASE car_base;

CREATE TABLE user (
    id_user MEDIUMINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_user)
    );

CREATE TABLE currency(
id_currency MEDIUMINT NOT NULL AUTO_INCREMENT,
name_currency VARCHAR(20),
PRIMARY KEY (id_currency)
);

CREATE TABLE category(
id_category MEDIUMINT NOT NULL AUTO_INCREMENT,
name_category VARCHAR(20),
PRIMARY KEY (id_category)
);

CREATE TABLE offer (
    id_offer MEDIUMINT NOT NULL AUTO_INCREMENT,
    status Char(1) NOT NULL,
    start_date DATE NOT NULL,
    planed_date DATE,
    fact_date DATE,
    type VARCHAR(20),
    id_user MEDIUMINT,
    id_category MEDIUMINT,
    PRIMARY KEY (id_offer),
    CONSTRAINT user_offers_fk FOREIGN KEY (id_user) REFERENCES user (id_user),
    CONSTRAINT offer_category_fk FOREIGN KEY (id_category) REFERENCES category (id_category)
);

CREATE TABLE price (
    id_price MEDIUMINT NOT NULL AUTO_INCREMENT,
    value MEDIUMINT NOT NULL,
    date_of_change DATE,
    id_offer MEDIUMINT,
    id_currency MEDIUMINT,
    PRIMARY KEY (id_price),
    CONSTRAINT price_offer_fk FOREIGN KEY (id_offer)
        REFERENCES offer (id_offer),
    CONSTRAINT currency_price_fk FOREIGN KEY (id_currency)
        REFERENCES currency (id_currency)
);
