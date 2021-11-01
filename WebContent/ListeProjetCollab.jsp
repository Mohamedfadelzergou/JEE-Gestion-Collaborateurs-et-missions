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

  <title>Gestion Projet | Liste des projets par collaborateur.</title>

  <!-- Custom fonts for this template-->
  <link href="template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="template/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="template/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
     <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-fw fa-chart-area"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Gestion</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="Accueil.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="Collaborateurs.jsp">
          <i class="fas fa-fw fas fa-users"></i>
          <span>Collaborateurs</span></a>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="Gestionnaires.jsp">
          <i class="fas fa-fw fas fa-users"></i>
          <span>Gestionnaires</span></a>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="Chefs.jsp">
          <i class="fas fa-fw fas fa-user-tie"></i>
          <span>Chefs</span></a>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="Missions.jsp">
          <i class="fas fa-clipboard-list fa-2x "></i>
          <span>Missions</span></a>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="Projets.jsp">
          <i class="fas fa-briefcase"></i>
          <span>Projets</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Med Fadel Zergou</span>
                <img class="img-profile rounded-circle" src="template/img/admin.jpg">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Se déconnecter
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
<% 
    if( request.getParameter("submit") != null && !"".equals(request.getParameter("submit").trim()) )

    {
        String nom = request.getParameter("nom");
        String profil = request.getParameter("profil");
        String prenom = request.getParameter("prenom");
        int tel = Integer.parseInt(request.getParameter("tel"));
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
        pst = con.prepareStatement("insert into collaborateur(nom,profil,tel,prenom)values(?,?,?,?)");
        pst.setString(1, nom);
        pst.setString(2, profil);
        pst.setInt(3, tel);
        pst.setString(4, prenom);
        pst.executeUpdate();  
        
        %>
        <div class="alert alert-success" role="alert">
  						Le collaborateur est ajouté!!
						</div>
    <%
    }
if( request.getParameter("supprimer") != null && request.getParameter("id") != null )

{
	int id = Integer.parseInt(request.getParameter("id"));
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
	pst = con.prepareStatement("delete from collaborateur where code = ?");
	pst.setInt(1, id);
	pst.executeUpdate(); 

	%>
	<div class="alert alert-danger" role="alert">
  						Le collaborateur est supprimé!!
	</div>
	<%
}
%>
<%
 if(request.getParameter("test")!=null){
   %><div class="alert alert-warning" role="alert">
  						Le collaborateur est Modifié !!
	</div>
	<%
	
}
   %>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <a href="Collaborateurs.jsp" class="btn btn-primary btn-rounded">Retour</a>
            <h1 class="h3 mb-0 text-gray-800">Liste des projets par collaborateur</h1>
          </div>
		 <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">
              <%   Connection con;
                       PreparedStatement pst;
                       ResultSet rs;
                       int id = Integer.parseInt(request.getParameter("id"));
                       Class.forName("com.mysql.jdbc.Driver");
                       con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
                       pst = con.prepareStatement("select sum(vht) as total from projet inner join projetcollab on projet.idprojet=projetcollab.idProjet where projetcollab.codeCollab=?");
                       pst.setInt(1, id);
                       rs = pst.executeQuery();
                                    
                      while(rs.next())
                       {
                      %>
                      <center>Total Hours = <spon><%=rs.getString("total") %> Hours.</spon></center>
                     <%
                                 
                         }
                      %>
              </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Projet</th>
                      <th>volume horaire</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <%   
                       Class.forName("com.mysql.jdbc.Driver");
                       con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
                       pst = con.prepareStatement("select * from projet inner join projetcollab on projet.idprojet=projetcollab.idProjet where projetcollab.codeCollab=?");
                       pst.setInt(1, id);
                       rs = pst.executeQuery();
                                    
                      while(rs.next())
                       {
                      %>
                    <tr>
                      <td><%=rs.getString("intitule") %></td>
                      <td><%=rs.getString("vht") %> Heurs</td>
                    </tr>
                     <%
                                 
                         }
                      %>
                  </tbody>
                </table>
                
              </div>
            </div>
          </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Med Fadel Zergou 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

   <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Prêt à partir?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Sélectionnez "Déconnexion" ci-dessous si vous êtes prêt à terminer votre session en cours.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Annuler</button>
          <a class="btn btn-primary" href="index.jsp">Déconnexion</a>
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

  <!-- Page level plugins -->
  <script src="template/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="template/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="template/js/demo/datatables-demo.js"></script>

</body>

</html>
