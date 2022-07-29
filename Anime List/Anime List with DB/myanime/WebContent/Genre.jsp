
<%@ page language="java" contentType="text/html"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="myanime.*"%>
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
<body>

<% 
	//AnimeServlet an = new AnimeServlet();
	AnimeServlet sv = new AnimeServlet(); 
	String[] genres = sv.getGenres(); 
	
%>	
<script>
	
	 function imagenotfound3(img) 
	 {
		
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
	
	<button id="totop" onclick="topFunction()" > <i class=" arrow up"></i><i class=" arrow up"></i>
	</button>
	
	
	<div class="genreContainer">
	 	<div class = "outerGenreBorder">
			<div class="genreOrder">

				<%
					for (int i=0 ; i < genres.length ; i++)
					{
				%>
					<div style="padding: 5px 0 5px 0;min-width: 118px;">
						<input  type = "checkbox" id = "<% out.print(genres[i]); %>"
							name = "<% out.print(genres[i]); %>"
							value = "<% out.print(genres[i]); %>" >
						<label for="<% out.print(genres[i]); %>">
							<%out.print(genres[i]);%>
						</label>
					</div>
				<% } %>

			</div>
		</div>
	</div>

	<div	id = "adder" >
	
	</div>
	
	

 
<script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
var topbtn = document.getElementById("totop");


function myFunction() {
  if (window.pageYOffset-1 >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
  
  if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
	    topbtn.style.display = "block";
	} else {
	    topbtn.style.display = "none";
	}
} // function end


//GO TO TOP FUNCTION
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
//-------------------------------------------------
</script>

<script type="text/javascript">

	
	
</script>

<script type="text/javascript">
	class Anime {
		constructor (name, type, genre, image, seasons, status, episodes, rating) {
			this.name = name;
			this.type = type;
			this.genre = genre;
			this.image = image;
			this.seasons = seasons;
			this.status = status;
			this.episodes = episodes;
			this.rating = rating;
		}
	}
</script>


<script>
	const gen_string = [];
	const ani = [];
	var al = [];
	var al_counter;
	let c = 0;
	const target = document.getElementById("adder");
	const divouter = document.createElement("div");
	const divinner = document.createElement("div");
	const divgriditems = document.createElement("div");
	const divrating = document.createElement("div");
	const div34 = document.createElement("div");	//name and data grid item
	divouter.classList.add("genre_item");
	divinner.classList.add("onetomany");
	divgriditems.classList.add("grid1by4");
	divrating.style.cssText = "width:100%;text-align:center;margin-right: 5px";
	div34.classList.add("grd34");
	
	<c:forEach var="anime" items="${list}" >
		ani[c] = new Anime("${anime.name}", "${anime.type}", "${anime.genre}", "${anime.image}", "${anime.season}", 
				"${anime.status}", "${anime.episodes}", "${anime.rating}");
		c++;
	</c:forEach>
	
	
	var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	
	for (let i=0 ; i < checkboxes.length ; i++) {
		checkboxes[i].addEventListener ("change", function() {
			// inside of function
			const curbox = this.name;
			
			adder.innerHTML = "";
			al = [];
			al_counter = 0;
			var str = "" ;
			
			if (this.checked) {
				
				gen_string.push(this.value);
				al_counter = ListCreatorByGenre (al, al_counter) ;
				
			} else {
				for (let i=0 ; i < gen_string.length ; i++) {
					if (curbox == gen_string[i] ) {
						gen_string.splice(i,1);
					}
				}
				al_counter = ListCreatorByGenre (al, al_counter) ;
			}
			
			for (let i=0 ; i < al_counter ; i++) {
				RatingInit(i);
				div34Init(i);
				divgriditemsInit (i);
				divinnerInit (i);
				divouter.appendChild(divinner);		// overwrite divouter and append it to id adder
				adder.innerHTML += divouter.outerHTML;
			}
			
			
		}// END of function
		);
	}
	
	function ListCreatorByGenre (al, al_counter) {
		for (let l=0 ; l < c ; l++) {		// loop through all anime to get sublist of genre
			var animegenre = ani[l].genre;
			var counter = 0;
			
			for (let j=0 ; j < gen_string.length ; j++) {	// check genre type if all match
				if (animegenre.includes(gen_string[j])) {
					counter++;
				}
			}
			
			if (gen_string.length == 0){
				al_counter = 0;
				return al_counter;
			}
			
			if (counter == gen_string.length) {			// anime rdy to get added to new list
				al.push(ani[l]);
				al_counter++;
			}
		}
		
		return al_counter;
	}
	
	
	function RatingInit(i){
		
		if (al[i].rating > 90){
    		divrating.innerHTML ="<div class ='flames' style='font-size: 3em;'> &#9733; </div> \n";
    	} else if(al[i].rating >70){
    		divrating.innerHTML ="<div class ='crystal' style='font-size: 3em;'> &#9733; </div> \n";
    	} else {
    		divrating.innerHTML ="<div class ='green' style='font-size: 3em;'> &#9733; </div> \n";
    	}
    	
		divrating.innerHTML += "<span style = 'font-size: 0.9em;color: aqua;'>" + al[i].rating + "/100 </span> \n"; 
	}
	
	function div34Init (i) {
		
		div34.innerHTML = "<b class='name3'>" +al[i].name +"</b> \n";
		div34.innerHTML += "<p > <b>Type:</b>"+  al[i].type + " , "+al[i].episodes +" Episode(s)</p> \n";
		div34.innerHTML += "<p class = 'fixedgenreheight'><b>Genre:</b>"+ al[i].genre +"</p> \n";
		div34.innerHTML += "<p > <b>Status:</b> "+al[i].status +"</p> \n";
	}
	
	function divgriditemsInit (i) {
		// correct also
		divgriditems.innerHTML = "<h4 style='margin:0;margin-left: 5px;padding-top: 6px;'></h4> \n";
		divgriditems.innerHTML += "<img  src='/docs/images/anime/" + al[i].image + "' onerror = 'imagenotfound3(this)' width='125' height='125' style = 'margin-top: 10px;'> \n"; 
		divgriditems.appendChild( div34) ;
		divgriditems.appendChild(divrating) ;
	}
	
	function divinnerInit (i) {
		divinner.innerHTML = "<a class='linkingrd3 ' href='Display?id="+al[i].name + "'> <div class = 'genres_hover'> </div> </a> \n";
		divinner.appendChild(divgriditems);

	}
</script>
<script>
<%@ include file="js/searchTrigger.js"  %>
</script>

<!--  ----------------------------------------------------------------------------------------------------------- -->
</body>
</html>