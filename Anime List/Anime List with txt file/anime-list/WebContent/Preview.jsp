
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error_page.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Anime search</title>

	<style>
	<%@include file="css/new.css" %>
	body { 
	
  		counter-reset: section;
	}
	
	.border {
		border-style:none;
		background-color:rgba(100,100,240,0.3);
		width: auto;
	 	margin: 15px;
	 	box-shadow: 5px 5px #bdbdbd;
	}
	
	ul {
	  list-style-type: none;
	  margin-top: 5px;
	  padding: 0;
	  overflow: hidden;
	  background-color: #333;
	  
	  width: 100%;
	}
	
	li {
	  float: left;
	}
	
	nav a  {
	  display: block;
	  color: white;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	}
	
	
	
	li a:hover {
	  background-color: #111;
	}
	
	h1 {
		margin-top: 2px;
		text-align: center;
	}
	
	h2 {
		margin-top: 100px;
		text-align:center;	
	}
	
	.search {
		float:right;
		padding:auto;
		margin-top: 15px;
		margin-right: 50px;
		
	}
	
	h4::before {
  		counter-increment: section;
  		content:  counter(section) ". ";
	}
	
	.but {
		cursor: pointer;
	}
	
	.but:hover {
		background-color: lightblue;
	}
	
	/* Create three equal columns that floats next to each other */ 
	.column {
  		 float: left;
 		 width: 25%;
 		 padding: 5px;
 		 background-color:gray;
	}

	/* Clear floats after the columns */
	.row:after {
		  content: "";
		  display: table;
		  clear: both;
	}
	
	.name {
		font-size:1.3em;
		text-align: center;
	}
	
	.grd {
		
	  	display: grid;
	  	grid-row-gap: 4px;
	  	grid-column-gap: 2px;
	  	grid-template-columns: auto 220px;
	  	background-color:white;
	  	padding: 5px;
	  	margin: 5px;
	  	float:left;
	  	
	}
	
	.grditem {
	
	  padding-right: 50px;
	  padding:2px;
	  margin: 2px;	 
	  border: 1px solid rgba(0, 0, 0, 0.8); 
	}
	
	.grditem-right {
		float:left;
		margin: 2px;
		padding:2px;
		border: 1px solid rgba(0, 0, 0, 0.8);
	}
	
	div.test {
	 	
 		 word-break: keep-all;
	}
	
	@media screen and (max-width:600px) {
  		.column {
   		 width: 100%;
  		}
	}
	</style>
</head>
<body>

				

<h1 class="header">My Anime List</h1>


	<nav >
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
		<!--  <div>
			<form action="search" >
				<input type="text" placeholder="Search" name="search">
				<button type="submit" ></button>
			</form>
		</div>-->
	</nav>

		
		<h2>Results for "<c:out value="${search}" />"</h2>
		
		
		
		
			 <!-- Printing all variables to html web browser page -->
            <c:forEach var="anime" items="${list}" >
            	<div  class="border">
	              	 <h4></h4>
	              	 <div class="row">
	              	 	<div class="column">
	              	 		<div class="name"><b><c:out value="${anime.name}" /></b></div>
	              	 		<div align="center">
	              	 			<img  src="<c:out value="${anime.image}" />" width="350" height= "250" >
	              	 		</div>
	              	 	</div>
		              	 	
		              	 <div class="column">
		              		<div class="grd">
		             	 		<div class="grditem">
		             	 			<b >Type:</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			 <c:out value="${anime.type}" />
		              	 		</div>
		              	 		<div class="grditem">
		              	 			<b >Genre:</b>
		              	 		</div>
		              	 		<div class="grditem-right test">
		              	 			<c:out value="${anime.genre}" />
		              	 		</div>
		              	 		<div class="grditem">
		              	 			<b >Season(s):</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<c:out value="${anime.season}" />
		              	 		</div><div class="grditem">
		              	 			<b >Status:</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<c:out value="${anime.status}" />
		              	 		</div><div class="grditem">
		              	 			<b >Current Episode:</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<input type="text" style="text-align:center" id="num" name="season" value="<c:out value="${anime.episodes}" />" size="2" readonly />
		              	 		</div>
		              	 		<div><a href="edit?id=<c:out value='${anime.name}' />">Edit</a></div>
	              	 		 <div><a href="delete?id=<c:out value='${anime.name}' />">Delete</a></div>
	              	 		</div>
	              	 		
	              	 		
	              	 	</div>
					 </div>
	              	 
	                 
	                 
	                
	              
        		 </div>
            </c:forEach>

<script>
<%@ include file="js/searchTrigger.js"  %>
</script>

</body>

</html>