$(window).load(init);
function init(){
    request = new XMLHttpRequest();
    request.onreadystatechange = requestOnReadyStateChange;
    updateXML();

    $(document).keydown(function(e){if (shown && e.keyCode == 27) cancelInfobox();});
    $("#infoboxSubmit").click(submit);
    $("#infoboxBackground").click(cancelInfobox);
    $("#infoboxCancel").click(cancelInfobox);
    closeInfobox();

    $(".member").click(showInfobox);
    $(".inlaw").click(showInfobox);
}

function updateXML(){
    request.open("GET", "familytree.xml");
    request.send();
}
function requestOnReadyStateChange() {
    if (request.readyState!=4) return;
    xml = request.responseXML;
    persons = xml.getElementsByTagName("person");
    inlaws = xml.getElementsByTagName("inlaw");
}

function cancelInfobox() {
    person.setAttribute("forename", personBackup.getAttribute("forename"));
    person.setAttribute("surname", personBackup.getAttribute("surname"));
    person.setAttribute("sex", personBackup.getAttribute("sex"));
    person.setAttribute("birthDate", personBackup.getAttribute("birthDate"));
    person.setAttribute("deathDate", personBackup.getAttribute("deathDate"));
    closeInfobox();
}

function closeInfobox(){
    shown = false;
    $("#infobox").hide();
    $(".infoInput").removeClass("invalidInput");
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
        var personI = ( i < persons.length ) ? persons.item(i) : inlaws.item(i-persons.length);
        if(personI.getAttribute("pid") === pid) {//############HIER ENTSTEHT DER "nicht wohlgeformt"-FEHLER########
            person = personI;
            personBackup = person.cloneNode(false);
            return;
        }
    }
}

function updateInfobox(){
    $("#inputForename").val(person.getAttribute("forename"));
    $("#inputSurname").val(person.getAttribute("surname"));
    if(person.getAttribute("sex") === "M") $("#inputSexMale").prop("checked","checked");
    else $("#inputSexFemale").prop("checked","checked");
    $("#inputBirthDate").val(toLocaleDateString(person.getAttribute("birthDate")));
    $("#inputDeathDate").val(toLocaleDateString(person.getAttribute("deathDate")));
}

function toLocaleDateString(isoText){
    if(isoText === "") return isoText;
    else return new Date(isoText).toLocaleDateString();
}

function toIsoDateString(localeText) {
    if(localeText === "") return localeText;

    var comps = localeText.split(".");
    var d = parseInt(comps[0], 10);
    var m = parseInt(comps[1], 10);
    var y = parseInt(comps[2], 10);

    return new Date(y,m-1,d).toISOString();
}

function submit(){
    var forename = $("#inputForename").val();
    var surname = $("#inputSurname").val();
    var sex = $("#inputSexMale").prop("checked") ? "M" : "F";
    var birthDate = $("#inputBirthDate").val();
    var deathDate = $("#inputDeathDate").val();

    if (!validate(forename, birthDate, deathDate)) return;

    person.setAttribute("forename", forename);
    person.setAttribute("surname", surname);
    person.setAttribute("sex", sex);
    person.setAttribute("birthDate", toIsoDateString(birthDate));
    person.setAttribute("deathDate", toIsoDateString(deathDate));

    updateInfobox();
    closeInfobox();
    xml.save("test.xml");
}

function validate(forename, birthDate, deathDate){
    var valid = true;
    if(forename === ""){
        $("#inputForename").addClass("invalidInput");
        valid = false;
    }
    if(!validateDate(birthDate)){
        $("#inputBirthDate").addClass("invalidInput");
        valid = false;
    }
    if(!validateDate(deathDate)){
        $("#inputDeathDate").addClass("invalidInput");
        valid = false;
    }
    return valid;
}

function validateDate(localeText) {
    if(localeText === "") return true;

    var comps = localeText.split(".");
    var d = parseInt(comps[0], 10);
    var m = parseInt(comps[1], 10);
    var y = parseInt(comps[2], 10);

    var date = new Date(y, m - 1, d);

    return date.getFullYear() == y && date.getMonth() + 1 == m && date.getDate() == d;
}
