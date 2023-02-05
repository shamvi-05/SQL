create table STUDENT2(
StudentID CHAR(5),
Last	VARCHAR2(15) NOT NULL,
First	VARCHAR2(15) NOT NULL,
Street	VARCHAR2(25),	
City	VARCHAR2(15),	
State	VARCHAR(2)	Default 'NJ',
Zip	VARCHAR(5),	
StartTerm	VARCHAR(4),
Birthday	Date,
FacultyID	NUMBER(3),
MajorID	NUMBER(3),
Phone	CHAR(10),
constraint Student2 Primary Key(StudentID)	
)

create table Faculty2 (
FacultyID	NUMBER(3),
Name	VARCHAR2(15)	NOT NULL,
RoomID	NUMBER(2),
Phone	CHAR(3)	UNIQUE,
DeptID	NUMBER(1),
constraint Faculty2 Primary Key(FacultyID)	
)

create Table CRSSECTION2(
CsID	NUMBER(4),
CourseID	VARCHAR2(6) NOT NULL,
Section	CHAR(2)	NOT NULL,
TermID	 CHAR(4) NOT NULL,
FacultyID	NUMBER(3),
Day	VARCHAR2(2),
StartTime	VARCHAR2(5),
EndTime	VARCHAR2(5),
RoomID	NUMBER(2),
MaxCount	NUMBER(2)	CHECK (MaxCount>0),
constraint CRSSECTION2 primary key(CsID)
)

create Table COURSE2(
CourseID	VARCHAR2(6),
Title	VARCHAR2(20)	UNIQUE,
Credits	NUMBER(1)	CHECK (Credits>=0 AND Credits<=4),
PreReq	VARCHAR2(6),
constraint COURSE2 primary key(CourseID)
)

create Table REGISTRATION2(
StudentID	CHAR(5),
CsID	NUMBER(4),
Midterm	CHAR	CHECK (MidTerm IN ('A', 'B', 'C', 'D', 'F', 'W')),
Final	CHAR	CHECK (final IN ('A', 'B', 'C', 'D', 'I', 'F', 'W')),
RegStatus	CHAR	CHECK (RegStatus in ('X', 'R', 'W')),
constraint REGISTRATION2 primary key(StudentID,CsID)
)

create Table ROOM2(
RoomType	CHAR,
RoomDesc	VARCHAR2(9)	,
constraint ROOM2 primary key(RoomType)
)


create Table LOCATION2(
RoomID	NUMBER(2),
Building	VARCHAR2(7)	NOT NULL,
RoomNo	CHAR(3)	NOT NULL UNIQUE,
Capacity	NUMBER(2)	CHECK (Capacity>0),
RoomType	CHAR,
constraint LOCATION2 primary key(RoomID)
)

create Table TERM2(
TermID	CHAR(4),
TermDesc	VARCHAR2(11),	
StartDate	DATE,	
EndDate	DATE,	
constraint TERM2 primary key(TermID)
)
create Table DEPARTMENT2(
DeptID	NUMBER(1),
DeptName	VARCHAR2(20),	
FacultyID	NUMBER(3),
constraint DEPARTMENT2 primary key(DeptID)
)

create Table MAJOR2(
MajorID	NUMBER(3),
MajorDesc	VARCHAR2(25),	
constraint MAJOR2 primary key(MajorID)
)

Alter table term2 modify termid varchar(4)
ALTER TABLE Student2 
ADD CONSTRAINT Student2FK
FOREIGN KEY (StartTerm) REFERENCES Term2 (TermID);

ALTER TABLE Student2 
ADD CONSTRAINT StudentFacultyFK
FOREIGN KEY (FacultyID) REFERENCES Faculty2  (FacultyID);

ALTER TABLE Student2 
ADD CONSTRAINT StudentMajorFK
FOREIGN KEY (MajorID) REFERENCES Major2   (MajorID);


ALTER TABLE FACULTY2 
ADD CONSTRAINT FACULTYLocationFK
FOREIGN KEY (RoomID) REFERENCES Location2(RoomID);

