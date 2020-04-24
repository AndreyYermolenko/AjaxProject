<%@ page import="com.yermolenko.entities.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ajax Example</title>
  </head>
  <body>
    <%
            List<Student> studentList = (List<Student>) session.getAttribute("list");
            if (studentList.isEmpty()) {        %>
                <p>No record found</p>
    <%      } else {            %>
                <table border="1" cellpadding="2" width="100%">
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>SCHOLARSHIP</th>
                    </tr>
                    <% for (Student student: studentList) { %>
                    <tr>
                        <th><%= student.getId()%></th>
                        <th><%= student.getName()%></th>
                        <th><%= student.getScholarship()%></th>
                    </tr>
                    <% } %>
                </table>
    <%
      }
    %>
  </body>
</html>
