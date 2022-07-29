
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error_page.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Anime search</title>

	<style>
		<%@include file="css/new.css" %>
	</style>
</head>
<body>

<script>
	
	 function imagenotfound1(img) {
		 	img.style.cssText = "width:350px;";
			img.src = "/docs/images/error.png";
		}
	 
	 function imagenotfound2(img) {
			img.margin = 0;
			img.width = 270;
		    img.height = 300;
			img.src = "/docs/images/error.png";
		}
	 
	 function imagenotfound3(img) {
			img.src = "/docs/images/error.png";
		}
	 
	 	
</script>
				

	<h1 class="header">My Anime List</h1>

	<button id="totop" onclick="topFunction()" > <i class=" arrow up"></i><i class=" arrow up"></i>
	</button>

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
	
	<div class="onebyone">
		<form action="Anime_search" method="post">
			<input type="hidden" name="search" value="${list}" >
			<input type="hidden" name="name" value="${search}" >
			<input type="submit" name="one" value="&#9776;">
			<input type="submit" name="one" value="&#9783;">
			<input type="submit" name="one" value="&#9926;">
		</form>
	</div>
		
	<h2>Results for "<c:out value="${search}" />"</h2>
		
		
	<c:if test="${found == 'no'}">
		<h2>No results found for " <c:out value="${search}" /> "</h2>
	</c:if>
		
		
			 <!-- Printing all variables to html web browser page -->
