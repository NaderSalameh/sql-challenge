/*********************************************************
	creation of tables for employee database 
**********************************************************/

--. creation of title table 
DROP TABLE IF EXISTS Title;
	CREATE TABLE Title 
	(--.-Name----------------.Type-------------.NOT NULL/NULL-----------
		  title_id			  CHAR(5)           NOT NULL     PRIMARY KEY 
	   	, title               VARCHAR(25)       NOT NULL  	
	);


--. creation of department table 
DROP TABLE IF EXISTS Department;
	CREATE TABLE Department 
	(--.--Name----------------.Type-------------.NOT NULL/NULL-----------
		  dept_no			   CHAR(4)           NOT NULL     PRIMARY KEY 
	   	, dept_name            VARCHAR(25)       NOT NULL  	
	);


--. creation of employee table 
DROP TABLE IF EXISTS Employee;
	CREATE TABLE Employee 
	(--.--Name----------------.Type-------------.NOT NULL/NULL-----------
		  emp_no			   INTEGER           NOT NULL  	  PRIMARY KEY 
	   	, emp_title_id         CHAR(5)           NOT NULL,    FOREIGN KEY (emp_title_id) REFERENCES	Title (title_id)
	   	, birth_date           DATE              NOT NULL 
		, first_name           VARCHAR(25)       NOT NULL 
		, last_name            VARCHAR(75)       NOT NULL 
		, sex                  CHAR(1)           NOT NULL 
		, hire_date            DATE              NOT NULL 
	);


--. creation of salary table 
DROP TABLE IF EXISTS Salary;
	CREATE TABLE Salary 
	(--.--Name----------------.Type-------------.NOT NULL/NULL-----------
		  emp_no			   INTEGER           NOT NULL,    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no)
	   	, salary               VARCHAR(25)       NOT NULL  
		
		, PRIMARY KEY(emp_no)	
	);


--. creation of Department Employee table 
DROP TABLE IF EXISTS Dept_Emp;
	CREATE TABLE Dept_Emp 
	(--.--Name----------------.Type-------------.NOT NULL/NULL-----------
		  emp_no               INTEGER           NOT NULL,    FOREIGN KEY (emp_no)  REFERENCES Employee (emp_no) 
		, dept_no		       CHAR(4)           NOT NULL,    FOREIGN KEY (dept_no) REFERENCES Department (dept_no)
		
		, PRIMARY KEY(emp_no, dept_no) 
	);


--. creation of Department Manager table 
DROP TABLE IF EXISTS Dept_Manager;
	CREATE TABLE Dept_Manager 
	(--.--Name----------------.Type-------------.NOT NULL/NULL-----------
		  dept_no              CHAR(4)           NOT NULL,    FOREIGN KEY (dept_no) REFERENCES Department (dept_no)    
	   	, emp_no               INTEGER           NOT NULL,    FOREIGN KEY (emp_no)  REFERENCES Employee (emp_no)
		
		, PRIMARY KEY(dept_no, emp_no) 
	);
 








