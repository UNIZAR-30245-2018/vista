<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <%@ page import="modelo.datos.VO.*" %>
    <%@ page import="modelo.datos.*" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
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
    boolean conectado = false;

	List<String> errores = new ArrayList<String>();
    if (request.getAttribute("errores") instanceof List) {
        errores = (List<String>) request.getAttribute("errores");
    }
    if (usuario != null){
        String yaConectado = "Ya estas conectado como " + usuario.getSeudonimo();
        errores.add(yaConectado);
        conectado = true;
    }
%>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<%
	if (errores != null && !errores.isEmpty() && errores.size() != 0) {
		for (String error : errores) {
			out.write("<div class=\"card\">");
			out.write("<div class=\"card text-white bg-danger mb-3\">");
        	out.write("<p class=\"card-text\">" + error + "<p>");
            if (conectado == true){ 
                out.write("<li><a href=\"verPerfil.jsp\"><button type=\"button\" class=\"btn btn-outline-warning\">Ir a tu perfil</button></a></li>");
            }
			out.write("</div>");
			out.write("</div>");
		}
	}
%>

    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-12 col-sm-6 col-sm-offset-12">                    
            <div class="panel panel-info" >
                <div class="panel-heading">
                    <div class="panel-title">Sign In</div>
                    <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a>
                </div>
            </div>     
                    
            <div style="padding-top:30px" class="panel-body" >
                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                          
                    <form id="loginform" action="LoginServlet.do" method="post" class="form-horizontal" role="form">
                                    
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="login-email" type="text" class="form-control" name="email" value="" placeholder="Email">                                        
                        </div>
                                
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="login-password" type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                                                
                        <div class="input-group">
                            <div class="checkbox">
                                <label>
                                    <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                </label>
                              </div>
                        </div>


                        <div style="margin-top:10px" class="form-group">
                            <!-- Button -->

                            <div class="col-sm-12 controls">
                                <button id="btn-login" href="#" type="submit" class="btn btn-success">Login  </button>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                    Don't have an account! 
                                    <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                        Sign Up Here
                                    </a>
                               </div>
                            </div>
                        </div>    
                    </form>       
                </div>                     
            </div>  
        </div>
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <form id="signupform" action="RegisterServlet.do" method="post" class="form-horizontal" role="form">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Email Address">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-md-3 control-label">Seudonimo</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="seudonimo" placeholder="Seudonimo">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Real Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="name" placeholder="Real Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="password" placeholder="Password">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up!</button>
                                    </div>
                                </div>
                                
                            </form>
                         </div>
                    </div>

               
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
        </div>
    </div>
</body>

</html>