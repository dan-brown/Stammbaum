// XML Objects
var xml;
var persons;
var inlaws;
var person;

var request;


//Global settings
var shown;


$(window).load(init);
function init(){
    request = new XMLHttpRequest();
    request.onreadystatechange = request_onreadystatechange;
    updateXML();

    $(document).keydown(function(e){if (shown && e.keyCode == 27) hideInfobox();});
    $("#infobox_submit").click(submit);
    $("#infobox_background").click(hideInfobox);
    $("#infobox_cancel").click(hideInfobox);
    hideInfobox();

    $(".member").click(showInfobox);
    $(".inlaw").click(showInfobox);
}


function updateXML(){
    request.open("GET", "familytree.xml");
    request.send();
}
function request_onreadystatechange() {
    if (request.readyState!=4) return;
    if (request.status != 200) {
        alert("Fehler bei der Verbindung zum Server!");
        return;
    }
    xml = request.responseXML;
    persons = xml.getElementsByTagName("person");
    inlaws = xml.getElementsByTagName("inlaw");
}

function hideInfobox(){
    shown = false;
    $("#infobox").hide();
}

function showInfobox(){
    if(shown) return;
    shown = true;
    var pid = $(this).attr("data-pid");
    updatePerson(pid);
    updateInfobox();
    $("#infobox").show();
}

function updatePerson(pid) {
    for ( var i = 0; i < persons.length + inlaws.length; i++ ) {
        var cur = ( i < persons.length ) ? persons.item(i) : inlaws.item(i-persons.length);
        if($(cur).attr("pid") == pid) {
            person = cur;
            break;
        }
    }
}

function updateInfobox(){
    $("#input_forename").value = $(person).attr("forename");
    $("#input_surname").value = $(person).attr("surname");
    if($(person).attr("sex") === "M") $("#input_sex_male").checked = true;
    else $("#input_sex_female").checked = true;
    $("#input_birth_date").value = toLocaleDateString($(person).attr("birth_date"));
    $("#input_death_date").value = toLocaleDateString($(person).attr("death_date"));
}

function toLocaleDateString(iso_text){
    if(iso_text === "") return iso_text;
    else return new Date(iso_text).toLocaleDateString();
}


function submit(){
    var forename    = $("#input_forename").value;
    var surname     = $("input_surname").value;
    var sex         = $("#input_sex_male").checked ? "M" : "F";
    var birth_date  = $("#input_birth_date").value;
    var death_date  = $("#input_death_date").value;

    if (!validate(forename, birth_date, death_date)) return;

    $(person).attr("forename", forename);
    $(person).attr("surname", surname);
    $(person).attr("sex", sex);
    $(person).attr("birth_date", birth_date);
    $(person).attr("death_date", death_date);

    saveXML();
}

function validate(forename, birth_date, death_date){
    var valid = true;
    if(forename === ""){
        $(input_forename).addClass("invalid");
        valid = false;
        console.log("invalid: empty forename");
    }
    console.log("bd");
    if(!validateDate(birth_date)){
        $("#input_birth_date").addClass("invalid");
        valid = false;
        console.log("invalid birth_date: "+birth_date);
    }
    if(!validateDate(death_date)){
        $(input_birth_date).addClass("invalid");
        valid = false;
        console.log("invalid death_date: "+death_date);
    }
    console.log(valid);
    return valid;
}

function validateDate(locale_text) {
    if(locale_text === "") return true;
    console.log(locale_text);

    var comps = locale_text.split(".");
    var d = parseInt(comps[0], 10);
    var m = parseInt(comps[1], 10);
    var y = parseInt(comps[2], 10);
    console.log("d: " + d + ", m: " + m + ", y: " + y);

    var date = new Date(y, m - 1, d);
    console.log("date.y:"+date.getFullYear()+" | txt:"+y);
    console.log("date.m: "+date.getMonth()+" | txt:"+m);
    console.log("date.d: "+date.getDate()+" | txt:"+d);

    return date.getFullYear() == y && date.getMonth() + 1 == m && date.getDate() == d;
}
