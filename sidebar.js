let sidebar = document.getElementById("sidebar");
console.log(sidebar);

sidebar.onmouseover = function(){
	sidebar.style.left = "-10px";
};

sidebar.onmouseout = function(){
	sidebar.style.left = "-330px";
};
