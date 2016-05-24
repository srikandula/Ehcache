# Ehcache
Ehcache second level cache implmentations


Hibernate cache Types
•	First Level Cache: Hibernate first level cache is associated with the Hibernate Session object. This is by default enable.
•	Second Level Cache : That is if objects are not in hibernate session. This is used for replication across multiple nodes in a cluster. Supported by Ehcache and Infinispan.
•	Query Cache: Hibernate can also cache result set of a query.

Setup Information
1.	Pre-requistes.
a.	 Install mysql
b.	Tomcat/ JBoss (at least 2 instances, Say one is running on 6080 port and second one is 7080 ports)
2.	Database Setup
a.	DB scripts to create tables (employee table) is available in /cache/src/main/resources/db.sql
3.	Application
a.	Attached zip contains war file and source code. So you can use war as it is, otherwise you can build using maven pom
4.	Testing
a.	The war contains two jsp files 
i.	http://localhost:6080/cache/view.jsp?_id=2  To query an employee from database or if already in cache view from it
ii.	http://localhost:6080/cache/insert.jsp --> To insert new employee into database
b.	Insert a new employee using http://localhost:6080/cache/insert.jsp and say it created id=10 in the http. 
c.	Switch to second tomcat instance, find employee with id=10. http://localhost:7080/cache/view.jsp?_id=10. So an employee 10 from DB would be fetched and stored in hibernate L2 cache.
d.	So, if you query again this employee in http://localhost:6080/cache/view.jsp?_id=10  or http://localhost:7080/cache/view.jsp?_id=10 then there would be no DB sqls executed as employee 10 is already in cache for some time.

Useful Tips
•	If you want to monitor SQL queries being executed in mysql, by default they are turned off.
•	So, once you start mysqld, then connect to mysql client in a different window.Inside mysql client execute following sql commands
o	SHOW CREATE TABLE mysql.general_log;
o	SHOW CREATE TABLE mysql.slow_log;
o	SET global general_log = 1;
o	SET global log_output = 'table';
o	select * from mysql.general_log where event_time > '2016-05-24 14:40:00';
