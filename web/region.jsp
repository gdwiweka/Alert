<%-- 
    Document   : data
    Created on : Jun 21, 2019, 10:58:53 AM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="models.Region"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        List<Region> regions = (List<Region>) session.getAttribute("regions");
        Region region = (Region) session.getAttribute("region");
        boolean isRegionsNull = regions == null;
        if (isRegionsNull) {
            response.sendRedirect("region");
        }
    %>
    <body>
        <!--name itu name servlet-->
        <form action="region" method="POST">
            <table border="1">

                <h1>Insert Region</h1>
                <tr>
                    <td>ID </td>
                    <td><input type="text" name="regionId" value="<%=(region != null) ? region.getId() : ""%>" /></td>
                </tr>
                <tr>
                    <td>NAME </td>
                    <td><input type="text" name="regionName" value="<%=(region != null) ? region.getName() : ""%>" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Save" /></td>
                </tr>
            </table>
        </form>

        <h2>List Region</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID </th>
                    <th>Name </th>
                    <th>Action </th>
                </tr>
            </thead>

            <tbody>
                <% if (!isRegionsNull) {
                        for (Region region1 : regions) {
                %>  
                <tr>
                    <td><%=region1.getId()%></td>
                    <td><% out.println(region1.getName());%></td>
                    <td>
                        <a href="region?action=update&id=<%=region1.getId()%>">update</a>
                        <a href="region?action=delete&id=<%=region1.getId()%>">delete</a>
                    </td>
                </tr>
                <% }
                    }%>
            </tbody>

        </table>

    </body>
    <%
        session.removeAttribute("regions");
        session.removeAttribute("region");
    %>

</html>
