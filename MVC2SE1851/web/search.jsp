<%-- 
    Document   : search
    Created on : Jan 29, 2024, 4:54:42 PM
    Author     : Hiep
--%>

<%@page import="hiepdm.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <%
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                Cookie lastCookie = cookie[cookie.length - 1];
                String username = lastCookie.getName();
        %>
        <font color="red"> Welcome, <%= username%> </font> 
        <%
            }
        %>
        <a href="DispatchServlet?btAction=Logout">Logout</a>
        <h1>Search Page</h1>
        <form action="DispatchServlet">
            Search value <input type="text" name="txtSearchValue" 
                                value="<%= request.getParameter("txtSearchValue")%>" /><br/>
            <input type="submit" value="Search" name="btAction" />
        </form>
        <br/>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");
                if (result != null) {
                    if (result.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Last Name</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (RegistrationDTO user : result) {
                        String urlRewriting = "DispatchServlet"
                                + "?btAction=Delete"
                                + "&pk=" + user.getUsername()
                                + "&lastSearchValue=" + searchValue;
                %>     
            <form action="DispatchServlet" method="POST">

                <tr>
                    <td><%= count++%></td>
                    <td><%= user.getUsername()%>
                        <input type="hidden" name="txtUsername" value="<%= user.getUsername()%>">
                    </td>
                    <td><%= user.getFullname()%></td>
                    <td>
                        <input type="text" name="txtPassword" value="<%= user.getPassword()%>">
                    </td>
                    <td>
                        <input type="checkbox" name="chkAdmin" value="ON" 
                               <%
                                   if (user.isRole()) {
                               %>
                               checked="checked"
                               <%
                                   }//role is an admin
                               %>
                               />
                    </td>
                    <td><a href="<%= urlRewriting%>">Delete</a></td>
                    <td>
                        <input type="submit" value="Update" name="btAction">
                        <input type="hidden" name="lastSearchValue" value="<%= searchValue%> ">
                    </td>
                </tr>
            </form>    
            <%
                }
            %>

        </tbody>
    </table>

    <%
        }
    } else {
    %>
    <h2>
        <font color="red">
        No record is matched
        </font>
    </h2>
    <%
            }//end result is null
        }//second time 
%>
</body>
</html>
