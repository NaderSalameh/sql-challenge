--.details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	  employee.emp_no  		AS Employee_Number
	, employee.last_name 	AS Employee_Last_Name
	, employee.first_name   AS Employee_First_Name 
	, employee.sex          AS Employee_Sex
	, salary.salary         AS Employee_Salary
FROM 
	public.employee AS employee
		INNER JOIN public.salary AS salary ON salary.emp_no = employee.emp_no;
			


--.Listing first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	  emp.first_name 	AS Employee_First_Name 
	, emp.last_name 	AS Employee_Last_Name
	, emp.hire_date		AS Date_Hired
FROM  
	public.employee AS emp
WHERE
	--. using this method rather that the "DATE_PART" function in order to preserve the utilization of an index,
	--. in the case that there is one put in place on the "date_hired".
	emp.hire_date >= '1986-01-01'
		AND emp.hire_date <= '1986-12-31';
		


--.Listing the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	  dept.dept_no		AS Department_Number
	, dept.dept_name	AS Department_Name
	, emp.emp_no     	AS Manager_Employee_Number
	, emp.last_name  	AS Manager_Last_Name 
	, emp.first_name 	AS Manager_First_Name 
FROM 
	public.employee AS emp 
	
		INNER JOIN public.title AS title ON title.title_id = emp.emp_title_id AND title.title = 'Manager'
		INNER JOIN public.dept_manager AS dept_mngr ON dept_mngr.emp_no = emp.emp_no
		INNER JOIN public.department AS dept ON dept.dept_no = dept_mngr.dept_no;
			
			

--.Listing the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	  emp.emp_no	 AS Employee_Number
	, emp.last_name  AS Employee_Last_Name 
	, emp.first_name AS Employee_First_Name 
	, dept.dept_name AS Department_Name 
FROM 
	public.employee AS emp
	
		INNER JOIN public.dept_emp AS d_emp ON d_emp.emp_no = emp.emp_no
		INNER JOIN public.department AS dept ON dept.dept_no = d_emp.dept_no;
			


--.Listing first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	  emp.first_name AS Employee_First_Name  
	, emp.last_name  AS Employee_Last_Name 
	, emp.sex        AS Employee_Sex
FROM 
	public.employee AS emp 
WHERE 
	emp.first_name = 'Hercules'
		AND emp.last_name LIKE 'B%';



--.Listing all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
      emp.emp_no	 AS Employee_Number 
	, emp.last_name  AS Employee_Last_Name 
	, emp.first_name AS Employee_First_Name 
	, dept.dept_name AS Department_Name 
FROM 
	public.employee AS emp 
	
		INNER JOIN public.dept_emp AS d_emp ON d_emp.emp_no = emp.emp_no
		INNER JOIN public.department AS dept ON dept.dept_no = d_emp.dept_no
WHERE 
	dept.dept_name = 'Sales';



--Listing all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
      emp.emp_no	 AS Employee_Number 
	, emp.last_name  AS Employee_Last_Name 
	, emp.first_name AS Employee_First_Name 
	, dept.dept_name AS Department_Name 
FROM 
	public.employee AS emp 
	
		INNER JOIN public.dept_emp AS d_emp ON d_emp.emp_no = emp.emp_no
		INNER JOIN public.department AS dept ON dept.dept_no = d_emp.dept_no
WHERE 
	dept.dept_name IN ('Sales', 'Development');
	
	
	
-- In descending order, listing the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	  emp.last_name
	, COUNT(emp.emp_no) AS count
FROM public.employee AS emp
GROUP BY last_name 
HAVING COUNT(emp_no) > 1
ORDER BY count DESC;


	


	

















		

	


