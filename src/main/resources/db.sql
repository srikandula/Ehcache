CREATE USER 'emp'@'localhost' IDENTIFIED BY 'techm123';
GRANT ALL PRIVILEGES ON *.* TO 'emp'@'localhost'   WITH GRANT OPTION;

CREATE USER 'emp'@'%' IDENTIFIED BY 'techm123';
GRANT ALL PRIVILEGES ON *.* TO 'emp'@'%'  WITH GRANT OPTION;

FLUSH PRIVILEGES;

drop table employee;
CREATE TABLE `Employee` (
  `emp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(20) NOT NULL,
  `emp_salary` double(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
  
 
insert into employee(emp_id,emp_name,emp_salary) values (1,'Srini',1000);
insert into employee(emp_id,emp_name,emp_salary) values (2,'Hanu', 2000);
insert into employee(emp_id,emp_name,emp_salary) values (3,'Ravi', 3000);



drop table address;  
CREATE TABLE `Address` (
  `emp_id` int(11) unsigned NOT NULL,
  `address_line1` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `emp_fk_1` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
insert into address(emp_id,address_line1,zipcode,city) values (1,'Line1','100001', 'A1');
insert into address(emp_id,address_line1,zipcode,city) values (2,'Line2','100002', 'A2');
insert into address(emp_id,address_line1,zipcode,city) values (3,'Line3','100003', 'A3');
