CREATE DATABASE Testing_system_assignment_1;
USE Testing_system_assignment_1;
 
 CREATE TABLE Department (
	DepartmentId		INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName		VARCHAR(100)
);

 CREATE TABLE  position (
	PositionID		INT PRIMARY KEY AUTO_INCREMENT,
    PositionName	VARCHAR(50)
);

  CREATE TABLE account (
	AccountID		INT,
	Email			VARCHAR(100),
    Username 		VARCHAR(100),
    FullName		VARCHAR(100),
    DepartmentID  	INT,
    PositionID		INT,
    CreateDate  	DATETIME,
    CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID),
    CONSTRAINT fk_position FOREIGN KEY (PositionID) REFERENCES position (PositionID)
    );
    
  CREATE TABLE  Groupf  (
    GroupID			INT PRIMARY KEY AUTO_INCREMENT,
    GroupName		VARCHAR(100),
    CreatorID		INT,
    CreateDate		Date
    );
    
  CREATE TABLE 	GroupAccount (
    GroupID 		INT,
    AccountID		INT
);
    
CREATE TABLE	TypeQuestion (
	TypeID			INT PRIMARY KEY AUTO_INCREMENT,
	TypeName		VARCHAR(100)
);

CREATE TABLE	CategoryQuestion (
	CategoryID		INT	PRIMARY KEY AUTO_INCREMENT,
    CategoryName	VARCHAR(100)
);

CREATE TABLE Question (
	QuestionID			INT	PRIMARY KEY AUTO_INCREMENT,
	Content				VARCHAR(100),
	CategoryID			INT,
	TypeID				INT,
	CreatorID			INT,
	CreateDate			DATE
);

CREATE TABLE Answer (
	AnswerID			INT	PRIMARY KEY AUTO_INCREMENT,
	Content				VARCHAR(100),
	QuestionID			INT,
	isCorrect			VARCHAR(50)
);

CREATE TABLE  Exam (
	ExamID				INT	PRIMARY KEY AUTO_INCREMENT,
	Code				INT,
	Title				VARCHAR(100),
	CategoryID			INT,
	Duration			DATETIME,
	CreatorID			INT,
	CreateDate			DATE
);

CREATE TABLE  ExamQuestion (
	ExamID				INT,
    QuestionID			INT
);

		
    
    
 