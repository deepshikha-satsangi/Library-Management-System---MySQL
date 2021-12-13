 create database library_demo;

show databases;

use library_demo;

CREATE TABLE readers
    (
        reader_id VARCHAR(6),
        fname VARCHAR(30),
        mname VARCHAR(30),
        ltname VARCHAR(30),
        city VARCHAR(15),
        mobileno VARCHAR(10),
        occupation VARCHAR(10),
        dob DATE,
        CONSTRAINT readers_pk PRIMARY KEY(reader_id)    
    );
    
    
INSERT INTO readers VALUES('C00001','Deepshikha',null,'Satsangi','Agra',null,'Student','2000-10-25');
INSERT INTO readers VALUES('C00002','Amol',null,'Satsangi','Agra',null,'Student','2003-09-12');
INSERT INTO readers VALUES('C00003','Khushi',null,'Verma','Agra',null,'Student','2000-02-21');
INSERT INTO readers VALUES('C00004','Mahima',null,null,'Himachal',null,'Student','2000-12-18');
INSERT INTO readers VALUES('C00005','Ratnanjali',null,'Satsangi','Gorakhpur',null,'Student','2000-06-14');

select *from readers;

drop table book;

CREATE TABLE book
  (
   bid VARCHAR(6),
   bname VARCHAR(40),
   bdomain VARCHAR(30),
   CONSTRAINT book_bid_pk PRIMARY KEY(bid)
  );
  
INSERT INTO book VALUES ('B00001','The cat in the the hat','Story Book');
INSERT INTO book VALUES ('B00002','Harry Potter','Novel');
INSERT INTO book VALUES ('B00003','Everything Yoy Desire','Documentry');

CREATE TABLE active_readers
   (
	account_id VARCHAR(6),
    reader_id VARCHAR(6),
    bid VARCHAR(6),
    atype VARCHAR(10),
    astatus VARCHAR(10),
    CONSTRAINT actiereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
    CONSTRAINT account_bid_fk FOREIGN KEY (bid) REFERENCES book(bid)
   );

INSERT INTO active_readers VALUES('A00001','C00001','B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00002','C00002','B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00003','C00003','B00001', 'Regular', 'Terminated');
INSERT INTO active_readers VALUES('A00004','C00002','B00001', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00005','C00001','B00001', 'Premium', 'Active');

select *from active_readers;
select *from active_readers where astatus = 'Terminated';
select *from active_readers where astatus = 'Active';

CREATE TABLE bookissue_details
  (
    issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bid VARCHAR(20),
    bookname VARCHAR(50),
    number_of_book_issued INT(7),
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers
    );

show tables;
drop table bookissue_details;
   
INSERT INTO bookissue_details VALUES ('T00001', 'A00001','B00001','The Cat in the Hat');
INSERT INTO bookissue_details VALUES ('T00002', 'A00002','B00002','Harry Potter');
INSERT INTO bookissue_details VALUES ('T00003', 'A00003','B00003','Everything you desire');

select count(account_id) from active_readers where atype = 'Premium';
