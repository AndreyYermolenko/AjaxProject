<%@ page import="com.yermolenko.entities.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 23.03.2020
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ajax Example</title>
  </head>
  <body>
    <%
      List<Student> bd = new ArrayList<>();
      bd.add(new Student(1, "Kate", 1000));
      bd.add(new Student(2, "Dima", 2000));
      bd.add(new Student(3, "Vasya", 3000));

      String name = request.getParameter("val");
      if (name == null || name.trim().equals("")) { %>
        <p>Please, enter your name</p>
     <% } else {
            boolean flag = false;
            Student currentStudent = null;

            for (Student student: bd) {
              if (student.getName().equals(name)) {
                currentStudent = student;
                flag = true;
              }
            }

            if (!flag) {        %>
                <p>No record found</p>
    <%      } else {            %>
                <table border="1" cellpadding="2" width="100%">
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>SCHOLARSHIP</th>
                    </tr>
                    <tr>
                        <th><%= currentStudent.getId()%></th>
                        <th><%= currentStudent.getName()%></th>
                        <th><%= currentStudent.getScholarship()%></th>
                    </tr>
                </table>
    <%      }
      }
    %>
  </body>
</html>
