CREATE DATABASE Testing_system_assignment_1;
USE Testing_system_assignment_1;
 
 CREATE TABLE Department (
	DepartmentId		INT,
    DepartmentName		VARCHAR(100)
);

 CREATE TABLE  position (
	PositionID		INT,
    PositionName	VARCHAR(50)
);

  CREATE TABLE account (
	AccountID		INT,
	Email			VARCHAR(100),
    Username 		VARCHAR(100),
    FullName		VARCHAR(100),
    DepartmentID  	INT,
    PositionID		INT,
    CreateDate  	DATETIME
    );
    
  CREATE TABLE  Groupf  (
    GroupID			INT,
    GroupName		VARCHAR(100),
    CreatorID		INT,
    CreateDate		Date
    );
    
  CREATE TABLE 	GroupAccount (
    GroupID 		INT,
    AccountID		INT
);
    
CREATE TABLE	TypeQuestion (
	TypeID			INT,
	TypeName		VARCHAR(100)
);

CREATE TABLE	CategoryQuestion (
	CategoryID		INT,
    CategoryName	VARCHAR(100)
);

CREATE TABLE Question (
	QuestionID			INT,
	Content				VARCHAR(100),
	CategoryID			INT,
	TypeID				INT,
	CreatorID			INT,
	CreateDate			DATE
);

CREATE TABLE Answer (
	AnswerID			INT,
	Content				VARCHAR(100),
	QuestionID			INT,
	isCorrect			VARCHAR(50)
);

CREATE TABLE  Exam (
	ExamID				INT,
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

		
    
    
 