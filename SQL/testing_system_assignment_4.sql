USE Testing_System_Assignment_2;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT A.Email, A.Username , A.FullName, D.DepartmentName
FROM `Account` A
JOIN Department D ON A.DepartmentID = D.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `Account`
WHERE CreateDate < '2020-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT A.FullName, A.Email, P.PositionName
FROM `Account` A
JOIN `Position` P ON A.PositionID = P.PositionID
WHERE P.PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên
SELECT D.DepartmentName, COUNT(a.DepartmentID) AS SL FROM `Account` A
JOIN `Department` D ON a.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) > 3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT Q.Content, Q.QuestionID , COUNT(Q.QuestionID) AS dem 
FROM `Question` Q
JOIN `ExamQuestion` AS E ON Q.QuestionID = E.QuestionID
GROUP BY QuestionID 
ORDER BY dem desc limit 1;


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT C.*, COUNT(Q.QuestionID) AS soluong
FROM `CategoryQuestion` C
JOIN `Question` Q ON C.CategoryID = Q.CategoryID
GROUP BY C.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.QuestionID,Q.Content, COUNT(EQ.QuestionID) AS 'SO LUONG'
FROM `Question` Q
LEFT JOIN ExamQuestion EQ ON EQ.QuestionID = Q.QuestionID
GROUP BY EQ.QuestionID ORDER BY Q.QuestionID ASC;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.QuestionID, Q.Content, count(A.QuestionID) FROM answer A
INNER JOIN question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING count(A.QuestionID) = (SELECT max(countQues) FROM
(SELECT count(B.QuestionID) AS countQues FROM answer B
GROUP BY B.QuestionID) AS countAnsw);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 
    G.GroupID, COUNT(GA.AccountID) AS 'SO LUONG ACCOUNT'
FROM
    GroupAccount GA JOIN
    `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
ORDER BY G.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT P.PositionID, P.PositionName, count( A.PositionID) AS SL FROM account A
INNER JOIN position P ON A.PositionID = P.PositionID
GROUP BY A.PositionID
HAVING count(A.PositionID)= (SELECT MIN(minP) FROM(
SELECT count(B.PositionID) AS minP FROM account B
GROUP BY B.PositionID) AS minPA);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.DepartmentID,d.DepartmentName, p.PositionName, COUNT(p.PositionName) AS SLNV
FROM `Account` a
JOIN `Department` d ON a.DepartmentID = d.DepartmentID
JOIN `Position` p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, p.PositionID
ORDER BY DepartmentID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS Author, ANS.Content FROM question Q
JOIN `CategoryQuestion` CQ ON Q.CategoryID = CQ.CategoryID
JOIN `TypeQuestion` TQ ON Q.TypeID = TQ.TypeID
JOIN `Account` A ON A.AccountID = Q.CreatorID
JOIN `Answer` AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC;

-- Question 16: Lấy ra question không có answer nào
SELECT q.QuestionID FROM answer a
RIGHT JOIN question q on a.QuestionID = q.QuestionID
WHERE A.AnswerID IS NULL;
