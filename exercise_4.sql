USE MyFunkDB;			-- Завдання 4: Создайте функции / процедуры для таких заданий: 1) Требуется узнать контактные данные сотрудников (номера телефонов, место жительства).

SELECT * FROM general;

SELECT * FROM staff;

SELECT * FROM personal_data;

DELIMITER $$

DROP PROCEDURE contacts; $$

CREATE PROCEDURE contacts()
BEGIN
	SELECT name, phone, address FROM general
    JOIN personal_data
    ON general.id = personal_data.person_id
    ORDER BY name;
END $$

CALL contacts() $$

							-- Завдання 4: 2) Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников.
DELIMITER $$

DROP PROCEDURE free_men_birthdays; $$

CREATE PROCEDURE free_men_birthdays (IN f_status VARCHAR(10))
BEGIN
	SELECT name, birthday, phone FROM general AS g
    JOIN personal_data AS p
    ON g.id = p.person_id
    WHERE p.status = f_status
    ORDER BY name;
END $$

CALL free_men_birthdays ('free'); $$

							-- Завдання 4: 3) Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.

DROP PROCEDURE managers; $$

DELIMITER $$

CREATE PROCEDURE managers (IN m_position VARCHAR(15))
BEGIN
	SELECT position, name, birthday, phone FROM general g
		JOIN staff s
        ON g.id = s.person_id
        JOIN personal_data p
        ON g.id = p.person_id
	WHERE s.position = m_position
    ORDER BY name;
END $$

CALL managers ('manager'); $$