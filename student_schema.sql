 
// 1. CREATED TABLE
CREATE TABLE STUDENTS(
STUDENTID CHAR(5) ,
LAST VARCHAR(15) NOT NULL,
FIRST VARCHAR(15) NOT NULL,
STREET VARCHAR(15),
CITY VARCHAR(15),
STATE VARCHAR(2) DEFAULT 'NJ',
ZIP VARCHAR(5),
STARTTERM VARCHAR(4) ,
BIRTHDAY DATE,
FACULTYID INT,
MAJORID  INT ,
PHONE CHAR(10),
CONSTRAINT S_ID PRIMARY KEY (STUDENTID )
);


//2 . FACULTY

CREATE TABLE FACULTY(
FACULTYID INT ,
NAME VARCHAR(15) NOT NULL,
ROOMID INT ,
PHONE CHAR(3),
DEPTID INT,
CONSTRAINT F_ID PRIMARY KEY (FACULTYID )
);


//3 . CRSSECTION
CREATE TABLE CRSSECTION
(CSID INT,
 COURSEID VARCHAR(6),
 SECTION CHAR(2) NOT NULL,
 TEAMID  CHAR(4) ,
 FACULTYID INT,
 DAY VARCHAR(2),
 STARTTIME VARCHAR(5),
 ENDTIME VARCHAR(5),
 ROOMID INT,
 MAXCOUNT INT,
CONSTRAINT PK_CSID PRIMARY KEY(CSID),
CHECK (MAXCOUNT>0)
);


 
// 4. COURSE 

CREATE TABLE COURSE (
COURSEID VARCHAR(26)  ,
TITLE VARCHAR(20) ,
CREDITS INT ,
PREREQ VARCHAR(6),
CONSTRAINT C_ID PRIMARY KEY (COURSEID),
CHECK (CREDITS >=0 AND CREDITS <=4)
);


// 5. REGISTRATION


CREATE TABLE REGISTRATION (
STUDENTID CHAR(5),
CSID INT,
MIDTERM CHAR(1) ,
FINAL CHAR(1),
REGSTATUS CHAR(1),
CHECK ( MIDTERM IN ('A','B','C','D','F','W')),
CHECK ( FINAL IN ('A','B','C','D','I','F','W')),
CHECK (REGSTATUS IN ('X','R','W'))
);


//6.

CREATE TABLE ROOM(
ROOMTYPE CHAR ,
ROOMDESC VARCHAR(29),
CONSTRAINT ROOMTYPE_ID PRIMARY KEY (ROOMTYPE)
);


//7 LOCATION

CREATE TABLE LOCATION(
ROOMID INT ,
BUILDING VARCHAR(7) NOT NULL,
ROOMNO CHAR(3),
CAPACITY INT,
ROOMTYPE CHAR,
CHECK ( CAPACITY >0) ,
CONSTRAINT ROOM_ID PRIMARY KEY (ROOMID)
);




//8 TERM 

CREATE TABLE TERM(
TERMID CHAR(4) ,
TERMDESC VARCHAR(11),
STARTDATE DATE,
ENDDATE DATE ,
CONSTRAINT TERM_ID PRIMARY KEY (TERMID)
);



// 9 . DEPARTMENT
CREATE TABLE DEPARTMENT(
DEPTID INT ,
DEPTNAME VARCHAR(20),
FACULTYID INT ,
CONSTRAINT DEPT_ID PRIMARY KEY (DEPTID)
);



// 10. major table

CREATE TABLE MAJOR(
MAJORID INT,
MAJORDESC VARCHAR(25) ,
CONSTRAINT MAJOR_ID PRIMARY KEY (MAJORID)
);






