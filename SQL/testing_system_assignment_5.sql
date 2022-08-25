USE Testing_System_Assignment_2;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW V_dsnv AS
SELECT A.*, DepartmentName
FROM `Account` A
JOIN `Department` D
ON A.DepartmentID = D.DepartmentID
WHERE DepartmentName = 'Sale';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW v_account AS
WITH CTE_GetListCountAccount AS (
	SELECT COUNT(AccountID) AS SL
	FROM `GroupAccount` GA 
    GROUP BY AccountID)

SELECT A.AccountID, A.Username, COUNT(GA.AccountID) AS SL FROM `GroupAccount` GA
INNER JOIN account A ON GA.AccountID = A.AccountID
GROUP BY GA.AccountID
HAVING COUNT(GA.AccountID) = (
	SELECT MAX(SL) FROM CTE_GetListCountAccount
);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW v_contenttren300 AS
SELECT *
FROM Question
WHERE LENGTH(Content) > 300;

SELECT * FROM v_contenttren300;

DELETE FROM v_contenttren300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW V_MaxNV AS
SELECT D.DepartmentName, COUNT(A.DepartmentID) AS SL
FROM account A
INNER JOIN `department` D ON D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) = (SELECT MAX(countDEP_ID) AS maxDEP_ID FROM
(SELECT COUNT(A1.DepartmentID) AS countDEP_ID FROM account A1
GROUP BY A1.DepartmentID) AS TB_countDepID);

SELECT * FROM V_MaxNV;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW V_QuestionCreateByNguyen AS
SELECT Q.QuestionID, Q.Content, A.FullName AS Creator FROM question Q
INNER JOIN `Account` A ON A.AccountID = Q.CreatorID
WHERE SUBSTRING_INDEX( A.FullName, ' ', 1 ) = 'Nguyễn';

SELECT * FROM V_QuestionCreateByNguyen;


