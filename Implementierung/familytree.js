var infobox;
var content;
var pid;
var xml;
window.onload = function(){ init();}

function init(){
    var request = new XMLHttpRequest();
    request.open("GET", "familytree.xml");
    request.onreadystatechange = requestSent(request);

    infobox = document.getElementById("infobox");
    content = document.getElementById("infobox_content");

    hideInfoBox();
    var activators = document.getElementsByClassName("member");
    for (i = 0; i < activators.length; i++) {
        activators[i].addEventListener("click", activateInfoBox);
    }
    document.getElementById("infobox_background").addEventListener("click", hideInfoBox);
}

function hideInfoBox(){
    infobox.style.display = "none";
}

function activateInfoBox(){
    pid = this.getAttribute("data-pid");
    content.innerHTML = pid;
    infobox.style.display = "block";
}

function requestSent(){
    var response = this.responseText;
    xml = new DOMParser().parseFromString(response, "text/xml");
    console.log(xml);
}

