<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>

	<body>
      
    <h2>Registrazione</h2>
    <form action="Registrazione" >
        <input type="hidden" name="action" value="insert"> 

		<label for="Username">Username:</label><br> 
        <input name="Username" type="text"   placeholder="Inserisci l'Username"><br> 

        <label for="Password">Password:</label><br>
        <input name="Password" type="password" required placeholder="Inserisci la password"><br>
			
        <label for="Nome">Nome:</label><br> 
        <input name="Nome" type="text"  required placeholder="Inserisci il Nome"><br> 

        <label for="Cognome">Cognome:</label><br>
        <input name="Cognome" type="text" required placeholder="Inserisci il Cognome"><br>

        <label for="Email">Email:</label><br> 
        <input name="Email" type="text" required placeholder="Inserisci l' Email"><br>

        <label for="CF">Codice Fiscale:</label><br> 
        <input name="CF" type="text" required placeholder="Inserisci il Codice Fiscale"><br>

        <input type="submit" value="Add"><input type="reset" value="Reset">
    </form>
    </body>
</html>