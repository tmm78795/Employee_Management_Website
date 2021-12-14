DROP DATABASE IF EXISTS Legends_Payroll;
CREATE DATABASE Legends_Payroll;

USE Legends_Payroll;

CREATE TABLE employer (
    
    id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone_number VARCHAR(40) NOT NULL,
    company_code INT(10) NOT NULL,
    password VARCHAR(20) NOT NULL

);

CREATE TABLE employee (
    
    id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone_number VARCHAR(40) NOT NULL,
    company_code INT(10) NOT NULL,
    password VARCHAR(20) NOT NULL

);

CREATE TABLE bank_detail (

    id INT PRIMARY KEY,
    account_number VARCHAR(40) NOT NULL,
    transit_number VARCHAR(20) NOT NULL,
    institute_number VARCHAR(20) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (id) on delete cascade
);
CREATE TABLE leave_Mgt (
    leave_Id INT PRIMARY KEY,
    leave_Type VARCHAR(50) NOT NULL,
	date_To DATE,
	date_From DATE,
	description mediumtext NOT NULL,
	status tinytext NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (id) on delete cascade

);

INSERT INTO employer (id, first_name, last_name, email, phone_number, company_code, password)
    VALUES (1, "Tushant", "Mehta", "tmm78795@gmail.com", 7787726120, 123, 123456);

INSERT INTO employee (id, first_name, last_name, email, phone_number, company_code, password)
    VALUES (1, "Tilak", "Mehta", "tmm78795@gmail.com", 7787726120, 123, 123456),
            (2,"Jaisika", "Singh", "jaisikanarang@gmail.com", 7789875222, 12345, 12345);


INSERT INTO bank_detail (id, account_number, transit_number, institute_number, employee_id)
    VALUES (1, "123456", "002", "5856", 1);
        
INSERT INTO leave_Mgt(leave_Id, leave_Type, date_to, date_From, description, status, employee_id)
    VALUES(1, "Sick", "2020-12-05", "2020-12-10", "Not Well", "Applied", "2");
