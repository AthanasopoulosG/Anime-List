<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Anime</title>
<style >
<%@include file="css/TxtUpdate.css"%>
</style>
</head>
<body style="align:center;">

<div class="header">My Anime List</div>
	
	<img src="/docs/images/anime/<c:out value="${image}" />"  />

	<div class = "name">
		Update <c:out value="${ty }" /> for "<c:out value="${name }" />"
	</div>
	
	<div class = "text_container">
		<textarea id="myta" >
			
		</textarea>
	</div>

	<div  class = "buttons">
		<form action="Save_text_Display" method="post">
			<input type="hidden" name="name" value="<c:out value='${name }' />">
			<input type="hidden" id="txt" name="text" value="" >
			<input type="hidden" name="type" value="<c:out value='${ty }' />" >
			<input type="submit" id = "save" value="Update" onclick="saved()" >
		</form>
		
		<form action="Cancel" method="post">
			<input type="hidden" name="name" value="<c:out value='${name }' />">
			<input type="hidden" name="text" value="" id="txt">
			<input type="submit" value="Cancel" id = "cancel">
		</form>
	</div>

<script>
	
	function saved(){
		var v =document.getElementById("myta").value;
		var t= document.getElementById("txt");
		var ntext = v.replace(/\n/g, "/n ");
		t.setAttribute("value",ntext);
		
		console.log(v);
		console.log(ntext);
	}
	
</script>		

<script>
	
window.addEventListener("load", inittxt,"true");

function inittxt () {
	document.getElementById("myta").value = "";
	var text = "${content}";
	var ntx = text.replaceAll("/n", "\n");
	document.getElementById("myta").value = ntx;
	//console.log(${content});
	
}
	
</script>			
</body>
</html>