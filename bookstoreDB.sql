CREATE DATABASE `Bookstore`;
USE Bookstore;

CREATE TABLE `books` (
  `BookID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TotalPage` int DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` tinyint DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `borrows` (
  `BorrowID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `BookID` int NOT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `BorrowDate` datetime NOT NULL,
  PRIMARY KEY (`BorrowID`),
  KEY `BorrowStudent` (`StudentID`),
  KEY `BorrowBook` (`BookID`),
  CONSTRAINT `BorrowBook` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BorrowStudent` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

TRUNCATE TABLE Borrows;

-- Students 
 insert into Students (StudentID,Name,Age,Gender) values(1,"Nguyen Thi Huyen",19,0);
 insert into Students (StudentID,Name,Age,Gender) values(2,"Mai Thanh Minh",33,1);
 insert into Students (StudentID,Name,Age,Gender) values(3,"Dao Thien Hai",26,1);
 insert into Students (StudentID,Name,Age,Gender) values(4,"Trinh Chan Tran",24,0);
 insert into Students (StudentID,Name,Age) values(5,"Diem Diem Quynh",30);
-- Books
insert into Books (BookID,Name,TotalPage,Quantity) values (1,"Word",50,10);
insert into Books (BookID,Name,TotalPage,Quantity) values (2,"Excel",60,20);
insert into Books (BookID,Name,TotalPage,Quantity) values (3,"Access",71,7);
insert into Books (BookID,Name,TotalPage,Quantity) values (4,"LGC",42,1);
insert into Books (BookID,Name,TotalPage,Quantity) values (5,"HTML",71,2);
-- Borrows
insert into Borrows(StudentID, BookID, BorrowDate) values (1,1,"2004-10-29");
insert into Borrows(StudentID, BookID, BorrowDate) values (2,1,"2004-10-26");
insert into Borrows(StudentID, BookID, BorrowDate) values (3,1,"2004-10-29");
insert into Borrows(StudentID, BookID, BorrowDate) values (1,2,"2004-10-26");
insert into Borrows(StudentID, BookID, BorrowDate) values (4,5,"2004-10-29");
insert into Borrows(StudentID, BookID, BorrowDate) values (5,5,"2004-10-26");

select Students.Name, Books.Name from Borrows 
						inner join Books on Borrows.BookID = Books.BookID
					    inner join Students on Borrows.StudentID = Students.StudentID;

select Students.StudentID, Students.Name,sum(Borrows.quantity) from Borrows right join Students on Borrows.StudentID = Students.StudentID
group by Students.Name;
                        
select BookId, max(countTemp.NumOfBorrowingStudents) 'Tong so nguoi muon nhieu nhat'
from (select BookId, count(StudentID) 'NumOfBorrowingStudents' from Borrows group by BookId) countTemp;

SELECT 
    Books.Name,
    Books.quantity,
    SUM(Borrows.quantity) AS 'Borrow quantity',
    Books.quantity - IFNULL(SUM(Borrows.quantity), 0) AS 'Co san'
FROM
    Books
        LEFT JOIN
    Borrows ON Borrows.BookID = Books.BookID
GROUP BY Books.Name;

