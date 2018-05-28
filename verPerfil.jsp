<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Perfil</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="fonts/simple-line-icons.min.css">
  <link rel="stylesheet" href="css/styles.css">

  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="modelo.datos.VO.*" %>
  <%@ page import="modelo.datos.*" %>
  <%@ page import="java.util.List" %>

</head>

<body>
<%
  String email = null;
  String password = null;
  try {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().equals("email")) {
          email = cookies[i].getValue();
        }
        if (cookies[i].getName().equals("password")) {
          password = cookies[i].getValue();
        }
      }
    } else {
      pageContext.forward("Login.jsp");
    }
  } catch (Exception e) {
    e.printStackTrace(System.err);
    pageContext.forward("Login.jsp");
  }
  WebFacade fachada = new WebFacade();
  UsuarioVO usuario = fachada.buscarUsuario(email, password);
  if (usuario == null){
    pageContext.forward("Login.jsp");
  }
%>

<nav class="navbar navbar-light navbar-expand-md">
  <div class="container-fluid"><a class="navbar-brand" href="#">Nombre de la Red Social</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navcol-1">
      <ul class="nav navbar-nav">
        <li class="nav-item" role="presentation"><a class="nav-link" href="verFeedServlet.do">Usuario</a></li>
        <li class="nav-item" role="presentation"><a class="nav-link" href="ListaJuegosServlet.do">Juegos</a></li>
        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Logros</a></li>
      </ul>
      <ul class="nav navbar-nav ml-auto">
        <li class="dropdown"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Ajustes</a>
          <div class="dropdown-menu dropdown-menu-right" role="menu"><a class="dropdown-item" role="presentation" href="#">&nbsp;Ver perfil</a><a class="dropdown-item" role="presentation" href="#">Cerrar sesión</a></div>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container; text-center" style="margin-top:50px">
  <!--<img src="<% %>" alt="Imagen del usuario" class="img-thumbnail">-->

  <h3>Seudonimo: <span class="badge badge-primary"><% out.write(usuario.getSeudonimo()); %></span></h3>
  <h3>Email: <span class="badge badge-primary"><% out.write(email); %></span></h3>
  <h3>Nombre: <span class="badge badge-primary"><% out.write(usuario.getNombre()); %></span></h3>

  <h3 style="margin-top:25px">Nivel: <span class="badge badge-primary"><% out.write(Integer.toString(usuario.getNivel())); %></span></h3>
  <div class="progress" style="height:20px; width:600px; margin-right:auto; margin-left:auto">
    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width:
      <% out.write(Integer.toString(usuario.getPorcentajeNivel())); %>%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><% out.write(Integer.toString(usuario.getPorcentajeNivel())); %>%</div>
  </div>
  <li><a href="CerrarSesionServlet.do"><button type="button" class="btn btn-outline-danger">Cerrar Sesión</button></a></li>
</div>


</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>