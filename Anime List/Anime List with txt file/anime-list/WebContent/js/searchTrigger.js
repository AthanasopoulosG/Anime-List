/**
 * 
 */

const btn = document.getElementById("bt1");
const form = document.getElementById("searchform");
function triggerbt() {
	let text = document.getElementById("se").value;
	if ( !(text.localeCompare("") == 0) ){
		form.submit();
	}
}

btn.addEventListener("click" , triggerbt);
	
	


