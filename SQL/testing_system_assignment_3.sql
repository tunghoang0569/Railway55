USE Testing_System_Assignment_2;

-- Q1 đã thêm

-- Q2 lấy ra tất cả các phòng ban
SELECT * FROM `Department` ORDER BY DepartmentID;

-- Q3 lấy ra id của phòng ban "Sale"
SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sales';

-- Q4 lấy ra thông tin account có full name dài nhất
SELECT * FROM `Account` WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)ORDER BY AccountID;

-- Q5 Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * FROM `Account` WHERE AccountID = 3 ORDER BY LENGTH(FullName) DESC LIMIT 1;

-- Q6 Lấy ra tên group đã tạo trước ngày 20/12/2019
SELECT GroupName, CreateDate FROM `Group` WHERE CreateDate < '2019-12-20';

-- Q7 Lấy ra ID của Question có >= 4 câu trả lời
SELECT A.QuestionID FROM `Answer` A GROUP BY A.QuestionID HAVING COUNT(A.QuestionID) >= 4;

-- Q8 Lấy ra các mã đề thi có thời gian thi >= 60 phút ho được tạo trước ngày 20/12/2019
SELECT ExamID FROM `Exam` WHERE Duration  >=60 and CreateDate < 20/12/2019;

-- Q9 Lấy ra 5 Group được tạo gần đây nhất
SELECT *FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

-- Q10 Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(AccountID) AS NumberOfAccount FROM `Account` WHERE DepartmentID = 2;

-- Q11 Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT Fullname FROM `Account` WHERE FullName LIKE 'D%o';

SELECT (SUBSTRING_INDEX(FullName, ' ', 1)) FROM `Account`;
SELECT (SUBSTRING_INDEX(FullName, ' ', 2)) FROM `Account`;
SELECT (SUBSTRING_INDEX(FullName, ' ', 3)) FROM `Account`;

-- Q12 Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM `Exam` WHERE CreateDate < '2019-12-20';

-- Q13 Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `Question` WHERE (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi';

-- Q14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account` SET Fullname = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;

-- Q15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `testing_system_assignment_1`.`groupaccount`
SET `AccountID` = 5 WHERE `GroupID` = 4