ALTER TABLE DEPARTMENT ADD FOREIGN KEY (FACULTYID) REFERENCES FACULTY(FACULTYID );
ALTER TABLE LOCATION ADD FOREIGN KEY (ROOMTYPE) REFERENCES ROOM(ROOMTYPE);
ALTER TABLE REGISTRATION ADD FOREIGN KEY(CSID) REFERENCES CRSSECTION(CSID);
ALTER TABLE REGISTRATION ADD FOREIGN KEY(STUDENTID) REFERENCES STUDENTS(STUDENTID);
ALTER TABLE COURSE ADD FOREIGN KEY (PREREQ ) REFERENCES COURSE (COURSEID);
ALTER TABLE CRSSECTION ADD FOREIGN KEY (FACULTYID) REFERENCES FACULTY (FACULTYID);
ALTER TABLE CRSSECTION ADD FOREIGN KEY (TEAMID) REFERENCES TERM (TERMID);
ALTER TABLE CRSSECTION ADD FOREIGN KEY (COURSEID ) REFERENCES COURSE(COURSEID);
ALTER TABLE FACULTY ADD FOREIGN KEY (ROOMID ) REFERENCES LOCATION(ROOMID);
ALTER TABLE FACULTY ADD FOREIGN KEY (DEPTID ) REFERENCES DEPARTMENT(DEPTID);
ALTER TABLE STUDENTS ADD FOREIGN KEY (STARTTERM ) REFERENCES TERM(TERMID);//
ALTER TABLE STUDENTS ADD FOREIGN KEY (FACULTYID ) REFERENCES FACULTY(FACULTYID);
ALTER TABLE STUDENTS ADD FOREIGN KEY (MAJORID ) REFERENCES MAJOR(MAJORID);



ALTER TABLE FACULTY ADD UNIQUE (PHONE); 
ALTER TABLE LOCATION ADD UNIQUE(ROOMNO);
ALTER TABLE LOCATION MODIFY ROOMNO CHAR NOT NULL;
ALTER TABLE CRSSECTION MODIFY COURSEID CHAR NOT NULL;



// ADD COMPOSITE KEY 
ALTER TABLE REGISTRATION ADD PRIMARY KEY(STUDENTID,CSID);





// TO REMOVE THE MULTIPLE KEY FROM THE TABLE
ALTER TABLE REGISTRATION DROP INDEX STUDENTID;



// TO MODIFY THE DATATYPES IN TABLE 
ALTER TABLE COURSE MODIFY COLUMN COURSEID VARCHAR(6);

ALTER TABLE LOCATION MODIFY COLUMN ROOMNO CHAR(3);

ALTER TABLE TERM MODIFY TERMID VARCHAR(4);




-------------------------------

1 . STUDENTS
INSERT INTO STUDENTS (STUDENTID,LAST,FIRST,STREET, CITY,STATE, ZIP,STARTTERM, BIRTHDAY, FACULTYID, MAJORID, PHONE)
VALUES(00100, 'Diaz','Jose', '1 FordAvenue#7', 'Hill', 'NJ', '08863', 'WN03','1988-12-02' ,123,100 ,'9735551111');

INSERT INTO STUDENTS (STUDENTID,LAST,FIRST,STREET, CITY,STATE, ZIP,STARTTERM, BIRTHDAY, FACULTYID, MAJORID, PHONE)
VALUES(00100, 'Diaz','Jose', '1 FordAvenue#7', 'Hill', 'NJ', '08863', 'WN03','1988-DEC-02',123,100 ,'9735551111');

CREATE TABLE STUDENTS(
STUDENTID CHAR(5) ,
LAST VARCHAR(15) NOT NULL,
FIRST VARCHAR(15) NOT NULL,
STREET VARCHAR(15),
CITY VARCHAR(15),
STATE VARCHAR(2) DEFAULT 'NJ',
ZIP VARCHAR(5),
STARTTERM VARCHAR(4) ,
BIRTHDAY DATE,
FACULTYID INT,
MAJORID  INT ,
PHONE CHAR(10),
CONSTRAINT S_ID PRIMARY KEY (STUDENTID )
);


2 
// FACULTY done 
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(111, 'Jones',11, '525' ,1);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(222, 'Williams',20, '533', 2);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(123, 'Mobley',11, '529' ,1);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(235, 'Vajpayee',12, '577' ,2);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(345, 'Sen',12, '579' ,3);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(444, 'Rivera',21, '544' ,4);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(555, 'Chang',17, '587' ,5);
INSERT INTO FACULTY (FACULTYID,NAME,ROOMID,PHONE,DEPTID)  VALUES(333, 'Collins',17, '599' ,3);