<c:if test="${found =='yes'}">
		<c:if test="${coding == '&#9776;' }" >
            <c:forEach var="anime" items="${list}" >
            
            	<div  class="border" id="shadow">
            	
            		<a  href = "Display?id=<c:out value='${anime.name}' />">
            			<div class = "a1by1"></div>
            		</a>
            		
	              	 <h4 style="color:white;padding-left: 5px; margin-bottom:0px;"></h4>
	              	 <c:set var="rate" value="${anime.rating}" scope="request" />
							<%/*out.println(AnimeServlet.ret()); */
					          String rate1 = request.getAttribute("rate").toString();
					          int co = Integer.parseInt(rate1);
					          if (co>80){%>
							<div class="name flames"><b><c:out value="${anime.name}" /></b></div>
							<%}else { %>
							<div class="name crystal" ><b><c:out value="${anime.name}" /></b></div>
							<%} %>
					 <hr class="line" >
					 		
	              	 <div class="row">
	              	 	<div class="column">
	              	 		
	              	 		<div align="center" style="box-shadow: 0 0 20px #000; margin-bottom: 15px;">
	              	 			<img  onerror = "imagenotfound1(this)" src="/docs/images/anime/<c:out value="${anime.image}" />" id="im" width="450" height="400" >
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
		              	 		</div>
		              	 		<div class="grditem">
		              	 			<b >Status:</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<c:out value="${anime.status}" />
		              	 		</div>
		              	 		<div class="grditem">
		              	 			<c:if test="${anime.status == 'Completed' }" >
		              	 				<b >Total Episodes:</b>
		              	 			</c:if>
		              	 			<c:if test="${anime.status != 'Completed' }" >
		              	 				<b >Current Episode:</b>
		              	 			</c:if>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<p style = "margin-top: 0; "> <c:out value="${anime.episodes}" />   </p>
		              	 		</div>
		              	 		<div class="grditem">
		              	 			<b >My Rating:</b>
		              	 		</div>
		              	 		<div class="grditem-right">
		              	 			<c:out value="${anime.rating}"/>	/	100<br>
		              	 			<c:set var="rate" value="${anime.rating}" scope="request" />
		              	 			
		              	 			<%/*out.println(AnimeServlet.ret()); */
		              	 			String rate = request.getAttribute("rate").toString();
		              	 			int temp2 = Integer.parseInt(rate);
		              	 			int temp = temp2/10; /* splitting code and put html code between */
		              	 			for(int i=0;i<temp;i++){%> 
		              	 				<span style="font-size:1.3em;color:white;">&#9733;</span>
		              	 			<%} %>
		              	 			<%if (temp2%10>=3 && temp2%10<=7) {%>
		              	 				<span style="font-size:1.1em;color:white;">&#9734;</span>
		              	 			<%}else if (temp2%10>7){ %>	
		              	 				<span style="font-size:1.2em;color:white;">&#9733;</span>
		              	 			<%} %>
		              	 		</div>
		              	 		<div><a href="edit?id=<c:out value='${anime.name}' />"><button id="edit" >Edit</button></a></div>
	              	 			<div><a href="delete?id=<c:out value='${anime.name}' />"><button id="delete">Delete</button></a></div>
	              	 		</div>
	              	 		<!--  ||| end of grid ||| -->
	              	 	</div>
	              	 	
	              	 	 <div class="column synaps" >
	              	 	 <div>
	              	 	 	<h2 >Summary</h2>
	              	 	 	<form action="summ" method="post">
	              	 	 		<span class= "sum_note">
									<input type="hidden" name="name" value="${anime.name}" >
									<input type="submit" name="upd" class="up1" value="Update Summary">
	              	 	 		</span>
	              	 	 	</form>
	              	 	 </div>
	              	 	 <div>
	              	 	 	<p style = "width: 92%;" class="textar " >
	              	 	 		<c:out value="${anime.summary}" />
							</p>
							
						</div>
							<div>
		              	 	 	<h2 >My Notes</h2></div>
		              	 	 	<form action="notes" method="get">
		              	 	 		<span class= "sum_note">
										<input type="hidden" name="name" value="${anime.name}" >
										<input type="submit" name="upd" class="up1" value="Update Notes">
		              	 	 		</span>
	              	 	 		</form>
							<div>
								<p style = "width: 92%;" class="textar" >
									<c:out value="${anime.notes}" />
								</p>
							</div>
	              	 	 </div>
					 </div>
        		 </div>
        		 
            </c:forEach>
		 </c:if>
	
		<c:if test="${coding =='&#9783;'}">
		<div class = "onetofourholder ">
			
			<c:forEach var="anime" items="${list}" >
				<div class=" t4itemholder">	
					<div  class="onetofour target">
						
						<a  href = "Display?id=<c:out value='${anime.name}' />">
							<div class = "a1t4"></div>
						</a>
					
						<h4 style = "margin-top: 3px; "></h4>
						<c:set var="rate" value="${anime.rating}" scope="request" />
						<%
				          String rate1 = request.getAttribute("rate").toString();
				          int co = Integer.parseInt(rate1);
				          if (co>80){%>
						<div class="name2 flames" ><b><c:out value="${anime.name}" /></b></div>
						<% } else { %>
						<div class="name2 crystal" ><b><c:out value="${anime.name}" /></b></div>
						<%} %>
			            <div align="center" style = "min-height: 350px;">
			              	 <img  src="/docs/images/anime/<c:out value="${anime.image}" />" 
			              	 	onerror = "imagenotfound2(this)" width="380" height= "350" style = "border-radius: 20px;">
			            </div>
			            <div class="grd2 ">
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
				            </div>
				            <div class="grditem">
				             	 <b >Status:</b>
				            </div>
				            <div class="grditem-right">
				            	 <c:out value="${anime.status}" />
				            </div>
				            <div class="grditem">
				            	 <b >Current Episode:</b>
				            </div>
				            <div class="grditem-right">
				            	<p style = "margin-top: 0; "> <c:out value="${anime.episodes}" />   </p>
				            </div>
				            <div class="grditem">
				            	 <b >My Rating:</b>
				            </div>
				         	<div class="grditem-right">
				             	<c:out value="${anime.rating}"/>	/	100<br>
				             	<c:set var="rate" value="${anime.rating}" scope="request" />
				              	 			
				             	<%
						            String rate = request.getAttribute("rate").toString();
						            int temp2 = Integer.parseInt(rate);
						            int temp = temp2/10; 
						            /* splitting code and put html code between */
						            for(int i=0;i<temp;i++){%> 
					              	 	<span style="font-size:1.3em;">&#9733;</span>
					             <% } %>
					             <% if (temp2%10>=3 && temp2%10<=7) {%>
					              	 	<span style="font-size:1.1em;">&#9734;</span>
					             <% } else if (temp2%10>7){ %>	
					              	 	<span style="font-size:1.2em;">&#9733;</span>
					             <% } %>
					        </div>
				            <div class="grditem"><a href="edit?id=<c:out value='${anime.name}' />"><button id="edit">Edit</button></a></div>
			              	<div class = " grditem"><a href="delete?id=<c:out value='${anime.name}' />"><button id="delete">Delete</button></a></div>
					</div>
			              	 		
			              	 		
					</div>
				</div>
			</c:forEach> 
			
		</div> 	 	
	</c:if>
	
	<c:if test="${coding =='&#9926;'}">
	
		<div class="grd3">
		<c:forEach var="anime" items="${list}" >
			<div class="grd3item" >
			
				<div  class="onetomany" > 
					<a class="linkingrd3" href="Display?id=<c:out value='${anime.name}' />" >
						<div class = "grid1by4"> 
							
							<h4 style="margin:0;padding-top: 6px;"></h4>
							
				        	<img  src="/docs/images/anime/<c:out value="${anime.image}" />"  
				        		onerror = "imagenotfound3(this)" width="125" height="125" style = "padding-top: 10px;">
				        		
				        	<div class = "grd34">
				        		<b class="name3"><c:out value="${anime.name}" /></b>
				        		
				        		<p > <b>Type:</b>  <c:out value="${anime.type}" />&nbsp; , <c:out value="${anime.episodes}" /> Episode(s)</p>
					   			<p class = "fixedgenreheight"><b>Genre:</b> <c:out value="${anime.genre}" /> </p>
					   			<p > <b>Status:</b>   <c:out value="${anime.status}" /> </p>
				        	</div>
					   		
					   		<div  style="width:100%;text-align:center;">
								<c:set var="rate" value="${anime.rating}" scope="request" />
				              	 			
				              	 <%
				              	 	String rate = request.getAttribute("rate").toString();
				              	 	int temp2 = Integer.parseInt(rate);
				              	 %> 
				              	 			
				              	 <%if (temp2>90 ) {%>
				              	 	<div class="flames" style="font-size: 3em;"> &#9733; </div>
				              	 <%}else if (temp2>70){ %>	
				              	 	<div class="crystal" style="font-size: 3em;"> &#9733; </div>
				              	 <%}else{ %>
				              	 	<div class="green" style="font-size: 3em;"> &#9733; </div>
				              	 <% } %>	
				              	 <span style = "font-size: 0.8em;"> <%= temp2 %>/100 </span>
							</div>
					   	</div>
			       	</a>
			    </div>
		   	</div>
		</c:forEach>
		</div>
	</c:if>
</c:if>


<script>
<%@ include file="js/searchTrigger.js"  %>
</script>

<script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
var topbtn = document.getElementById("totop");

function myFunction() {
	if (document.body.scrollHeight > 1300) {	
		  if (window.pageYOffset >= sticky) {
			navbar.classList.add("sticky")
		  } else {
			navbar.classList.remove("sticky");
		  }
	  }
  
  if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
	    topbtn.style.display = "block";
	} else {
	    topbtn.style.display = "none";
	}
}

// GO TO TOP FUNCTION
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
// -------------------------------------------------


</script>

<script>
window.onload = function() {
	
	// Inside 2nd && 3rd organize method in case of re-styling
	const first_status = "&#9776;";
	const second_status = '&#9783;';
	const collection = document.getElementsByTagName("h2");
	const header = document.getElementsByClassName("header");
	if (first_status != '${coding}') {
		document.body.style.backgroundImage = "repeating-linear-gradient(140deg, black , #4c4c4c 14%, black 20%)";
		header[0].style.color = "crimson";
		collection[0].style.color = "gold";
		//alert(document.body.style.backgroundImage);
	} 
	
	//alert("loaded");	
}
</script>	

</body>
</html>