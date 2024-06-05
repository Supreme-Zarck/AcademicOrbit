<%@ page language="java"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="DAO.MaConnexion"%>
<%@ page import="DAO.AdminDAO" %>
<%@ page import="business.Statistics" %>
<%@ page import="business.Classe" %>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	String username = ""; 
	 if(session.getAttribute("username")!=null){
		 username = session.getAttribute("username").toString();
	 }else{
		 response.sendRedirect("../Login.jsp");
	 }
	 
	 MaConnexion conn = new MaConnexion();
	 AdminDAO dao = new AdminDAO(conn);
	 List<Classe> availableClasses = dao.getAvailableClasses();

%>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Etudiant</title>
      <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap');

            body {
                font-family: 'Roboto', sans-serif;
                background: linear-gradient(135deg, #f8f9fa, #e0e0e0);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 190vh;
                margin: 0;
                color: #2c3e50;
            }
            h1 {
                text-align: center;
                color: #34495e;
                font-size: 2.5rem;
                margin-bottom: 30px;
                font-weight: 700;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .form-container {
                width: 100%;
                max-width: 600px;
                background: #ffffff;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                animation: fadeInUp 0.7s ease-in-out;
            }
            label {
                display: block;
                margin: 15px 0 5px;
                font-weight: 500;
                color: #34495e;
            }
            input[type="text"], input[type="password"], input[type="number"] {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #bdc3c7;
                border-radius: 5px;
                background: #ecf0f1;
                color: #2c3e50;
                font-size: 1rem;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }
            input[type="text"]:focus, input[type="password"]:focus, input[type="number"]:focus {
                border-color: #2980b9;
                box-shadow: 0 0 8px rgba(41, 128, 185, 0.3);
                outline: none;
            }
            .radio-group {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-bottom: 20px;
            }
            .radio-group label {
                margin-right: 20px;
                font-weight: 400;
                color: #34495e;
            }
            button {
                display: block;
                width: 100%;
                padding: 14px;
                background: linear-gradient(135deg, #2c3e50, #273746);
                color: #fff;
                border: none;
                border-radius: 5px;
                font-size: 1.2rem;
                cursor: pointer;
                transition: background 0.3s ease-in-out, transform 0.2s;
            }
            button:hover {
                background: linear-gradient(135deg, #273746, #212f3c);
                transform: translateY(-2px);
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
</head>
<body>
    <div class="form-container">
        <h1>Ajouter un Etudiant</h1>
        <form action="${pageContext.request.contextPath}/AjouterEtudiant" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required>

            <label for="prenom">Prenom :</label>
            <input type="text" id="prenom" name="prenom" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label>Sexe :</label>
            <div class="radio-group">
                <label for="female"><input type="radio" id="female" name="sex" value="Femme" checked> Femme</label>
                <label for="male"><input type="radio" id="male" name="sex" value="Homme"> Homme</label>
            </div>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>

            <label for="cneEtudiant">CNE Etudiant:</label>
            <input type="text" id="cneEtudiant" name="cneEtudiant" required>
			<select id="classes" name="classes" required>
			<option value=""> Choisir la classe </option>
        		<% for (Classe classe : availableClasses) { %>
            	<option value="<%= classe.getId() %>"><%= classe.getName() %></option>
       		 	<% } %>
    		</select>
            <button type="submit">Add</button>
        </form>
    </div>

    <jsp:include page="adminnavbar.jsp" />
</body>
</html>