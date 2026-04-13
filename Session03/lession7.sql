CREATE SCHEMA sales;
CREATE TABLE sales.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    price NUMERIC(10,2),
    stock_quantity INT
);

CREATE TABLE sales.orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id INT REFERENCES library.members(member_id)
);

CREATE TABLE sales.orderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.orders(order_id),
    product_id INT REFERENCES sales.products(product_id),
    quantity INT
);