ALTER TABLE FACULTY2 
ADD CONSTRAINT FACULTYDepartmentFK
FOREIGN KEY (DeptID) REFERENCES Department2 (DeptID);

ALTER TABLE CRSSECTION2
ADD CONSTRAINT CRSSECTIONCourseFK
FOREIGN KEY (CourseID) REFERENCES Course2  (CourseID);

alter table crssection2 modify termid varchar(4);

ALTER TABLE CRSSECTION2 
ADD CONSTRAINT CRSSECTIONTermFK
FOREIGN KEY (TermID) REFERENCES Term2 (TermID);

ALTER TABLE CRSSECTION2 
ADD CONSTRAINT CRSSECTIONFacultyFK
FOREIGN KEY (FacultyID) REFERENCES Faculty2 (FacultyID);

ALTER TABLE CRSSECTION2 
ADD CONSTRAINT CRSSECTIONLocationFK
FOREIGN KEY (RoomID) REFERENCES Location2 (RoomID);



ALTER TABLE REGISTRATION2
ADD CONSTRAINT REGISTRATIONStudentFK
FOREIGN KEY (StudentID) REFERENCES Student2  (StudentID);

ALTER TABLE REGISTRATION2
ADD CONSTRAINT REGISTRATIONCrssectionFK
FOREIGN KEY (CsID) REFERENCES Crssection2   (CsID);

ALTER TABLE LOCATION2
ADD CONSTRAINT LOCATIONRoomFK
FOREIGN KEY (RoomType) REFERENCES Room2   (RoomType);

ALTER TABLE DEPARTMENT2 
ADD CONSTRAINT DEPARTMENTFacultyFK
FOREIGN KEY (FacultyID) REFERENCES Faculty2     (FacultyID);

INSERT INTO Major2 (MajorId,MajorDesc) 
  WITH names AS ( 
      SELECT 100,'AAS-Accounting' FROM dual UNION ALL
      SELECT 200,	'AAS-Computer Science' FROM dual UNION ALL
      SELECT 300,	'AAS-Telecommunications' FROM dual UNION ALL
      SELECT 400,	'BS-Accounting' FROM dual UNION ALL
      SELECT 500,	'BS-Computer Science' FROM dual UNION ALL
      SELECT 600,	'BS-Telecommunications' FROM dual
  ) 
  SELECT * FROM names


select * from Major2

INSERT INTO Term2 (TermId,TermDesc,StartDate,EndDate) 
  WITH names AS ( 
      SELECT 'SP02',	'Spring 2002',	'28-APR-02',	'16-AUG-02' FROM dual UNION ALL
      SELECT 'FL02',	'Fall 2002',	'08-SEP-02',	'20-DEC-02' FROM dual UNION ALL
      SELECT 'WN03',	'Winter 2003',	'05-JAN-03',	'18-APR-03' FROM dual UNION ALL
      SELECT 'SP03',	'Spring 2003',	'27-APR-03',	'15-AUG-03' FROM dual UNION ALL
      SELECT 'FL03',	'Fall 2003',	'07-SEP-03',	'19-DEC-03' FROM dual 
  ) 
  SELECT * FROM names;


select * from Term2

INSERT INTO Room2 (RoomType, RoomDesc) 
  WITH names AS ( 
      SELECT 'L',	'Lab' FROM dual UNION ALL 
      SELECT 'C',	'Classroom' FROM dual UNION ALL 
      SELECT 'O',	'Office'	FROM dual

  ) 
  SELECT * FROM names;

select * from ROOM2

