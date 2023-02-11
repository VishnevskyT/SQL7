CREATE DATABASE carsshop;			-- Завдання 5: Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента, затем сделайте выборку всех машин, которые он купил.
            
DROP DATABASE carsshop;

USE carsshop;

CREATE TABLE marks(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   mark VARCHAR(20) UNIQUE
);

CREATE TABLE cars
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  mark_id INT NOT NULL,
  model VARCHAR(20) NOT NULL,
  price INT NOT NULL,
  FOREIGN KEY(mark_id) REFERENCES marks(id)
);

CREATE TABLE clients
(
	 id INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(30),
     age TINYINT,
     phone VARCHAR(15),
     PRIMARY KEY (id)
);

CREATE TABLE orders
(
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     car_id INT NOT NULL,
     client_id INT NOT NULL,
     FOREIGN KEY(car_id) REFERENCES cars(id),
     FOREIGN KEY(client_id) REFERENCES clients(id)
);

INSERT INTO marks
(mark)
VALUES
('Audi');

INSERT INTO marks
(mark)
VALUES
('Porsche');

INSERT INTO cars
(mark_id, model, price)
VALUES
(1, 'A5', 50000);

INSERT INTO cars
(mark_id, model, price)
VALUES
(2, 'panamera', 100000);

INSERT INTO cars
(mark_id, model, price)
VALUES
(2, 'caymen S', 88000);

INSERT INTO clients
(name, age)
VALUES
('petro', 20),
('vasya', 25),
('vitaly', 75);

INSERT INTO orders
(car_id, client_id)
VALUES
(1, 1), (2, 2), (1, 3);

SELECT * FROM marks;

SELECT * FROM cars;

SELECT * FROM clients;

SELECT * FROM orders;

DELIMITER $$

DROP FUNCTION min_age $$

CREATE FUNCTION min_age()
RETURNS DOUBLE DETERMINISTIC
BEGIN
	 RETURN (SELECT MIN(age) FROM clients);
   
END $$

SELECT mark, model, name, age FROM clients cl 
            INNER JOIN orders o ON cl.id = o.client_id
			INNER JOIN cars c ON c.id = o.car_id
            INNER JOIN marks m ON c.mark_id = m.id
            WHERE cl.age = min_age(); $$