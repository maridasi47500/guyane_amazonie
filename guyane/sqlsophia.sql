drop database `guyane_amazonie`;
create database `guyane_amazonie`;
use `guyane_amazonie`;
CREATE TABLE activites (
    id INT PRIMARY KEY NOT NULL auto_increment,
    photo VARCHAR(255),
    type VARCHAR(100),
    nom VARCHAR(255),
    tarifs VARCHAR(255),
    infos VARCHAR(1000),
    coord VARCHAR(255),
    zoom Int not null default 7,
    boutons VARCHAR(255),
    code_postal VARCHAR(5),
    commune VARCHAR(255)
);


CREATE TABLE `mypages` (
    id INT PRIMARY KEY NOT NULL auto_increment,    

    title VARCHAR(255)
);
CREATE TABLE `options` (
    id INT PRIMARY KEY NOT NULL auto_increment,    
	optiontype_id INT not null,
    title VARCHAR(255)
);
CREATE TABLE `optiontypes` (
    id INT PRIMARY KEY NOT NULL auto_increment,    
	mypage_id INT not null,
    title VARCHAR(255)
);

CREATE TABLE `mytypes` (
    activite_id INT NOT NULL,
    option_id INT NOT NULL
);


insert into activites (type,nom) values ("activite","ballade au zoo");
insert into activites (type,nom,code_postal) values ("activite","ballade à l'île du salut","97300");
/*

nature,agenda,souvenir,office_de_tourisme,transport,patrimoine_histoire,site_naturel,hebergements, equipements, hebergements, activite, randonnes, patrimoine_culturel;
insert into `options` (title) values ("animaux");*/
insert into `options` (type,title) values ("activite_type","animaux") ;
insert into `options` (type,title) values ("activite_type","randonnees") ;
insert into `mytypes` (activite_id,option_id) values ("1","2");
insert into `mytypes` (activite_id,option_id) values ("2","1");
select * from optiontypes;
select * from options;
select * from mytypes;
select * from mypages;
select * from optiontypes where type = 'hebergements' and title = 'Type' limit 1;