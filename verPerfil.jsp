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
    <%@ page import="modelo.datos.UsuarioVO" %>
    <%@ page import="modelo.WebFacade" %>
    <%@ page import="java.util.List" %>

 </head>

  <body>

    <% UsuarioVO usuario = request.getAttribute("user"); %>

    <nav class="navbar navbar-light navbar-expand-md">
      <div class="container-fluid"><a class="navbar-brand" href="#">Nombre de la Red Social</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="nav navbar-nav">
            <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Usuario</a></li>
            <li class="nav-item" role="presentation"><a class="nav-link" href="#">Juegos</a></li>
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
        <img src="<% usuario.getImagen(); %>" alt="Imagen del usuario" class="img-thumbnail">
        <h3>Seudonimo: <span class="badge badge-primary"><% out.write(usuario.getSeudonimo()); %></span></h3>
        <h3>Email: <span class="badge badge-primary"><% out.write(usuario.getNombre()); %></span></h3>
        <h3>Nombre: <span class="badge badge-primary"><% out.write(usuario.getEmail()); %></span></h3>

        <h3 style="margin-top:25px">Nivel: <span class="badge badge-primary"><% out.write(usuario.getNivel()); %></span></h3>
        <div class="progress" style="height:20px; width:600px; margin-right:auto; margin-left:auto">
            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">25%</div>
        </div>

    </div>
    

    </script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>