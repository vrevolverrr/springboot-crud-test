drop table student;
create table student (
    id integer NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    address varchar(45) DEFAULT NULL,
    gender char(1) DEFAULT 'M',
    dob date DEFAULT NULL,
    email varchar(45) DEFAULT NULL,
    mobile varchar(15) DEFAULT NULL,

    PRIMARY KEY(id)
);

insert into student (name, email, dob, gender, mobile, address) values ('Lin Peagram', 'lpeagram1@gmail.com', '2003-08-10', 'F', '+60154324248', 'Lot 90, 22738 Bukit Besi');
insert into student (name, email, dob, gender, mobile, address) values ('Sathis Shanker', 'santhis22@yahoo.com', '2003-09-16', 'M', '+60154655680', '39, Jln 6/70X, 14059 George Town');
insert into student (name, email, dob, gender, mobile, address) values ('Rennon Ling', 'rennonling38@gmail.com', '2003-04-17', 'M', '+60139242004', 'Lot 4, Jalan Utama 4/29, 10266 Nibong Tebal');
insert into student (name, email, dob, gender, mobile, address) values ('Lillis Mearing', 'lmearing3@yahoo.com', '2003-10-19', 'F', '+60154232812', '59, Jalan 4/53Y, 86615 Labis');
insert into student (name, email, dob, gender, mobile, address) values ('Dennis Lim', 'dennis99@protonmail.com', '2003-03-11', 'M', '+60168452315', '83, Lorong Sentul 3G, PJU23, 73146 Linggi');
insert into student (name, email, dob, gender, mobile, address) values ('Flora Grace', 'floragrace6@gmail.com', '2003-07-26', 'F', '+60256215985', '95, Jalan Pahang 6L, 18430 Wakaf Bharu');
insert into student (name, email, dob, gender, mobile, address) values ('Jason James', 'jasonjames@hotmail.com', '2003-07-24', 'M', '+60158961585', '2, Jalan 7, USJ 74, 80563 Skudai');
insert into student (name, email, dob, gender, mobile, address) values ('Aymer Philip', 'aphilip9@gmail.com', '2003-12-01', 'F', '+60123651852', '2, Jalan Keliling 2/9, 65142 Ulu Yam');