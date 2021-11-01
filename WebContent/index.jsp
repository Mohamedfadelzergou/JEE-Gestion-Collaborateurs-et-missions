<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Gestion Projet - Login</title>

  <!-- Custom fonts for this template-->
  <link href="template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="template/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"><img alt="" src="template/img/login.jpg" width="430px" height="540px"></div>
              <div class="col-lg-6">
                <div class="plogin">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Bienvenu !</h1>
                  </div>
                  <form method="post" action="">
                    <div class="form-group">
                      <input type="email" name="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Entrer l'adresse e-mail..." required="required">
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Mot de passe"required>
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Rappelles</label>
                      </div>
                    </div>
                    <button type="submit" name="submit" id="submit" class="btn btn-primary btn-user btn-block">
                      se connecter
                    </button> 
                  </form>
                  <hr>
                  <% 
				    if( request.getParameter("submit") != null && request.getParameter("email") != "" && request.getParameter("password") != "")
				
				    {
				        String email = request.getParameter("email");
				        String password = request.getParameter("password");
				        boolean status = false;
				        Connection con;
				        PreparedStatement preparedStatement;
				        int a;
				        Class.forName("com.mysql.jdbc.Driver");
				        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
				        preparedStatement = con.prepareStatement("select * from admin where email = ? and password = ? ");
				        preparedStatement.setString(1, email);
				        preparedStatement.setString(2, password);
				        System.out.println(preparedStatement);
				        ResultSet rs = preparedStatement.executeQuery();
			            status = rs.next();
				        if (status) {
				        	response.sendRedirect("Accueil.jsp");
				        } else {
				           
				        
				        %>
				        <div class="alert alert-danger" role="alert">
                            Adresse Email ou Password n&#039est pas corrécte !!
                         </div>
				    <%
				        }
				    }
				   %>
                  
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="template/vendor/jquery/jquery.min.js"></script>
  <script src="template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="template/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="template/js/sb-admin-2.min.js"></script>

</body>

</html>
