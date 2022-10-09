drop database "guyane_amazonie" if exists;
create database "guyane_amazonie";
use "guyane_amazonie";

CREATE TABLE activites (
    id INT PRIMARY KEY NOT NULL,
    photo VARCHAR(255),
    type VARCHAR(100),
    nom VARCHAR(255),
    tarifs VARCHAR(255),
    infos VARCHAR(1000),
    coord VARCHAR(255),
    boutons VARCHAR(255),
    code_postal VARCHAR(5),
    commune VARCHAR(255)
);



CREATE TABLE options (
    id INT PRIMARY KEY NOT NULL,
    title VARCHAR(255)
);

CREATE TABLE type_hebergements (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);

CREATE TABLE type_equipements_hebergements (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_activites (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);

CREATE TABLE type_patrimoine_culturels (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_patrimoine_historiques (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_sites_naturels (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_transports (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_office_de_tourismes (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_natures (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_agendas (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);
CREATE TABLE type_souvenirs (
    hebergement_id INT NOT NULL,
    option_id INT NOT NULL
);