<%--
  Created by IntelliJ IDEA.
  User: aleja
  Date: 19/03/2018
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="css/styles.css">

    <%@ page import="java.util.List" %>
    <%@ page import="java.time.LocalDate" %>
    <%@ page import="java.time.format.TextStyle" %>
    <%@ page import="java.util.Locale" %>
</head>
<%@ page import="modelo.datos.VO.PublicacionVO" %>
<%@ page import="modelo.datos.VO.UsuarioVO" %>
<%@ page import="modelo.datos.WebFacade" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
      List<PublicacionVO> publicaciones = fachada.getPublicaciones();
      %>
<nav class="navbar navbar-light navbar-expand-md">
    <div class="container-fluid"><a class="navbar-brand" href="#">Nombre de la Red Social</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse"
             id="navcol-1">
            <ul class="nav navbar-nav">
                <li class="nav-item" role="presentation"><a class="nav-link" href="VerPerfilServlet.do">Usuario</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="ListaJuegosServlet.do">Juegos</a></li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Logros</a></li>
            </ul>
            <ul class="nav navbar-nav ml-auto">
                <li class="dropdown"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">Ajustes</a>
                    <div class="dropdown-menu dropdown-menu-right" role="menu"><a class="dropdown-item" role="presentation" href="#">&nbsp;Ver perfil</a><a class="dropdown-item" role="presentation" href="#">Cerrar sesión</a></div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="InfoUsuario" style="width:initial;/*height:100px;*/margin:4px;/*border:1px solid black;*/float:left;margin-top:10%;position:absolute;">
    <div class="row" style="width:inherit;">
        <div class="col" style="align-items:center;align-content:center;/*border:initial;*/border:1px solid blue;width:50%;border-radius:12px;"><img style="/*max-width:100%;*/display:block;margin:auto;"></div>
    </div>
    <div class="row" style="border:1px solid blue;/*width:50%;*/border-radius:12px;">
        <div class="col" style="align-content:center;/*border:1px solid black;*/">
            <h1 style="text-align:center;/*border:1px solid black;*/"><% if (usuario == null){
              out.write("esta vacio");
            }
            else{
              out.write(usuario.getNombre());
            }%></h1>
        </div>
    </div>
    <div class="container" style="width:inherit;/*margin-left:auto;*/justify-content:space-around;">
        <div class="row">
            <div class="col-md-6" style="/*border:1px solid black;*/width:inherit;align-self:left;border:1px solid blue;/*width:50%;*/border-radius:12px;">
                <h4 style="/*border:1px solid black;*/">Seguidores : ?</h4>
            </div>
            <div class="col-md-6" style="border:1px solid black;/*width:50%;*/border:1px solid blue;/*width:50%;*/border-radius:12px;">
                <h3 style="/*border:1px solid black;*/">Siguiendo:${user.getSeguidos().size()}</h3>
            </div>
        </div>
    </div>
</div>
<div style="float:left;position:relative;top:315px;margin-left:4px;" class="row">
    <div class="col-md-4">
        <table class="table">
            <thead>
                <tr class="bg-primary">
                    <th scope="col">Juegos En Curso</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Mark</td>
                </tr>
                <tr>
                    <td>Jacob</td>
                </tr>
                <tr>
                    <td>Larry</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-4">
        <table class="table">
            <thead>
                <tr class="bg-success">
                    <th scope="col">Juegos Completados</th>
                </tr>
            </thead>
            <tbody>
                <tr >
                    <td>Mark</td>
                </tr>
                <tr>
                    <td>Jacob</td>
                </tr>
                <tr>
                    <td>Larry</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-4">
        <table class="table">
            <thead>
                <tr class="bg-warning">
                    <th scope="col">Juegos Pendientes</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Mark</td>
                </tr>
                <tr>
                    <td>Jacob</td>
                </tr>
                <tr>
                    <td>Larry</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<ul class="list-group" style="margin-top:10%;float:inherit;width:50%;margin-left:45%;">
    <li class="list-group-item">
        <div class="media"><img class="mr-3">
            <form id="enterText" action="anadirPublicacionServlet.do" method="post" class="form-horizontal" role="form">
                <h5>Añade un comentario nuevo!</h5>
                    <div class="form-group mb-2">
                        <label for="seudonimo" class="sr-only">seudonimo</label>
                        <input  id="seudonimo" type="text" readonly class="form-control-plaintext" value="<% out.write(usuario.getSeudonimo()); %>">
                    </div>

                    <div class="input-group" style ="width:200%">
                        <input id="texto" type="text" class="form-control" name="texto" value="" placeholder="Texto">                                        
                    </div>

                    <div class="input-group" style ="width:100%">
                        <input id="juego" type="text" class="form-control" name="juego" value="" placeholder="Juego">                                        
                    </div>
                                     
                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                                <input id="spoiler" type="checkbox" name="spoiler" value="1"> Spoiler
                            </label>
                          </div>
                    </div>

                    <div class="col-sm-12 controls">
                        <button id="btn-publicacion" href="#" type="submit" class="btn btn-success">Enviar</button>
                    </div>
                </form>
        </div>
    </li>
    <%
    if (publicaciones.size() != 0){
        for (PublicacionVO publicacion : publicaciones) {
            out.write("<li class=\"list-group-item\">");
            out.write("<div class=\"media\"><img class=\"mr-3\">");
            out.write("<div class=\"media-body\">");
            out.write("<h5><a href=\"./UsuarioEspecifico.jsp?seudonimo=" + publicacion.getUsuario() + "\">" + publicacion.getUsuario() + "</a></h5>");
            out.write("<h3>" + publicacion.getJuego() + "</h3>");
            out.write("<p>" + publicacion.getTexto() + "</p>");
            out.write("<small>" + publicacion.getFecha() + "</small>");
            out.write("</div>");
            out.write("</div>");
            out.write("</li>");
        }
    }
    %>
</ul>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
