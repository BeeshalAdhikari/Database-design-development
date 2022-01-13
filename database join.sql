CREATE TABLE sms.student (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  roll_num INT,
  class INT,
  address_id SMALLINT UNSIGNED NOT NULL);
  
ALTER TABLE sms.student
 ADD CONSTRAINT fks_address_id
  FOREIGN KEY(address_id) REFERENCES sakila.address(address_id);
  
  INSERT INTO sms.student(first_name,last_name,roll_num,class,address_id) VALUES
  ('Binay','adhikari',98,11,102),
  ('Bishal','adhikari',8,1,155),
  ('kamal','aryal',28,15,12),
  ('madhu','dhakal',918,17,442),
  ('rita','sharma',91,15,343),
  ('Biraj','kc',911,8,109),
  ('hari','dhakal',18,9,155);
  
  
  CREATE TABLE sms.teacher (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(45) NOT NULL,
  `level` INT,
  `subject` VARCHAR(),
   phone INT,
  address_id SMALLINT UNSIGNED NOT NULL);
  ALTER TABLE sms.teacher 
  ADD COLUMN address_id SMALLINT UNSIGNED;
  
  ALTER TABLE sms.teacher 
  ADD COLUMN email VARCHAR(255) AFTER phone;
  
  ALTER TABLE sms.teacher
 ADD CONSTRAINT fkt_address_id
  FOREIGN KEY(address_id) REFERENCES sakila.address(address_id);
  
  INSERT INTO sms.teacher(`name`,`level`,`subject`,phone,email,address_id) VALUES
  ('Binay',12,'ME',987625,'binay@gmail.com',102),
  ('Hari',17,'IT',98769925,'hari@gmail.com',10), 
  ('Bishal',2,'bbs',98767925,'beeshal@gmail.com',144), 
  ('Madhu',1,'IT',987625,'madhu@gmail.com',177),
   ('kamal',10,'BE',98762775,'kamal@gmail.com',56), 
   ('ram',9,'csIT',987624445,'ram@gmail.com',166), 
   ('rita',12,'IT',987625,'rita@gmail.com',342);
   
   
   
   
SELECT
s.first_name,
a.address,
'student' AS 'Type'
FROM 
sms.student AS s
JOIN sakila.address AS a 
  ON  s.address_id=a.address_id  

UNION ALL
  
SELECT
t.name,
a.address,
'teacher'
FROM 
sms.teacher AS t
JOIN sakila.address AS a 
  ON  t.address_id=a.address_id;
   