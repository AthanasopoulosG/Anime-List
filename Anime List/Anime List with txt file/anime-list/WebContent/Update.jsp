<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "animelist.*" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Anime</title>
</head>

<style>
	<%@include file="css/update.css"%>
</style>

<body class="image" onload = "setgenres()">     



<!-- Insert the below code without the <!-- -> inside body and after class="image" to have anime image as background  -->
<!-- style="background-image:url('<c:out value='${anime.image}' />');"  -->
	<c:set var="status" value="${anime.status}" scope="request" />
	<c:set var="type" value="${anime.type}" scope="request" />
	<c:set var="curgen" value="${anime.genre}" scope="request" />
	<%
		String stat = request.getAttribute("status").toString();
		String t = request.getAttribute("type").toString();
		String cur_gen = request.getAttribute("curgen").toString();
		MainServlet anisev = new MainServlet();
		String[] genres = anisev.getGenres();
		String[] curgen = anisev.getCurGenres(cur_gen);
		
	%>	
	
<script>
	function setgenres(){
		
		<% for (int i=0 ; i<curgen.length ; i++ ) {	%>
			document.getElementById("<%out.print(curgen[i]);%>").checked = true;
		<%	}	%>
	}
	
</script>

<!-- 	***********************************************************************************************		-->
	<div class="header neon">My Anime List</div>
	

<nav>
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


	<div id="shadow" class="border">
		<form action="update" method="post">
			
			<div class="grid-container">
			
				<div class="grid-item">
					Anime Name:
				</div>	
				<div class="grid-item grid-item-right">
					<input  type="hidden" name="name" value="${anime.name}" />
					<p class="grid-item-right-align"> <strong><c:out value='${anime.name}' /> </strong></p>
				</div>
				<div class="grid-item">
					Type: 
				</div>
				<div class="grid-item grid-item-right">
					<input type="radio" id="show" name="type" value="Show">
	  				<label for="show">TV Series</label>
	  				
	  				<input type="radio" id="movie" name="type" value="Movie">
	  				<label for="movie">Movie</label>
	  				
	  				<input type="radio" id="OVA" name="type" value="OVA">
	  				<label for="OVA">OVA</label>
				</div>
				<div class="grid-item">
					Genre:
				</div>
				
				<div class="grid-item grid-item-right">
					<details>
					  	<summary>Add Genre</summary>
					  		<div class = "miniborder">
							  	<%for(int i=0 ; i< genres.length/2 ; i++ ){ %>
								  	<div>
								  		<input type="checkbox" id="<%out.print(genres[i]);%>"
								  			name="<% out.print(genres[i]); %>" value="<% out.print(genres[i]); %>">
								  		<label for="<% out.print(genres[i]); %>">
								  			<%
								  				out.println(genres[i]);
								  			%>
								  		</label>
								  	</div>
							  	<% } %>
								<%for(int i=genres.length/2 ; i< genres.length ; i++ ){ %>
									<div>
								  		<input type="checkbox" id="<% out.print(genres[i]); %>"
								  			name="<% out.print(genres[i]); %>" value="<% out.print(genres[i]); %>">
								  		<label for="<% out.print(genres[i]); %>">
								  			<%
								  				out.print(genres[i]);
								  			%>
								  		</label>
								  	</div>
								<% } %>
							</div>
					</details>
				</div>
				
				<div class="grid-item">	
					Select image:
				</div>	
					
				<div class="grid-item grid-item-right">	
					Current: <span style="word-break: break-all;"> <c:out value='${anime.image}' /> </span>
					 <div>
						<input type="file" class="txt_input file" name="myfile"
					 		accept="image/*">
					 </div>
				</div>	
					
				<div class="grid-item">	
			  		Season(s):
			  	</div>
			  		
				<div class="grid-item grid-item-right">	
					<input class="grid-item-right-align" type="number" name="season"  size="1"  min="1" max="10" value="<c:out value='${anime.season}' />" />
				</div>
				
				<div class="grid-item">	
			  		Status :
			  	</div>
			  		
				<div class="grid-item grid-item-right">	
					<input type="radio" id="completed" name="status" value="Completed"  onclick="disable()">
	  				<label for="completed" >Completed</label>
	  				
	  				<input type="radio" id="to_watch" name="status" value="To Watch" onclick="disable()">
	  				<label for="to_watch" >To Watch</label>
	  				
	  				<input type="radio" id="ongoing" name="status" value="Ongoing"  onclick="disable()" id="ongoing">
	  				<label for="ongoing" >Ongoing</label>
	  				<span style="margin-left:10px"><br>	Episode(s):</span>
	  				<input type="number" name="episode" size="1" value="<c:out value='${anime.episodes}' />" min="1" max="2000" id="ep"  disabled/>
	  					
				</div>
				
				<div class="grid-item">	
			  		Rating :
			  	</div>
				<div class="grid-item">
 					<input type="range" min="1" max="100" value="<c:out value='${anime.rating}' />" class="slider" id="myRange" name="rating">
  					<p >Value: <span id="demo"></span></p>
				</div>
				<div class="item3">
					<input id="btn" class="button" type="submit" value="Update Anime"  onclick="validate()"/>
				</div>
				
			</div>
			
			
	
		</form>
	</div>
	
<script>
	function disable(){ /*setting disable on and off depending on status*/
		if(document.getElementById('ongoing').checked) {
			document.getElementById('ep').disabled = false;
		}else if(document.getElementById('completed').checked){
			document.getElementById('ep').disabled = false;
		}else{
			document.getElementById('ep').value="1";
			
			document.getElementById('ep').disabled = true;
			
		}
		
	}
</script>

<script>
	function validate(){ /*removing disable on submit to avoid null exception*/
		
		if(document.getElementById('ep').disabled){
			document.getElementById('ep').disabled = false;
		}
	}
</script>

<script>
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
}
</script>
	
<script>
window.addEventListener("load",setStatus_Genre,false);
var status="<% out.print(stat);%>";

function setStatus_Genre()
{
	
	var tp="<% out.print(t);%>" ;
	
	if(status=="Completed"){
		document.getElementById('completed').checked=true;
		document.getElementById('ep').disabled = false;
	}else if(status=="Ongoing"){
		document.getElementById('ongoing').checked=true;
		document.getElementById('ep').disabled = false;
	}else{
		document.getElementById('to_watch').checked=true;
		document.getElementById('ep').disabled = true;
	}
	
	if(tp=="Movie"){
		document.getElementById('movie').checked=true;
	}else if (tp=="OVA"){
		document.getElementById('OVA').checked=true;
	}else {
		document.getElementById('show').checked=true;
	}
}

</script>
 
 <script>
<%@ include file="js/searchTrigger.js"  %>
</script>
</body>
</html>