4. 
// COURSE  done 
INSERT INTO COURSE (COURSEID,TITLE,CREDITS) 
VALUES('EN100','Basic English', 0 , '');
INSERT INTO COURSE (COURSEID,TITLE,CREDITS,PREREQ) 
VALUES('LA123','English Literature', 3 , 'EN100');
INSERT INTO COURSE (COURSEID,TITLE,CREDITS) 
VALUES('CIS253','DATABASE SYSTEMS', 3 );
INSERT INTO COURSE (COURSEID,TITLE,CREDITS,PREREQ) 
VALUES('CIS265','SYSTEM ANALYSIS', 3 , 'CIS253');
INSERT INTO COURSE (COURSEID,TITLE,CREDITS) 
VALUES('MA150','COLLEGE ALEGEBRA', 3 );
INSERT INTO COURSE (COURSEID,TITLE,CREDITS) 
VALUES('AC101','ACCOUTING', 3 );


6.
// ROOM  done 
INSERT INTO ROOM (ROOMTYPE,ROOMDESC) 
VALUES('L','Lab');
INSERT INTO ROOM (ROOMTYPE,ROOMDESC) 
VALUES('C','Classroom');
INSERT INTO ROOM (ROOMTYPE,ROOMDESC) 
VALUES('O','Office');


7 
//  done 
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE) 
VALUES(11, 'Gandhi' , '101',2, 'O');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE) 
VALUES(12, 'Gandhi' , '103',2, 'O');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(13, 'Kennedy' , '202',35, 'L');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(14, 'Kennedy' , '204',50, 'L');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(15, 'Nehru' , '301',50, 'C');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(16, 'Nehru' , '309',45, 'C');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(17, 'Gandhi' , '105',2, 'O');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(18, 'Kennedy' , '206',40, 'L');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(19, 'Kennedy' , '210',30, 'L');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(20, 'Gandhi' , '107',2, 'O');
INSERT INTO LOCATION (ROOMID,BUILDING, ROOMNO,CAPACITY, ROOMTYPE)  VALUES(21, 'Gandhi' , '109',2, 'O');



 8 // TERM  done 
INSERT INTO TERM (TERMID,TERMDESC,STARTDATE,ENDDATE) 
VALUES('SP02','Spring 2002', '02-04-28' ,'02-08-16');
INSERT INTO TERM (TERMID,TERMDESC,STARTDATE,ENDDATE) 
VALUES('FL02','FALL 2002', '02-09-08' ,'02-12-20');
INSERT INTO TERM (TERMID,TERMDESC,STARTDATE,ENDDATE) 
VALUES('WN02','WINTER 2003', '03-01-05' ,'03-04-18');
INSERT INTO TERM (TERMID,TERMDESC,STARTDATE,ENDDATE) 
VALUES('SP03','Spring 2003', '03-04-27' ,'03-08-15');
INSERT INTO TERM (TERMID,TERMDESC,STARTDATE,ENDDATE) 
VALUES('FL03','FALL 2003', '03-09-07' ,'03-12-19');


9
// DEPARTMENT done 
INSERT INTO DEPARTMENT (DEPTID,DEPTNAME) 
VALUES(1,'Computer Science');
INSERT INTO DEPARTMENT (DEPTID,DEPTNAME) 
VALUES(2,'Telecommunications');
INSERT INTO DEPARTMENT (DEPTID,DEPTNAME) 
VALUES(3,'Accounting');
INSERT INTO DEPARTMENT (DEPTID,DEPTNAME) 
VALUES(4,'Math and Science');
INSERT INTO DEPARTMENT (DEPTID,DEPTNAME) 
VALUES(5,'Liberal Arts');


UPDATE DEPARTMENT SET FACULTYID = '111' WHERE DEPTID=1;
UPDATE DEPARTMENT SET FACULTYID = '122' WHERE DEPTID=2; // 
UPDATE DEPARTMENT SET FACULTYID = '333' WHERE DEPTID=3;
UPDATE DEPARTMENT SET FACULTYID = '444' WHERE DEPTID=4;
UPDATE DEPARTMENT SET FACULTYID = '555' WHERE DEPTID=5;







10.  //MAJOR done 
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('100','AAS-Accounting');
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('200','AAS-Computer Science');
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('300','AAS-Telecommunications');
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('400','BS-Accounting');
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('500','BS-Computer Science');
INSERT INTO MAJOR (MAJORID,MAJORDESC) 
VALUES('600','BS-Telecommunications');








select constraint_name,constraint_type,table_name from user_constraints where table_name= 'students';

describe user_constraints;
