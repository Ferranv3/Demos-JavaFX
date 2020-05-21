Drop database if exists hospital
Create database hospital
use hospital

create table pacient(
dniPacient varchar(9) Primary key,
nomPacient varchar(30),
cognomsPacient varchar(30),
edatPacient int,
telefonPacient int,
emailPacient varchar(30),
sexe varchar(30),
grupSanguini varchar(30),
estatPacient varchar(30),
descripcioEstat varchar(200)
);

create table patologiaPrevia(
idPatologiaPrevia SERIAL,
dniPacient varchar(9) references pacient(dniPacient),
nomPatologia varchar(30),
gravetat varchar(30),
PRIMARY KEY(idPatologiaPrevia, dniPacient)
);

create table profesional(
numColegiat int Primary key,
nomProfesional varchar(30),
cognomsProfesional varchar(30),
edatProfesional int,
dniProfesional varchar(9),
genre varchar(4),
telefonProfesional int,
emailProfesional varchar(30),
especialitat varchar(30),
profesionalExtraordinari int,
horariLaboral varchar(30)
);

create table historialPacients(
dniPacient varchar(9) references pacient (dniPacient),
accioRealitzada varchar(100),
numColegiatMetge int references profesional (numColegiat) on delete set null,
dataIngres date,
dataAlta date,
llocIngres varchar(30),
materialUtilitzat varchar(50), 
Primary key (dniPacient, accioRealitzada, dataIngres)
);

Insert into pacient values ('82717219L','Esperanza','Aguirre',99,654812354,'aespe@gob.es','Dona','0+','Greu','No te psintomes de millora.');
Insert into pacient values ('42734213N','Rodrigo','Rato',89,694811154,'rrato@gob.es','Home','0-','Greu','No te psintomes de millora.');
Insert into patologiaPrevia values (DEFAULT,'82717219L','Arritmies croniques','Molt greu');
Insert into profesional values (000001,'Carles','Puigdemont De Castilla',45,'47931877L','Home',620871469,'cpuigde@gencat.cat','Cardioleg',0,'7:00 - 23:55');
Insert into profesional values (000002,'Uriol','Pujol Pobre',95,'47231917P','Home',690861469,'opujol@gencat.cat','Metge comu',1,'7:00 - 23:55');
Insert into profesional values (000003,'Mariano','Rajoy Sanchez',75,'47641198L','Home',621861469,'m.rajoy@gob.es','Metge comu',1,'7:00 - 23:55');
Insert into historialPacients values ('82717219L','Ingres UCI',1,'2020-04-21','2020-04-21', 'UCI', 'Respirador, vies');
Insert into historialPacients values ('82717219L','Administracio cortisona',1,'2020-04-22','2020-04-22', 'UCI', 'Cortisona');