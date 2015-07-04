// XML Objects
var xml;
var persons;
var inlaws;
var request;

// HTML elements
var infobox;

var input_forename;
var input_surname;
var input_sex_male;
var input_sex_female;
var input_birth_date;
var input_death_date;


//Global settings
var shown;
var pid;


window.onload = function(){ init();}

function dostuff(e){
    console.log(e.toString);
}

function init(){
    request = new XMLHttpRequest();
    request.onreadystatechange = request_onreadystatechange;
    updateXML();

    infobox = document.getElementById("infobox");

    document.getElementById("infobox_background").addEventListener("click", clickedBackground);
    clickedBackground();

    input_forename = document.getElementById("input_forename");
    input_surname = document.getElementById("input_surname");
    input_sex_male = document.getElementById("input_sex_male");
    input_sex_female = document.getElementById("input_sex_female");
    input_birth_date = document.getElementById("input_birth_date");
    input_death_date = document.getElementById("input_death_date");

    var members = document.getElementsByClassName("member");
    for (i = 0; i < members.length; i++)
        members.item(i).addEventListener("click", clickedActivator);

    var inlaws = document.getElementsByClassName("inlaw");
    for (i = 0; i < inlaws.length; i++)
        inlaws.item(i).addEventListener("click", clickedActivator);

}

function request_onreadystatechange() {
    if (request.readyState!=4) return;
    if (request.status != 200) {
        alert("Fehler bei der Verbindung zum Server!");
        return;
    }
    xml = new DOMParser().parseFromString(request.responseText, "text/xml");
    persons = xml.getElementsByTagName("person");
    inlaws = xml.getElementsByTagName("inlaw");
}

function updateXML(){
    request.open("GET", "familytree.xml");
    request.send();
}

function clickedBackground(){
    infobox.style.display = "none";
    shown = false;
}

function clickedActivator(){
    if(shown) return;
    shown = true;
    pid = this.getAttribute("data-pid");
    updateInfoBox();
    infobox.style.display = "block";
}

function updateInfoBox(){
    var selectedPerson = findMemberByPID();
    var sex = selectedPerson.getAttribute("sex");
    var birth_date = selectedPerson.getAttribute("birth_date");
    var death_date = selectedPerson.getAttribute("death_date");

    input_forename.value = selectedPerson.getAttribute("forename");
    input_surname.value = selectedPerson.getAttribute("surname");
    if(sex == "M")  input_sex_male.checked = true;
    else            input_sex_female.checked = true;
    input_birth_date.value = (birth_date != null) ? toLocaleDateString(birth_date) : "";
    input_death_date.value = (death_date != null) ? toLocaleDateString(death_date) : "";
}

function findMemberByPID() {
    for ( var i = 0; i < persons.length + inlaws.length; i++ ) {
        var possiblePerson = ( i < persons.length ) ? persons.item(i) : inlaws.item(i-persons.length);
        if(possiblePerson.getAttribute("pid") == pid)
            return possiblePerson;
    }
}

function toLocaleDateString(date){
    return new Date(date).toLocaleDateString();
}

function checkDates(){

}

/* nice to have
var inputs;
var displays;
var display__forename;
var display__surname;
var display__sex;
var display__birth_date;
var display__death_date;


zu init(): {
    displays = document.getElementsByClassName("info_display");
    for(var i = 0; i < displays.length; i++)
            displays.item(i).addEventListener("dblclick", function(){showInput(i)});

    inputs = document.getElementsByClassName("info_input");
    for(var i = 0; i < inputs.length; i++) {
            inputs.item(i).addEventListener("blur", function(){hideInput(i)});
            inputs.item(i).blur();
    }
}

function showInput(i){
    inputs.item(i).style.display = "initial";
    displays.item(i).item(i).style.display = "none";
    if(inputs.item(i).type == "text") inputs.item(i).select();
}

function hideInput(i){
    inputs.item(i).style.display = "none";
    displays.item(i).style.display = "initial";
}
*/