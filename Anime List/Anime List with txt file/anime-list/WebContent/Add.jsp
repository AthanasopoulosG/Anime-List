<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page errorPage="error_page.jsp" %>

    
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Adding Anime</title>

<style >
	<%@include file="css/add.css"%>
</style>


</head>
<body class="image">

	<div class="header neon">My Anime List</div>

	<nav>
		<ul>
		  <li><a  href="home">Home</a></li>
			  <li class="dropdown"><a href="list">List All</a></li>		  
			  <li><a href="comp">Completed</a></li>
			  <li><a href="towatch">To Watch</a></li>
			  <li><a href="ongoing">My Ongoing</a></li>
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


	<div class="border" id="shadow">
		<form action="insert" method="post">
			<div class="grid-container" >
				<div class="grid-item">
					Anime Name*:
				</div>	
				<div class="grid-item grid-item-right">
					<input class ="txt_input" type="text" name="name"  placeholder="Will be converted to UpperCase" required/>
				</div>
				<div class="grid-item">
					Type*: 
				</div>
				<div class="grid-item grid-item-right">
					<input type="radio" id="show" name="type" value="Show" required>
	  				<label for="show">Show</label>
	  				
	  				<input type="radio" id="movie" name="type" value="Movie" required>
	  				<label for="movie">Movie</label>
	  				
	  				<input type="radio" id="OVA" name="type" value="OVA" required>
	  				<label for="OVA">OVA</label>
				</div>
				<div class="grid-item">
					Genre:
				</div>
				
				<div class="grid-item grid-item-right row">
					<div class = "col">
						<input type="checkbox" id="Action" name="Action"
							value="Action">
						<label for="Action">Action</label>
						&nbsp;
					</div >
					<div class = "col">
						<input type="checkbox" id="Adventure" name="Adventure" value="Adventure">
						<label for="Adventure">Adventure</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Mecha" name="Mecha" value="Mecha">
						<label for="Mecha">Mecha</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="School" name="School" value="School">
						<label for="School">School</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Comedy" name="Comedy" value="Comedy">
						<label for="Comedy">Comedy</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Demons" name="Demons" value="Demons">
						<label for="Demons">Demons</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Supernatural" name="Supernatural" value="Supernatural">
						<label for="Supernatural">Supernatural</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Magic" name="Magic" value="Magic">
						<label for="Magic">Magic</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Romance" name="Romance" value="Romance">
						<label for="Romance">Romance</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Fantasy" name="Fantasy" value="Fantasy">
						<label for="Fantasy">Fantasy</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Ecchi" name="Ecchi" value="Ecchi">
						<label for="Ecchi">Ecchi</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Super Power" name="Super Power" value="Super Power">
						<label for="Super Power">Super Power</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Horror" name="Horror" value="Horror">
						<label for="Horror">Horror</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Game" name="Game" value="Game">
						<label for="Game">Game</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Music" name="Music" value="Music">
						<label for="Music">Music</label>&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Sports" name="Sports" value="Sports">
						<label for="Sports">Sports</label>&nbsp;
					</div>
					<div class = "col">	
						<input type="checkbox" id="Harem" name="Harem" value="Harem">
						<label for="Harem">Harem</label>&nbsp;
					</div>	
					<div class = "col">
						<input type="checkbox" id="Military" name="Military" value="Military">
						<label for="Military">Military </label>&nbsp;
					</div>	
					<div class = "col">
						<input type="checkbox" id="Sci-fi" name="Sci-fi" value="Sci-fi">
						<label for="Sci-fi">Sci-fi </label>&nbsp;
					</div>
					<div class = "col">	
						<input type="checkbox" id="Slice of life" name="Slice of life" value="Slice of life">
						<label for="Slice of life">Slice of life </label>&nbsp;
					</div>	
					<div class = "col">
						<input type="checkbox" id="Thriller"
							name="Thriller" value="Thriller">
						<label for="Thriller">Thriller</label>
						&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Vampire"
							name="Vampire" value="Vampire">
						<label for="Vampire">Vampire</label>
						&nbsp;
					</div>
					<div class = "col">
						<input type="checkbox" id="Space" name="Space"
							value="Space">
						<label for="Space">Space</label>
						&nbsp;
					</div>
				</div>
				
				<div class="grid-item">	
					Select image:
				</div>	
					
				<div class="grid-item grid-item-right">	
					<input type="file" class = "txt_input file" name="myfile"  accept = "image/*" >
				</div>	
					
				<div class="grid-item">	
			  		Season(s):
			  	</div>
			  		
				<div class="grid-item grid-item-right">	
					<input type="number" name="season" value="1" size="1"  min="1" max="10" />
				</div>
				
				<div class="grid-item">	
			  		Status* :
			  	</div>
			  		
				<div class="grid-item grid-item-right">	
					<input class="radiobtn" type="radio" id="completed" name="status" value="Completed"  onclick="disable()" required>
	  				<label for="completed" >Completed</label>
	  				
	  				<input class="radiobtn" type="radio" id="to_watch" name="status" value="To Watch" onclick="disable()" required>
	  				<label for="to_watch" >To Watch</label>
	  				
	  				<input class="radiobtn" type="radio" id="ongoing" name="status" value="Ongoing" onclick="disable()" id="ongoing" required>
	  				<label for="ongoing" >Ongoing</label>
	  				<span style="margin-left:10px"><br>	Episode:</span>
	  				<input type="number" name="episode" size="1" value="1" min="1" max="2000" id="ep"  disabled/>
	  				
				</div>
				
				<div class="grid-item">	
			  		Rating :
			  	</div>
			  	
			  	<div class="grid-item grid-item-right">	
					<div >
 						 <input type="range" min="1" max="100" value="1" class="slider" id="myRange" name="rating">
  						<p>Value: <span id="demo"></span></p>
					</div>
				</div>
				
				
				
				
				<div class="item3">
					<input id="btn" class="button" type="submit" value="Save Anime" onclick="validate()"/>
				</div>
				
			</div>
			
			
	
		</form>
	</div>


<script>
	function disable(){ /*setting disable on and off depending on status*/
		if(document.getElementById('ongoing').checked) {
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
<%@ include file="js/searchTrigger.js"  %>
</script>
</body>
</html>