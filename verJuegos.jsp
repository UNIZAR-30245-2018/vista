<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juegos</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<%@ page import="modelo.datos.VO.*" %>
<%@ page import="modelo.datos.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<body>
<% ArrayList<JuegoVO> juegos = (ArrayList<JuegoVO>)request.getAttribute("juegos");
    if(juegos == null){
        WebFacade fachada = new WebFacade();
        juegos = fachada.getJuegos();
    }
%>
<nav class="navbar navbar-light navbar-expand-md">
    <div class="container-fluid"><a class="navbar-brand" href="#">Nombre de la Red Social</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse"
             id="navcol-1">
            <ul class="nav navbar-nav">
                <li class="nav-item" role="presentation"><a class="nav-link" href="verFeedServlet.do">Usuario</a></li>
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
<div style="/*align-items:center;*/align-items:center;align-content:center;margin-top:1%;/*left:365px;*//*width:62px;*//*height:51px;*//*color:white;*//*position:absolute;*/text-align:center;/*background-color:black;*/">
    <h1 style="/*align-self:center;*//*align-items:center;*//*align-content:center;*/margin:auto;line-height:51px;vertical-align:middle;">Lista de Juegos</h1>
</div>
<ul class="list-group" style="/*align-items:center;*//*align-items:center;*/align-content:center;/*margin-top:10%;*//*margin-left:1%;*//*width:62px;*//*height:51px;*//*color:white;*//*position:absolute;*//*text-align:center;*//*background-color:black;*/">
    <%  for(int i= 0; i < juegos.size(); i++) {
        out.write("<li class=\"list-group-item\" id=\"colJuego\">\n"
                + "        <div style=\"width:400px;/*position:absolute;*/float:left;\">\n"
                + "            <h1>"+ juegos.get(i).getNombre() + "</h1>\n"
                + "        </div>\n"
                + "        <form action=\"addJuegoServlet.do\" method=\"get\">\n"
                + "             <button name =\"lista\" class=\"btn btn-danger\" type=\"submit\" value=\"pendiente\" style=\"float:right;\">Añadir a pendiente</button>\n"
                + "             <input name=\"id\" type=\"hidden\" value=\""+ juegos.get(i).getId() +"\">\n"
                + "        </form>\n"
                + "        <form action=\"addJuegoServlet.do\" method=\"get\">\n"
                + "             <button name =\"lista\" class=\"btn btn-primary\" type=\"submit\" value=\"enCurso\" style=\"float:right;\">Añadir a en curso</button>\n"
                + "             <input name=\"id\" type=\"hidden\" value=\""+ juegos.get(i).getId() +"\">\n"
                + "        </form>\n"
                + "        <form action=\"addJuegoServlet.do\" method=\"get\">\n"
                + "            <button name =\"lista\" class=\"btn btn-success\" type=\"submit\" value=\"completado\" style=\"float:right;\">Añadir a completado</button>\n"
                + "            <input name=\"id\" type=\"hidden\" value=\""+ juegos.get(i).getId() +"\">\n"
                + "        </form>\n"
                + "    </li>");
    }
    %>
</ul>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>