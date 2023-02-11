CREATE DATABASE MyFunkDB; 			-- Завдання 2: Создать базу данных с именем “MyFunkDB. 

DROP DATABASE MyFunkDB;

USE MyFunkDB;

CREATE TABLE general				-- Завдання 3: В данной базе данных создать 3 таблиц, В 1-й содержатся имена и номера телефонов сотрудников некой компании 
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
phone VARCHAR(22) NOT NULL UNIQUE
);

DROP TABLE general;

INSERT INTO general
(name, phone)
VALUES
('Vasya', '(099)225-65-14'),
('Petya', '(050)187-32-24'),
('Tosha', '(097)278-12-65'),
('Moisha', '(063)876-87-23'),
('Izya', '(067002-44-77');

SELECT * FROM general;

CREATE TABLE staff				-- Завдання 3: Во 2-й Ведомости об их зарплате, и должностях: главный директор, менеджер, рабочий.
(
person_id INT,
salary DOUBLE NOT NULL,
position VARCHAR(40) NOT NULL,
FOREIGN KEY(person_id) REFERENCES general(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP TABLE staff;

INSERT INTO staff
(person_id, salary, position)
VALUES
(1, 66000, 'CEO'),
(2, 16000, 'Manager'),
(3, 16000, 'Manager'),
(4, 6000, 'Engineer'),
(5, 6000, 'Engineer');

SELECT * FROM staff;

CREATE TABLE personal_data				-- Завдання 3: В 3-й семейном положении, дате рождения, где они проживают.
(
person_id INT,
status VARCHAR(10) NOT NULL,
birthday DATE NOT NULL,
address VARCHAR(40) NOT NULL,
FOREIGN KEY(person_id) REFERENCES general(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP TABLE personal_data;

INSERT INTO personal_data
(person_id, status, birthday, address)
VALUES
(1, 'free', '1989-02-03', 'Main str, 10, Kyiv, 01231, UA'),
(2, 'married', '1999-05-12', 'Left str. 13, Lviv 07242, UA'),
(3, 'married', '2000-06-15', 'Right str. 22, Kharkiv, 12331, UA'),
(4, 'free', '1992-09-30', 'Middle str. 3, Dnipro 54234, UA'),
(5, 'widow', '1998-12-01', 'Sea str. 66, Odesa 00234, UA');

SELECT * FROM personal_data;
           
