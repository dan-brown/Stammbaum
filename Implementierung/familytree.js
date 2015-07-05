// XML Objects
var xml;
var persons;
var inlaws;
var person;
var person_backup;

var request;


//Global settings
var shown;


$(window).load(init);
function init(){
    request = new XMLHttpRequest();
    request.onreadystatechange = request_onreadystatechange;
    updateXML();

    $(document).keydown(function(e){if (shown && e.keyCode == 27) cancelInfobox();});
    $("#infobox_submit").click(submit);
    $("#infobox_background").click(cancelInfobox);
    $("#infobox_cancel").click(cancelInfobox);
    closeInfobox();

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

function cancelInfobox() {
    $(person).attr("forename", $(person_backup).attr("forename"))
    $(person).attr("surname", $(person_backup).attr("surname"))
    $(person).attr("sex", $(person_backup).attr("sex"))
    $(person).attr("birth_date", $(person_backup).attr("birth_date"))
    $(person).attr("death_date", $(person_backup).attr("death_date"))
    closeInfobox();
}

function closeInfobox(){
    shown = false;
    $("#infobox").hide();
    $(".info_input").removeClass("invalid");
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
        var person_i = ( i < persons.length ) ? persons.item(i) : inlaws.item(i-persons.length);
        if($(person_i).attr("pid") === pid) {
            person = person_i;
            person_backup = person_i;
            break;
        }
    }
}

function updateInfobox(){
    $("#input_forename").val($(person).attr("forename"));
    $("#input_surname").val($(person).attr("surname"));
    if($(person).attr("sex") === "M") $("#input_sex_male").prop("checked","checked");
    else $("#input_sex_female").prop("checked","checked");
    $("#input_birth_date").val(toLocaleDateString($(person).attr("birth_date")));
    $("#input_death_date").val(toLocaleDateString($(person).attr("death_date")));
}

function toLocaleDateString(iso_text){
    if(iso_text === "") return iso_text;
    else return new Date(iso_text).toLocaleDateString();
}


function submit(){
    var forename    = $("#input_forename").val();
    var surname     = $("#input_surname").val();
    var sex         = $("#input_sex_male").prop("checked") ? "M" : "F";
    var birth_date  = $("#input_birth_date").val();
    var death_date  = $("#input_death_date").val();

    if (!validate(forename, birth_date, death_date)){
        person = person_backup;
        return;
    }

    $(person).attr("forename", forename);
    $(person).attr("surname", surname);
    $(person).attr("sex", sex);
    $(person).attr("birth_date", birth_date);
    $(person).attr("death_date", death_date);
}

function validate(forename, birth_date, death_date){
    var valid = true;
    if(forename === ""){
        $(input_forename).addClass("invalid");
        valid = false;
    }
    if(!validateDate(birth_date)){
        $("#input_birth_date").addClass("invalid");
        valid = false;
    }
    if(!validateDate(death_date)){
        $(input_birth_date).addClass("invalid");
        valid = false;
    }
    return valid;
}

function validateDate(locale_text) {
    if(locale_text === "") return true;

    var comps = locale_text.split(".");
    var d = parseInt(comps[0], 10);
    var m = parseInt(comps[1], 10);
    var y = parseInt(comps[2], 10);

    var date = new Date(y, m - 1, d);

    return date.getFullYear() == y && date.getMonth() + 1 == m && date.getDate() == d;
}
