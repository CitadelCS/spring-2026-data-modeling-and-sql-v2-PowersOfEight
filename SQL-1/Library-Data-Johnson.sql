-- AUTHOR: James Daniel Johnson
-- COURSE: CSCI 601 Spring 2026 - Data Modeling and SQL
-- INSTRUCTOR: Dr. John Ravan

-- Use the LIBRARY schema
SET SEARCH_PATH TO LIBRARY, PUBLIC;


INSERT INTO PUBLISHER 
  (Name, Address, Phone)
VALUES
  ('Random House', '123 Main Street, New York NY, 12345', '555-555-5555')
  ,('Macmillan', '456 Gauche Street, Lubbock TX, 80881', '404-501-5555')
  ,('HarperCollins', '789 Main Street, Sacramento CA, 54321', '404-502-3456')
;

INSERT INTO LIBRARY_BRANCH
  (Branch_name, Address)
VALUES
  ('Central Chicago', '123 Main Street, Chicago IL, 60601')
  ,('Charleston Municipal', '321 Calhoun Street, Charleston SC, 29425')
  ,('Augusta Riverside', '444 Washington Road, Augusta GA, 23456')
;

INSERT INTO BORROWER
  (Name, Address, Phone)
VALUES
  ('Wild Bill Hickock', '456 Olde El Paso Street, El Paso TX, 79901', '555-123-4567')
  ,('Luke Skywalker', '789 Tatooine Street, Tatooine, 12345', '555-987-6543')
  ,('John Doe', '1023 Main Street, New York NY, 12345', '555-333-5555')
;

INSERT INTO BOOK
  (Title, Publisher_name)
VALUES
  ('The Wealth of Nations', 'Random House')
  ,('The Adventures of Tom Sawyer', 'Macmillan')
  ,('Catch-22', 'HarperCollins')
;

INSERT INTO BOOK_AUTHORS
  (Book_id, Author_name)
VALUES
  (1, 'Adam Smith')
  ,(2, 'Mark Twain')
  ,(3, 'Joseph Heller')
;

INSERT INTO BOOK_COPIES
  (Book_id, Branch_id, No_of_copies)
VALUES
  (1, 1, 3)
  ,(1, 2, 2)
  ,(1, 3, 4)
  ,(2, 1, 5)
  ,(2, 2, 3)
  ,(2, 3, 6)
  ,(3, 1, 4)
  ,(3, 2, 5)
  ,(3, 3, 7)
;

INSERT INTO BOOK_LOANS
  (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES
  (1, 1, 1, '1999-01-01', '2000-12-31')
  ,(2, 2, 2, '2005-12-30', '2006-01-30')
  ,(3, 3, 3, '2001-10-10', '2001-11-12')
;

-- END OF library data
--
