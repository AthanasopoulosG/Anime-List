
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>Anime</title>

<style >
	<%@include file="css/new.css"%>
</style>
	
</head>
<body id = "bd" >


<script>
	
	 function imagenotfound(img) 
	 {
		img.width = 115;
		img.height = 115;
		img.style.margin ="35px 0 0 5.5%" ;
		img.src = "/docs/images/error.png";
	}
	 
	 	
</script>

	
<div class="header">My Anime List</div>


	<nav id="navbar">
		<ul>
		  <li><a class="active" href="home">Home</a></li>
		  <li><a href="list">List All</a></li>
		  <li><a href="comp">Completed</a></li>
		  <li><a href="ongoing">My Ongoing</a></li>
		  <li><a href="towatch">To Watch</a></li>
		  <li><a href="add">Add Anime</a></li>
		  <li><a href="genre">Genre</a></li>
		  <li class="search" >
			<form id = "searchform" action="Anime_search" method="post">
				<input type="hidden" name="one" value="&#9776;">
				<input id = "se" type="text" placeholder="Search" name="name">
		  		<button id = "bt1" class="but" type="button" ><i class="fa fa-search"></i></button>
		  	</form>
		  </li>
		  
		</ul>
		
	</nav>




	<div class= "contpseudotitle ">
		<p class="contTitle" > Continue Watching ... </p>
	</div>
		
		
	<div  class="homeborder" >
		<!--  FOR EACH ONGOING ANIME HERE TO SHOW UP TO 5? -->
		<c:forEach var="anime" items="${list}">
			<div class="imgholder">
				<div class="imgborder">
					<a  href="Display?id=${anime.name}" >
						<div class = " p_a_h">
							<div class="p_a_t"> ${anime.name} </div>
						</div>
					</a>
					<img  alt = "nothing" id = "${anime.name}"  onerror = "imagenotfound(this)"
							src="/docs/images/anime/${anime.image}"  width="130" height="200" >
				</div>
			</div >
		</c:forEach>
	</div>	
	
	
<script>
<%@ include file="js/searchTrigger.js"  %>
</script>		
 
<script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
var topbtn = document.getElementById("totop");

function myFunction() {
  if (window.pageYOffset-1 >= sticky) {
    navbar.classList.add("sticky");
  } else {
    navbar.classList.remove("sticky");
  }
  
  if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
	    topbtn.style.display = "block";
	} else {
	    topbtn.style.display = "none";
	}
}



</script>



<!--  ----------------------------------------------------------------------------------------------------------- -->
</body>
</html>