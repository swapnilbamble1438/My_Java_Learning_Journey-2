
<%

String admin = null;
Cookie[] acookie = request.getCookies();
for(int i = 0; i < acookie.length; i++) 
{
	if (acookie[i].getName().equals("admin")) 
	{
    acookie[i].setMaxAge(9999);
    response.addCookie(acookie[i]);
	admin = acookie[i].getValue().toString();
	} 
	
	
}
if(admin == null)
{
	Cookie aloginfail = new Cookie("aloginfail","aloginfail");
	aloginfail.setMaxAge(10);
	response.addCookie(aloginfail);
	response.sendRedirect("adminlogin.jsp");
}




%>
