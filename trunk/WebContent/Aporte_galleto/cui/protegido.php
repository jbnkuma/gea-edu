<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <title>acceso-estudiante</title>
  <link rel="stylesheet" type="text/css" href="barra.css" media="screen" />
  
</head>



<body>

<div id="contenedor">
<center><?php

$username = "ingenieria";
$password = "unix";
if ($_POST['txtUsername'] != $username || $_POST['txtPassword'] != $password) {
?>


<br/>
<br/>
<br/>
<h2><img src="./imagenes/garra.jpeg" height="35" width="35"/>GEA-EDU</h2>


<form name="form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
<p><label for="txtUsername">Username:</label>
<br/><input type="text" title="Introduce nombre de usuario" name="txtUsername"></p>
<p><label for="txtpassword">Password:</label>
<br/><input type="password" title="Introduce la contraseña" name="txtPassword"></p>
<p><input type="submit" name="Submit" value="Login"></p>
</form>
<?php
}else {
?>
</center>



<head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <title>geacui</title>
  <link rel="stylesheet" type="text/css" href="barra.css" media="screen" />
  <meta name="generator" content="Amaya, see http://www.w3.org/Amaya/" />
</head>
<body>
	<div id="contenedor">
		<div id="cabecera">
        	     <img  src="./imagenes/geacui.png" alt="logo CUI" name="baner1" width="650" height="80"/>
	     	<center>
                   	<img src="./imagenes/tux_work.png" alt="tux linux" name="tuxtrabajo" width="100" height="90"/>
             	</center>
		</div>
		<div id="menu1">
			<ul>
			  <li><a class="boton" href="">registrate</a></li>
			  <li><a class="boton" href="">pon algo aqui</a></li>
			  <li><a class="boton" href="">pon algo aqui</a></li>
			  <li><a class="boton" href="">pon algo aqui</a></li>
        		  <li><a class="boton" href="">pon algo aqui</a></li>
			</ul>
		</div>
		<div id="contenido">
		   <iframe style="border: 0px;" name="mi_marco" width="600" height="300" scrolling="no" src="1.html">
		      <p>Es probable que tu navegador no soporte iframes trata con algun otro navegador o actualiza tu navegador</p>
		   </iframe>
		</div>
	</div>





<?php
}
?>

</div>
</body>
</html>
