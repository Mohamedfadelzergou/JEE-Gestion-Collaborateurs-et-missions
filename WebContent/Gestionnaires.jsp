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

  <title>Gestion Projet | Gestionnaires</title>

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
        int code = Integer.parseInt(request.getParameter("code"));
        int nombreProjGere = Integer.parseInt(request.getParameter("nombreProjGere"));
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession?useSSL=false","root","");
        pst = con.prepareStatement("insert into gestionnaireprojet(code,nombreProjGere)values(?,?)");
        pst.setInt(1, code);
        pst.setInt(2, nombreProjGere);
        pst.executeUpdate();  
        
        %>
        <div class="alert alert-success" role="alert">
  						Le gestionnaire de projet est ajouté!!
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
	pst = con.prepareStatement("delete from gestionnaireprojet where code = ?");
	 pst.setInt(1, id);
	pst.executeUpdate(); 

	%>
	<div class="alert alert-danger" role="alert">
  						Le gestionnaire de projet est supprimé!!
						</div>
	<%
	
}
   %>
<%
 if(request.getParameter("test")!=null && request.getParameter("test")!=""){
   %><div class="alert alert-warning" role="alert">
  						Le géstionnaire est Modifié !!
	</div>
	<%
	
}
   %>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Gestionnaires des projets</h1>
            <button type="button" class="btn btn-primary btn-rounded waves-effect waves-light mb-2 mr-2" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="mdi mdi-plus mr-1"></i>Ajouter Gestionnaire</button>
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Ajouter Gestionnaire</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="#" method="post">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="validation1">Collaborateur</label>
                                                                <select type="text" class="form-control" id="validation1" name="code" required>
                                                                <%   Connection con;
												                       PreparedStatement pst;
												                       ResultSet rs;
												        
												                       Class.forName("com.mysql.jdbc.Driver");
												                       con = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession","root","");
												                                
												                       String query = "select * from collaborateur where code not in (select code from gestionnaireprojet)";
												                       Statement st = con.createStatement();
												                                  
												                       rs =  st.executeQuery(query);
												                                    
												                      while(rs.next())
												                       {
												                      %>
                                                                <option value="<%=rs.getInt("code")%>"><%=rs.getString("prenom") %> <%=rs.getString("nom") %></option>
                                                                <%
                                 
											                         }
											                      %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="validation2">Nombre des projets Gére</label>
                                                                <input type="number" min="1" class="form-control" id="validation2" name="nombreProjGere" placeholder="Nombre des projets Gére"required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                                        <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Ajouter">
                                                	</div>
                                                </form>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
          </div>
		 <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Géstionnaire</th>
                      <th>Nombre des projets</th>
                      <th colspan="2">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <%   Connection cone;
                       PreparedStatement pste;
                       ResultSet rse;
        
                       Class.forName("com.mysql.jdbc.Driver");
                       cone = DriverManager.getConnection("jdbc:mysql://localhost/gestion_mession","root","");
                                
                       String quer = "select * from gestionnaireprojet inner join collaborateur where gestionnaireprojet.code = collaborateur.code";
                       Statement ste = cone.createStatement();
                                  
                       rse =  ste.executeQuery(quer);
                                    
                      while(rse.next())
                       {
                      %>
                    <tr>
                      <td><%=rse.getString("prenom") %> <%=rse.getString("nom") %></td>
                      <td><%=rse.getInt("nombreProjGere") %></td>
                      <td>
                      <a class="btn btn-warning btn-rounded" href="ModifierGestionnaire.jsp?id=<%=rse.getInt("code")%>">Modifier</a>
						<button type="button" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#A<%=rse.getInt("code")%>">Supprimer</button>
                          <form action="" method="post">
                                                       
                               <div class="modal fade" id="A<%=rse.getInt("code")%>" tabindex="-1" role="dialog" aria-labelledby="Label" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                 <div class="modal-header bg-danger">
                                   <h5 class="modal-title" id="Label">Supprimer Gestionnaire</h5>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                       Voulez-vous vraiment supprimer ?
                                       <input type="hidden" name="id" value="<%=rse.getInt("code")%>">
                                       </div>
                                       <div class="modal-footer">
                                         <button type="reset" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                         <button type="submit" name="supprimer" class="btn btn-danger">Supprimer</button>
                                        </div>
                                         </div>
                                          </div>
                                          </div>
                                  </form>
                          </td>
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
