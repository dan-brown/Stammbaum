var infobox;
var content;

var edit_forename;
var edit_surname;
var edit_sex;
var edit_birth_date;
var edit_death_date;

var shown;
var pid;
var xml;
var persons;

window.onload = function(){ init();}

function init(){
    infobox = document.getElementById("infobox");
    content = document.getElementById("infobox_content");

    edit_forename   = document.getElementById("edit_forename");
    edit_surname    = document.getElementById("edit_surname");
    edit_sex        = document.getElementById("edit_sex");
    edit_birth_date = document.getElementById("edit_birth_date");
    edit_death_date = document.getElementById("edit_death_date");

    clickedBackground();

    document.getElementById("infobox_background").addEventListener("click", clickedBackground);

    var members = document.getElementsByClassName("member");
    for (i = 0; i < members.length; i++) {
        members.item(i).addEventListener("click", clickedActivator);
    }
    var inlaws = document.getElementsByClassName("inlaw");
    for (i = 0; i < inlaws.length; i++) {
        inlaws.item(i).addEventListener("click", clickedActivator);
    }

    var editables = document.getElementsByClassName("editable");
    for (i = 0; i < editables.length; i++) {
        editables.item(i).addEventListener("dbclick", dbclickedEditable);
    }

    var request = new XMLHttpRequest();
    request.overrideMimeType("text/xml");
    request.open("GET", "familytree.xml");
    request.overrideMimeType('text/xml');
    request.onreadystatechange = function() {
        if (request.readyState!=4) return;
        xml = new DOMParser().parseFromString(request.responseText, "text/xml");
        persons = xml.get
    };
    request.send();
}

function clickedBackground(){
    infobox.style.display = "none";
    shown = false;
}

function clickedActivator(){
    if(this.tagName != "inlaw" && shown) return;
    shown = true;
    pid = this.getAttribute("data-pid");
    updateInfoBox();
    infobox.style.display = "block";
    console.log(this);
}

function updateInfoBox(){
    var persons = xml.getElementsByTagName("person");
    var person;

    for(var i = 0; i < persons.length && person === undefined; i++)
        if(persons.item(i).getAttribute("pid") == pid) person = persons.item(i);

    var inlaws = xml.getElementsByTagName("inlaw");
    for(var i = 0; i < inlaws.length && person === undefined; i++)
        if(inlaws.item(i).getAttribute("pid") == pid) person = inlaws.item(i);

    edit_forename.innerHTML = person.getAttribute("forename");
    edit_surname.innerHTML = person.getAttribute("surname");
    edit_sex.innerHTML = person.getAttribute("sex");
    edit_birth_date.innerHTML = person.getAttribute("birth_date");
    edit_death_date.innerHTML = person.getAttribute("death_date");
}

function dbclickedEditable(){
    this.tagName = "button";
    console.log("dbclicked");
    console.log(this.tagName);
}