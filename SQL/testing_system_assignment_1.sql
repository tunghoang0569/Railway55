DROP DATABASE IF EXISTS Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
	DepartmentID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName		VARCHAR(250) NOT NULL
);

DROP TABLE IF EXISTS `Position`;
 CREATE TABLE  `Position` (
	PositionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName	VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS `Account`;
  CREATE TABLE `Account` (
	AccountID		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Email			VARCHAR(250) NOT NULL, 
    Username 		VARCHAR(250),
    FullName		VARCHAR(250) NOT NULL,
    DepartmentID  	TINYINT UNSIGNED NOT NULL ,
    PositionID		TINYINT UNSIGNED NOT NULL,
    CreateDate  	DATETIME,
    CONSTRAINT FOREIGN KEY (DepartmentID) REFERENCES `Department`(DepartmentID),
    CONSTRAINT FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
    );
    
DROP TABLE IF EXISTS  `Group`;
  CREATE TABLE  `Group`  (
    GroupID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    GroupName		VARCHAR(100) NOT NULL,
    CreatorID		SMALLINT UNSIGNED ,
    CreateDate		DATETIME
    );
    
DROP TABLE IF EXISTS `GroupAccount`;
  CREATE TABLE 	`GroupAccount` (
    GroupID 		INT UNSIGNED PRIMARY KEY,
    AccountID		SMALLINT UNSIGNED NOT NULL,
    JoinDate		DATETIME,
    CONSTRAINT FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
);
    
DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE	`TypeQuestion` (
	TypeID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	TypeName		ENUM('Essay', 'Multiple-Choice') NOT NULL
);

DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE	`CategoryQuestion` (
	CategoryID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName	VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question` (
	QuestionID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content				VARCHAR(1000) NOT NULL,
	CategoryID			TINYINT UNSIGNED NOT NULL,
	TypeID				TINYINT UNSIGNED NOT NULL,
	CreatorID			TINYINT UNSIGNED,
	CreateDate			DATETIME,
    CONSTRAINT FOREIGN KEY  (CategoryID) REFERENCES `CategoryQuestion` (CategoryID),
    CONSTRAINT FOREIGN KEY (TypeID) REFERENCES `TypeQuestion` (TypeID)
);

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer` (
	AnswerID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content				VARCHAR(100),
	QuestionID			TINYINT UNSIGNED NOT NULL,
	isCorrect			ENUM ('TRUE','FALSE'),
    CONSTRAINT FOREIGN KEY (QuestionID) REFERENCES `Question` (QuestionID) 
);

DROP TABLE IF EXISTS `Exam`;
CREATE TABLE  `Exam` (
	ExamID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Codes				VARCHAR(250) NOT NULL,
	Title				VARCHAR(250) NOT NULL, 
	CategoryID			TINYINT UNSIGNED,
	Duration			TINYINT UNSIGNED NOT NULL,
	CreatorID			INT UNSIGNED,
	CreateDate			DATETIME
);

DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE  `ExamQuestion` (
	ExamID				TINYINT UNSIGNED NOT NULL,
    QuestionID			TINYINT UNSIGNED NOT NULL,
    CONSTRAINT FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID),
    CONSTRAINT FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);


INSERT INTO `Department` (DepartmentID, DepartmentName)
VALUES
		(1,'Sales'),
        (2,'Marketing'),
        (3,'Accounting'),
        (4,'Customer'),
        (5,'International'),
        (6,'CEO'),
        (7,'CODE'),
        (8,'DEV'),
        (9,'SOLO'),
        (10,'Support');
        
INSERT INTO `Position` (PositionID, PositionName)
VALUES
		(1,'CEO'),
        (2,'BRSE'),
        (3,'DEV'),
        (4,'SUP'),
        (5,'PM'),
        (6,'CEO2'),
        (7,'BRSE2'),
        (8,'SUP2'),
        (9,'DEV2'),
		(10,'PM2');
        
INSERT INTO `Account` (AccountID, Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
VALUES 
		(20, 'tung@gmail.com', 'tung', 'tunghoang', 1, 1, '2010-08-06 06:06:06' ),
        (21, 'hung@gmail.com', 'hung', 'hungpham' , 2, 2, '2011-08-06 06:06:06' ),
        (22, 'nam@gmail.com', 'nam', 'namnguyen', 3, 3, '2012-08-06 06:06:06' ),
        (23, 'tan@gmail.com', 'tan', 'tanban', 4, 4, '2013-08-06 06:06:06' ),
        (24, 'tam@gmail.com', 'tam', 'thaitam', 5, 5, '2014-08-06 06:06:06' ),
        (25, 'hieu@gmail.com', 'hieu', 'trihieu', 6, 6, '2015-08-06 06:06:06' ),
        (26, 'dat@gmail.com', 'dat', 'datthao', 7, 7, '2016-08-06 06:06:06' ),
        (27, 'thien@gmail.com', 'thien', 'thienthu', 8, 8, '2017-08-06 06:06:06' ),
        (28,'tuan@gmail.com', 'tuan', 'tuanxich', 9, 9, '2018-08-06 06:06:06' ),
        (29, 'cong@gmail.com', 'cong', 'congtang', 10, 10, '2019-08-06 06:06:06' );
        
INSERT INTO `Group` (GroupID, GroupName, CreatorID, CreateDate)
VALUES

		(1, 'Group1', 1, '2011-1-19'),
		(2, 'Group2', 2, '2012-1-18'),
		(3, 'Group3', 3, '2013-1-17'),
		(4, 'Group4', 4, '2014-1-16'),
		(5, 'Group5', 5, '2015-1-15'),
		(6, 'Group6', 6, '2016-1-14'),
		(7, 'Group7', 7, '2017-1-13'),
		(8, 'Group8', 8, '2018-1-12'),
		(9, 'Group9', 9, '2019-1-11'),
		(10, 'Group10', 10, '2022-1-15');
        
INSERT INTO `GroupAccount`(GroupID, AccountID, JoinDate)
VALUES
		(1, 20, '2022-1-1'),
		(2, 21, '2022-1-3'),
		(3, 22, '2022-1-4'),
		(4, 23, '2022-1-5'),
		(5, 24, '2022-1-6'),
		(6, 25, '2022-1-7'),
		(7, 26, '2022-1-8'),
		(8, 27, '2022-1-9'),
		(9, 28, '2022-1-10'),
		(10, 29, '2022-1-18');
        
INSERT INTO `TypeQuestion`(TypeID, TypeName)
VALUES
		(1, 'Essay'),
		(2, 'Multiple-Choice'),
		(3, 'Essay'),
		(4, 'Multiple-Choice'),
		(5, 'Essay'),
		(6, 'Essay'),
		(7, 'Multiple-Choice'),
		(8, 'Essay'),
		(9, 'Multiple-Choice'),
		(10, 'Essay');

INSERT INTO `CategoryQuestion`(CategoryID, CategoryName)
VALUES
		(1, 'tung1'),
		(2, 'tung2'),
		(3, 'tung3'),
		(4, 'tung4'),
		(5, 'tung5'),
		(6, 'tung6'),
		(7, 'tung7'),
		(8, 'tung8'),
		(9, 'tung9'),
		(10, 'tung10');
        
INSERT INTO `Question`(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES
		(1,'How are you1' , 1, 1, 1, '2011-1-19'),
		(2,'How are you2' , 3, 2, 1, '2012-1-18' ),
		(3,'How are you3' , 2, 3, 1, '2013-1-17'),
		(4,'How are you4' , 5, 5, 1, '2014-1-16' ),
		(5,'How are you5' , 4, 4, 1, '2015-1-15' ),
		(6,'How are you6' , 1, 1, 1, '2016-1-14' ),
		(7,'How are you7' , 3, 2, 1, '2017-1-13' ),
		(8,'How are you8' , 2, 3, 1, '2018-1-12' ),
		(9,'How are you9' , 5, 5, 1, '2019-1-11' ),
		(10,'How are you10', 4, 4, 1, '2022-1-15');        
        
INSERT INTO `Answer`(AnswerID, Content, QuestionID, isCorrect)
VALUES
	(1, 'I am fine', 1, 'TRUE'),
    (2, 'I am fine2', 1,'TRUE' ),
    (3, 'I am fine3', 1, 'TRUE'),
    (4, 'I am fine4', 1, 'TRUE'),
    (5, 'I am fine5', 1, 'TRUE'),
	(6, 'I am fine6', 5, 'TRUE'),
    (7, 'I am fine7', 5, 'FALSE'),
    (8, 'I am fine8', 5, 'FALSE'),
    (9, 'I am fine9', 5, 'FALSE'),
    (10, 'I am fine10', 2, 'FALSE');
    
INSERT INTO `Exam`(ExamID, Codes, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
	(1, 'ExamCode1', 'ExamTitle1', 1, '60', 1, '2011-1-19'),
    (2, 'ExamCode2', 'ExamTitle2', 3, '50', 1, '2012-1-18'),
    (3, 'ExamCode3', 'ExamTitle3', 2, '40', 1, '2013-1-17'),
    (4, 'ExamCode4', 'ExamTitle4', 5, '30', 1, '2014-1-16'),
    (5, 'ExamCode5', 'ExamTitle5', 4, '20', 1, '2015-1-15'),
	(6, 'ExamCode6', 'ExamTitle6', 1, '10', 1, '2016-1-14'),
    (7, 'ExamCode7', 'ExamTitle7', 3, '15', 1, '2017-1-13'),
    (8, 'ExamCode8', 'ExamTitle8', 2, '25', 1, '2018-1-12'),
    (9, 'ExamCode9', 'ExamTitle9', 5, '35', 1, '2019-1-11'),
    (10, 'ExamCode10', 'ExamTitle10', 4, '45', 1, '2022-1-15');
    
INSERT INTO `ExamQuestion`(ExamID, QuestionID)
VALUES
	(1, 1),
    (2, 3),
    (3, 1),
    (4, 4),
    (5, 2),
	(6, 1),
    (7, 3),
    (8, 1),
    (9, 4),
    (10, 2);

		
    
    
 