<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%  String emailLogin = null;
    boolean leSigue = false;
    String password = null;
    try {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("email")) {
                    emailLogin = cookies[i].getValue();
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
    UsuarioVO usuarioLogin = fachada.buscarUsuario(emailLogin, password);
    if (usuarioLogin == null){
        pageContext.forward("Login.jsp");
    }

    ArrayList<UsuarioVO> usuarios = (ArrayList<UsuarioVO>)request.getAttribute("juegos");
    if(usuarios == null){
        usuarios = fachada.getUsers();
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
            <ul class="nav navbar-nav">
                <li class="nav-item" role="presentation"><a class="nav-link active" href="verUsuariosServlet.do">Lista de Usuarios</a></li>
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
    <h1 style="/margin:auto;line-height:51px;vertical-align:middle;">Lista de Usuarios</h1>
</div>
<ul class="list-group" style="/*align-items:center;*//*align-items:center;*/align-content:center;/*margin-top:10%;*//*margin-left:1%;*//*width:62px;*//*height:51px;*//*color:white;*//*position:absolute;*//*text-align:center;*//*background-color:black;*/">
    <%  for(int i= 0; i < usuarios.size(); i++) {
      if(!usuarios.get(i).equals(usuarioLogin)){
          leSigue = fachada.userSigue(usuarioLogin,usuarios.get(i));
          if(leSigue) {
              out.write("<li class=\"list-group-item\" id=\"colJuego\">\n"
                      + "        <div style=\"width:400px;/*position:absolute;*/float:left;\">\n"
                      + "            <h1>" + usuarios.get(i).getNombre() + "</h1>\n"
                      + "        </div>\n"
                      + "        <form action=\"seguirUserServlet.do\" method=\"get\">\n"
                      + "             <button name =\"user\" class=\"btn btn-primary\" type=\"submit\"  value=\"" + usuarioLogin.getSeudonimo() + "\" style=\"float:right;\">Dejar De Seguir</button>\n"
                      + "              <input name=\"seguido\" type=\"hidden\" value=\""+ usuarios.get(i).getSeudonimo() +"\">\n"
                      + "              <input name=\"accion\" type=\"hidden\" value=\"Dejar de seguir\">\n"
                      + "        </form>\n"
                      + "    </li>");
          }
          else{
              out.write("<li class=\"list-group-item\" id=\"colJuego\">\n"
                      + "        <div style=\"width:400px;/*position:absolute;*/float:left;\">\n"
                      + "            <h1>" + usuarios.get(i).getNombre() + "</h1>\n"
                      + "        </div>\n"
                      + "        <form action=\"seguirUserServlet.do\" method=\"get\">\n"
                      + "             <button name =\"user\" class=\"btn btn-primary\" type=\"submit\"  value=\"" + usuarioLogin.getSeudonimo() + "\" style=\"float:right;\">Seguir</button>\n"
                      + "              <input name=\"seguido\" type=\"hidden\" value=\""+ usuarios.get(i).getSeudonimo() +"\">\n"
                      + "              <input name=\"accion\" type=\"hidden\" value=\"seguir\">\n"
                      + "        </form>\n"
                      + "    </li>");

          }



      }

    }
    %>
</ul>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>