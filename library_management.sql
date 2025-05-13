

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    genre VARCHAR(100),
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO books (title, author, genre) VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction'),
('1984', 'George Orwell', 'Dystopian'),
('Clean Code', 'Robert C. Martin', 'Programming');

INSERT INTO members (name, email, phone) VALUES
('Anirban Sukul', 'anirban@example.com', '9876543210'),
('Riya Das', 'riya@example.com', '9998887777');

INSERT INTO transactions (book_id, member_id, issue_date) VALUES
(1, 1, CURDATE());

UPDATE books SET available = FALSE WHERE book_id = 1;

SELECT * FROM books;

SELECT * FROM books WHERE available = TRUE;

SELECT t.transaction_id, b.title, t.issue_date, t.return_date
FROM transactions t
JOIN books b ON t.book_id = b.book_id
WHERE t.member_id = 1;

UPDATE transactions
SET return_date = CURDATE()
WHERE transaction_id = 1;

UPDATE books
SET available = TRUE
WHERE book_id = 1;

SELECT * FROM transactions WHERE return_date IS NOT NULL;

