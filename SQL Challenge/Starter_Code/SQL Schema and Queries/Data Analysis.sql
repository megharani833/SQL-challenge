-- 1.List the employee number, last name, first name, sex, and salary of each employee.

Select employees.emp_no, employees.last_name,
       employees.first_name, employees.sex,
	   salaries.salary
From employees
Inner Join salaries
On employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

Select employees.first_name, employees.last_name,
       employees.hire_date
From employees
Where hire_date between '01-01-1986' AND '31-12-1986'
Order By hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

Select departments.dept_no, departments.dept_name,
       dept_manager.emp_no,employees.first_name,
	   employees.last_name
From departments 
Join dept_manager
ON departments.dept_no = dept_manager.dept_no
Join employees
On employees.emp_no = dept_manager.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select departments.dept_no, dept_emp.emp_no,
       employees.last_name,employees.first_name,
	   departments.dept_name
From departments 
Join dept_emp
ON departments.dept_no = dept_emp.dept_no
Join employees
On employees.emp_no = dept_emp.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

Select employees.first_name,employees.last_name,
       employees.sex
From employees
Where first_name = 'Hercules' AND last_name Like 'B%'

--6. List each employee in the Sales department, including their employee number, last name, and first name.

Select departments.dept_name,dept_emp.emp_no,
       employees.last_name,employees.first_name
From departments
Join dept_emp
On departments.dept_no = dept_emp.dept_no
Join employees
On dept_emp.emp_no = employees.emp_no;

--7.  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, 
       employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

