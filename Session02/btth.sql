CREATE SCHEMA library;
CREATE TABLE library.members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    birth_date DATE,
    address TEXT,
    status VARCHAR(10) CHECK (status IN ('active','inactive')),
    join_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE library.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE library.authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE TABLE library.books (
    book_id SERIAL PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    title VARCHAR(200) NOT NULL,
    published_year INT,
    publisher VARCHAR(100),
    total_copies INT NOT NULL CHECK (total_copies >= 0),
    available_copies INT NOT NULL CHECK (available_copies >= 0),
    category_id INT
);

CREATE TABLE library.borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    member_id INT,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    CHECK (due_date > borrow_date)
);

CREATE TABLE library.borrowing_details (
    borrowing_detail_id SERIAL PRIMARY KEY,
    borrowing_id INT,
    book_id INT,
    quantity INT NOT NULL CHECK (quantity > 0)
);

CREATE TABLE library.book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id)
);

-- add_constraints
ALTER TABLE library.books
ADD CONSTRAINT fk_books_category
FOREIGN KEY (category_id)
REFERENCES library.categories(category_id);

ALTER TABLE library.borrowings
ADD CONSTRAINT fk_borrow_member
FOREIGN KEY (member_id)
REFERENCES library.members(member_id);

ALTER TABLE library.borrowing_details
ADD CONSTRAINT fk_bd_borrow
FOREIGN KEY (borrowing_id)
REFERENCES library.borrowings(borrowing_id);

ALTER TABLE library.borrowing_details
ADD CONSTRAINT fk_bd_book
FOREIGN KEY (book_id)
REFERENCES library.books(book_id);

ALTER TABLE library.book_authors
ADD CONSTRAINT fk_ba_book
FOREIGN KEY (book_id)
REFERENCES library.books(book_id);

ALTER TABLE library.book_authors
ADD CONSTRAINT fk_ba_author
FOREIGN KEY (author_id)
REFERENCES library.authors(author_id);

-- sample_data
INSERT INTO library.members (full_name, email, phone, status)
VALUES ('Quang Nguyen', 'quang@gmail.com', '0123456789', 'active');

INSERT INTO library.categories (category_name)
VALUES ('Programming');

INSERT INTO library.authors (author_name)
VALUES ('Robert C. Martin');

INSERT INTO library.books (isbn, title, published_year, publisher, total_copies, available_copies, category_id)
VALUES ('9780132350884', 'Clean Code', 2008, 'Prentice Hall', 10, 10, 1);

INSERT INTO library.book_authors (book_id, author_id)
VALUES (1, 1);

INSERT INTO library.borrowings (member_id, borrow_date, due_date)
VALUES (1, CURRENT_DATE, CURRENT_DATE + 7);

INSERT INTO library.borrowing_details (borrowing_id, book_id, quantity)
VALUES (1, 1, 1);