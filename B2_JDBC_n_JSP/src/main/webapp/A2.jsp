

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        1)
        <br>
        <% int i;
         for( i = 1; i <= 5; i ++)
         {
         
               out.println("Welcome");
               
         }     %>
         
         <hr>
<%------------------------------------------------------------------%>

        2)
            <br>
        <% int j;
         for( j = 1; j <= 5; j ++) %>
         {
         
               out.println("Welcome");
               
         }  <%   %>
         
         <hr>
<%------------------------------------------------------------------%>

       3)
        <br>
        <% int k;
         for( k = 1; k <= 5; k ++)
         { %>
         
               out.println("Welcome");
               
        <% }     %>
         
         <hr> 
<%------------------------------------------------------------------%>  

        4)
        <br>
        <% int m;
         for( m = 1; m <= 5; m ++)
         { %>
         
         <h1>Welcome</h1>
               
        <% }     %>
         
         <hr>
<%------------------------------------------------------------------%>
			<%!
			int i = 0;
			%>


<%------------------------------------------------------------------%>

    </body>
</html>
