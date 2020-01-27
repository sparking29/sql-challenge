--List employee details: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, cast(s.salary as money)
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--List employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR from hire_date) = 1986;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM dept_manager m
JOIN departments d
ON (m.dept_no = d.dept_no)
JOIN employees e
ON (m.emp_no = e.emp_no);

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp x
ON (e.emp_no = x.emp_no)
JOIN departments d
ON (x.dept_no = d.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp x
ON (e.emp_no = x.emp_no)
JOIN departments d
ON (x.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp x
ON (e.emp_no = x.emp_no)
JOIN departments d
ON (x.dept_no = d.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name) as "emp_freq", last_name
FROM employees
GROUP BY last_name
ORDER BY "emp_freq" DESC;


