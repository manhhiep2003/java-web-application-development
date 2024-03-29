<%-- 
    Document   : viewCart
    Created on : Feb 26, 2024, 4:53:21 PM
    Author     : Hiep
--%>

<%@page import="java.util.Map"%>
<%@page import="hiepdm.cart.CartObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Book Store</h1>
        <%
            //1. Customer goes to his/her cart place
            if (session != null) {
                //2. Customer takes his/her cart
                CartObject cart = (CartObject) session.getAttribute("CART");
                if (cart != null) {
                    //3. Customer gets items
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
                        //4. All items is shown
        %>
        <form action="DispatchServlet"> 
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (String key : items.keySet()) {
                    %>
                    <tr>
                        <td><%= ++count%></td>
                        <td><%= key%></td>
                        <td><%= items.get(key)%></td>
                        <td><input type="checkbox" name="chkItem" value="<%= key%>"/></td>
                    </tr>
                    <%
                        }//traverse items/map
                    %>
                    <tr>
                        <td colspan="3">
                            <a href="product.html">Add More Books to Your Cart</a>
                        </td>
                        <td>
                            <input type="submit" value="Remove Selected Items" name="btAction" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
                        return;
                    }
                }//cart has existed
            }//session has existed
        %>
        <h2>
            <font color="red">
            No cart is existed!!!
            </font>
        </h2>
    </body>
</html>
