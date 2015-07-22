// JavaScript Document
 
function tab_item(n)
{
		var menu = document.getElementById("menu");
		var menuli = menu.getElementsByTagName("li");
		for(var i = 0; i< menuli.length; i++)
		{
			menuli[i].className="";
			menuli[n].className="hit";
			document.getElementById("tab"+ i).style.display = "none";
			document.getElementById("tab"+ n).style.display = "block";
		}
} 


function show(id)
{
 document.getElementById(id).style.display="block";	
}

function hid(id)
{
 document.getElementById(id).style.display="none";	
}


$('#a_file').on('click', function(e) {
e.preventDefault();
$(this).closest('input[type=file]').trigger('click');
}) 