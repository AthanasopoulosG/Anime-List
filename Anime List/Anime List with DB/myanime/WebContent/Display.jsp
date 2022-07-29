<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang= "en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title><c:out value="${anime.name}" /></title>

<style >
	<%@include file="css/new.css"%>
</style>
</head>
<body>

<script>
	
	 function imagenotfound1(img) {
		 	img.width = 350;
			img.src = "/docs/images/error.png";
		}
	 
	 	
</script>

<div class="header">My Anime List</div>

	
	<nav id="navbar" >
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
	<c:if test="${show == 'yes' }">
		<c:if test="${success }">
			<div id="pop">
				~~ Updated Successfully ~~
			</div>
		</c:if>
		<c:if test="${ !success }">
			<div id="pop">
				~~ Update Failed ~~
			</div>
		</c:if>
	</c:if>
	
	<div  class="border" style="height: auto;" id="shadow">
	              	 
	              	 <c:set var="rate" value="${anime.rating}" scope="request" />
							<%
					              String rate1 = request.getAttribute("rate").toString();
					              int co = Integer.parseInt(rate1);
					              if (co>80){%>
							<div class="name" id="flames"><b><c:out value="${anime.name}" /></b></div>
							<% }else { %>
							<div class="name" ><b><c:out value="${anime.name}" /></b></div>
							<% } %>
					 <hr class="line" >
					 		
	              	 <div class="row">
	              	 	<div class="column">
	              	 		
	              	 		
	              	 		<div align="center" style=" margin-bottom: 15px;">
	              	 			<img  onerror = "imagenotfound1(this)" src="/docs/images/anime/<c:out value="${anime.image}" />"  width="450px" >
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
		              	 		<div><a href="edit?id=<c:out value='${anime.name}' />"><button id="edit">Edit</button></a></div>
	              	 			<div><a href="delete?id=<c:out value='${anime.name}' />"><button id="delete">Delete</button></a></div>
	              	 		</div>
	              	 		<!--  ||| end of grid ||| -->
	              	 	</div>
	              	 	
	              	 	 <div class = "column colwidth" >
		              	 	 <div  class = "paragraphmargin ">
			              	 	 		<h2 style="margin-top: 0;padding-top:0; font-style:italic;text-decoration: underline;color:white;">
			              	 	 			Summary
			              	 	 		</h2>
			              	 	 		<form action="summ" method="post">
			              	 	 			<span
			              	 	 				style="float: right;margin-top: 0;">
			              	 	 				<input type="hidden" name="name" value="${anime.name}">
			              	 	 				<input type="submit" name="upd" class="up1" value="Update Summary">
			              	 	 			</span>
			              	 	 		</form>
			              	 	 		<br>
			              	 	 		<p style="text-align: initial;" class = "p1">
			              	 	 			<c:out value="${anime.summary}" />
			              	 	 		</p>
			              	 	 		<br>
			              	 	 		<br>
			              	 	 		<br>
			              	 	 		<h2 style="margin-top: 0;padding-top:10px; font-style:italic;text-decoration: underline;color:white;">
			              	 	 			My Notes
			              	 	 		</h2>
			              	 </div>
				             <form action="notes" method="get">
				             	<span style="float: right;margin-right: 28px;margin-top: 0;">
									<input type="hidden" name="name" value="${anime.name}" >
									<input type="submit" name="upd" class="up1" value="Update Notes">
				           	 	</span>
			           	 	 </form>
							 <br>
							<div  class = "paragraphmargin ">
								<p style="text-align: initial;" class = "p1">
									<c:out value="${anime.notes}" />
								</p>
							</div>
						</div>
	         		</div>
		</div>
	              	 
<script>
<%@ include file="js/searchTrigger.js"  %>
</script>	      
<script>

window.setTimeout(hide,8000);

function hide(){
	 document.getElementById("pop").style.visibility ="hidden";
}

console.log("hey")

</script>	      

</body>
</html>