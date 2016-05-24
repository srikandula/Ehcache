<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.techm.cadt.cache.Employee"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.techm.cadt.cache.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<html>
<body>
<h2>View Employee</h2>


<%
     try{
    	 
    	 Long id = 1L;
    	 
    	 String specificId = request.getParameter("_id"); 
    	 if(specificId != null && specificId.length() >0){
    		 id = Long.parseLong(specificId);
    	 }
    	 System.out.println("Reached here.... for " + id);
    			 
    	 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    	 Session hibernateSession = sessionFactory.openSession();
    	 
   	 
    	 Employee emp = (Employee)hibernateSession.load(Employee.class,id);
    	 out.println("1...... " + emp + "<BR>");
    	 
    	 emp = (Employee)hibernateSession.load(Employee.class,id);
         out.println("2...... " + emp + "<BR>");
         
         hibernateSession.evict(emp);

         emp = (Employee)hibernateSession.load(Employee.class,id);
         out.println("3...... " + emp + "<BR>");

         emp = (Employee)hibernateSession.load(Employee.class,id);
         out.println("4...... " + emp + "<BR>");
    	 
    	 //hibernateSession.close();  
    	 
     }catch(Exception ex){
    	 ex.printStackTrace();
     }

%>
<a href="insert.jsp">insert</a>
</body>
</html>
