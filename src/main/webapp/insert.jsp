<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.techm.cadt.cache.Employee"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.techm.cadt.cache.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<html>
<body>
<h2>Insert Employee</h2>

<!-- http://www.journaldev.com/2980/hibernate-ehcache-second-level-caching-example-tutorial -->

<%
     try{
    	 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    	 Session hibernateSession = sessionFactory.openSession();
    	 Transaction transaction = hibernateSession.beginTransaction(); 
    	 
    	 Employee newEmp  = new Employee();    	 
    	 newEmp.setName("" + System.currentTimeMillis());
    	 newEmp.setSalary(5000);
    	 hibernateSession.save(newEmp);
    	 
    	 
         List<Employee> empList = (List<Employee>)hibernateSession.createCriteria(Employee.class).list();
         for(Employee emp : empList){
             out.println(emp.toString());
             out.println("<BR><BR>...inital");
         } 
         
         
    	  //Release resources
         transaction.commit();
         //hibernateSession.close();
    	 
     }catch(Exception ex){
    	 
     }

%>
<a href="view.jsp">view</a>
</body>
</html>