INSERT INTO Location2 (RoomId,Building,RoomNo,Capacity,RoomType) 
  WITH names AS ( 
      SELECT 11,	'Gandhi',	101,	2,	'O' FROM dual UNION ALL
      SELECT 12,	'Gandhi',	103,	2,	'O' FROM dual UNION ALL
      SELECT 13,	'Kennedy',	202,	35,	'L' FROM dual UNION ALL
      SELECT 14,	'Kennedy',	204,	50,	'L' FROM dual UNION ALL
      SELECT 15,	'Nehru',	301,	50,	'C' FROM dual UNION ALL
      SELECT 16,	'Nehru',	309,	45,	'C' FROM dual UNION ALL
      SELECT 17,	'Gandhi',	105,	2,	'O' FROM dual UNION ALL
      SELECT 18,	'Kennedy',	206,	40,	'L' FROM dual UNION ALL
      SELECT 19,	'Kennedy',	210,	30,	'L' FROM dual UNION ALL
      SELECT 20,	'Gandhi',	107,	2,	'O' FROM dual UNION ALL
      SELECT 21,	'Gandhi',	109,	2,	'O' FROM dual
  ) 
  SELECT * FROM names;

INSERT INTO Course2 (CourseId, Title, Credits, PreReq) 
  WITH names AS ( 
      SELECT 'EN100',	'Basic English',	0,NULL FROM dual UNION ALL 
      SELECT 'LA123',	'English Literature',	3,	'EN100' FROM dual UNION ALL 
      SELECT 'CIS253',	'Database Systems',	3,NULL	FROM dual UNION ALL 
      SELECT 'CIS265',	'Systems Analysis',3,	'CIS253' FROM dual UNION ALL 
      SELECT 'MA150',	'College Algebra',	3,NULL	FROM dual UNION ALL 
      SELECT 'AC101',	'Accounting'	,3,NULL	FROM dual

  ) 
  SELECT * FROM names
ALTER TABLE Department2
DISABLE CONSTRAINT DEPARTMENTFacultyFK;

INSERT INTO Department2 (DeptId,DeptName,FacultyId) 
  WITH names AS ( 
      SELECT 1,'Computer Science',	111 FROM dual UNION ALL
      SELECT 2,	'Telecommunications',	222 FROM dual UNION ALL
      SELECT 3,	'Accounting',333 FROM dual UNION ALL
      SELECT 4,	'Math and Science',	444 FROM dual UNION ALL
      SELECT 5,	'Liberal Arts',	555 FROM dual 
  ) 
  SELECT * FROM names

INSERT INTO Faculty2 (FacultyId,Name,RoomId,Phone,DeptId) 
  WITH names AS ( 
      SELECT 111,	'Jones',	11,	525,	1 FROM dual UNION ALL
      SELECT 222,	'Williams',	20,	533,	2 FROM dual UNION ALL
      SELECT 123,	'Mobley',	11,	529,	1 FROM dual UNION ALL
      SELECT 235,	'Vajpayee',	12,	577,	2 FROM dual UNION ALL
      SELECT 345,	'Sen',	12,	579,	3 FROM dual UNION ALL
      SELECT 444,	'Rivera',	21,	544,	4 FROM dual UNION ALL
      SELECT 555,	'Chang',	17,	587,	5 FROM dual UNION ALL
      SELECT 333,	'Collins',	17,	599,	3 FROM dual
  ) 
  SELECT * FROM names;
ALTER TABLE Department2
ENABLE CONSTRAINT DEPARTMENTFacultyFK;



INSERT INTO Student2 (StudentID,	Last,	First,	Street,	City,	State,	Zip,	StartTerm,	BirthDay,	FacultyId,	MajorId,	Phone) 
WITH names AS ( 
    SELECT 00100,	'Diaz',	'Jose',	'1 Ford Avenue #7',	'Hill',	'NJ',	'08863',	'WN03',	'12-FEB-83',	123	,100,	'9735551111' FROM dual UNION ALL
    SELECT 00101,	'Tyler',	'Mickey',	'12 Morris Avenue',	'Bronx',	'NY',	'10468',	'SP03',	'18-MAR-84',	555,	500,	'7185552222' FROM dual UNION ALL
    SELECT 00102,	'Patel','Rajesh',	'25 River Road #3',	'Edison',	'NJ',	'08837',	'WN03',	'12-Dec-85', 111,	400	,'7325553333' FROM dual UNION ALL
    SELECT 00103,	'Rickles','Deborah',	'100 Main Street',	'Iselin',	'NJ',	'08838',	'FL02',	'20-OCT-70',	555,	500	,'7325554444' FROM dual UNION ALL
    SELECT 00104,	'Lee',	'Brian',	'2845 First Lane',	'Hope',	'NY',	'11373',	'WN03',	'28-Nov-85',	345	,600,	'2125555555' FROM dual UNION ALL
    SELECT 00105,	'Khan',	'Amir',	'213 Broadway',	'Clifton',	'NJ',	'07222',	'WN03',	'07-JUL-84',	222	,200,	'2015556666' FROM dual
)
SELECT * FROM names;
select * from student2

