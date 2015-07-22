// JavaScript Document


function IFrameResize(){   
  var obj = parent.document.getElementById("childFrame");  //取得父页面IFrame对象  
  obj.style.height = this.document.body.scrollHeight+"px";  //调整父页面中IFrame的高度为此页面的高度
 }  
 
 
 
 var login1=parent.document.getElementById("login1");
 var login=parent.document.getElementById("login");
 var over=parent.document.getElementById("over"); 
     function show1()
     {
        login1.style.display = "block";
        over.style.display = "block";
     }
     function hide1()
   {
        login1.style.display = "none";
        over.style.display = "none";
    }
     function show()
     {
        login.style.display = "block";
        over.style.display = "block";
     }
     function hide()
   {
        login.style.display = "none";
        over.style.display = "none";
    }