INSERT INTO Crssection2(CsId,CourseId,Section,TermId,FacultyId,Day,StartTime,EndTime,RoomId,MaxCount)
WITH names AS ( 
select 1101,	'CIS265',	'01',	'WN03',	111,	'MW',	'09:00',	'10:30',	13,	30 FROM dual UNION ALL
select 1102,	'CIS253',	'01',	'WN03',	123	,   'TR',	'09:00',	'10:30',	18,	40 FROM dual UNION ALL
select 1103,	'MA150',	'02',	'WN03',	444,	'F',	'09:00',	'12:00',	15,	25 FROM dual UNION ALL
select 1104,	'AC101',	'10',	'WN03',	345,	'MW',	'10:30',	'12:00',	16,	35 FROM dual UNION ALL
select 1205,	'CIS265',	'01',	'SP03',	NULL,	'MW',	'09:00',	'10:30',	14,	35 FROM dual UNION ALL
select 1206,	'CIS265',	'02',	'SP03',	111,	'TR',	'09:00',	'10:30',	18,	30 FROM dual UNION ALL
select 1207,	'LA123',	'05',	'SP03',	NULL,	'MW',	'09:00',	'10:30',	15,	30 FROM dual UNION ALL
select 1208,	'CIS253',	'21',	'SP03',	123,	'TR',	'09:00',	'10:30',	14,	40 FROM dual UNION ALL
select 1209,	'CIS253',	'11',	'SP03',	111,	'MW',	'09:00',	'10:30',	18,	40 FROM dual UNION ALL
select 1210,	'CIS253',	'31',	'SP03',	123,	'F',	'TBA',	      'TBA',	19,	2 FROM dual 
)
SELECT * FROM names;

INSERT INTO Registration2(StudentId,CsId,MidTerm,Final,RegStatus)
WITH names AS ( 
select 00100,	1103,	'C',	'F',	        'R' FROM dual UNION ALL
select 00100,	1102,	'B',	'B',	        'R' FROM dual UNION ALL
select 00100,	1104,	'B',	'A',	        'R' FROM dual UNION ALL
select 00102,	1102,	'F',	'D',	        'R' FROM dual UNION ALL
select 00102,	1103,	'A',	'A',	        'R' FROM dual UNION ALL
select 00103,	1101,	'F',	'W',	        'W' FROM dual UNION ALL
select 00103,	1104,	'D',	'D',	        'R' FROM dual UNION ALL
select 00100,	1207,	NULL, NULL,		'X' FROM dual UNION ALL
select 00103,	1206,	NULL, NULL,		'W' FROM dual UNION ALL
select 00104,	1206,	NULL, NULL,		'X' FROM dual UNION ALL
select 00104,	1207,	NULL, NULL,	    'R' FROM dual UNION ALL
select 00104,	1210,	NULL, NULL,		'R' FROM dual UNION ALL
select 00105,	1208,	NULL, NULL,		'R' FROM dual UNION ALL
select 00105,	1209,	NULL, NULL,		'X' FROM dual UNION ALL
select 00101,	1205,	NULL, NULL,		'X' FROM dual UNION ALL
select 00102,	1210,	NULL, NULL,		'R' FROM dual UNION ALL
select 00102,	1207,	NULL, NULL,		'R' FROM dual UNION ALL
select 00102,	1206,	NULL, NULL,		'X' FROM dual
)
SELECT * FROM names;


select * from Registration2;
select * from location2;
select * from room2
select * from term2
select * from major2
select * from course2
select * from department2
select * from faculty2
select * from student2
select * from crssection2
