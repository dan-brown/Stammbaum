var inputs;
var displays;
var displayForename;
var displaySurname;
var displaySex;
var displayBirthDate;
var displayDeathDate;

function init() {
    //toggle input/label
    displays = document.getElementsByClassName("infoDisplay");
    for(var i = 0; i < displays.length; i++)
            displays.item(i).addEventListener("dblclick", function(){showInput(i)});

    inputs = document.getElementsByClassName("infoInput");
    for(var i = 0; i < inputs.length; i++) {
            inputs.item(i).addEventListener("blur", function(){hideInput(i)});
            inputs.item(i).blur();
    }

    //upload
    var inputFile = $("#input-file");
    inputFile.change(fileChanged);
    inputFile.hide();

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


function uploadClicked() {
    $("#input-file").trigger("click");
}

function fileChanged() {
    if (this.files.length > 1) {
        alert("Bitte nur eine Datei auswählen!");
        return;
    }

    var file = this.files[0];
    if (!file) return;

    var reader = new FileReader();
    reader.onload = function (e) {
        xml = $.parseXML(e.target.result);
        updateAllXMLMembers();
        updateAllHTMLMembers();
    };
    reader.onerror = function () {
        alert("Keine gültige XML-Datei!");
    };
    reader.readAsText(file, "UTF-8");
}

function updateAllHTMLMembers() {
    for (var i = 0; i < xmlPersons.length + xmInlaws.length; i++) {
        var xmlMember = ( i < xmlPersons.length ) ? xmlPersons.item(i) : xmInlaws.item(i - xmlPersons.length);
        var pid = xmlMember.getAttribute("pid");
        var htmlMember = $("#" + pid);
        var htmlChildren = htmlMember.childNodes;
        for (var j = 0, child; child = htmlChildren.item(j); j++) {
            if (child.classList.contains("display-forename")) child.innerHTML = xmlMember.getAttribute("forename");
            if (child.classList.contains("display-surname")) child.innerHTML = xmlMember.getAttribute("surname");
        }
    }
    currentHTMLMember = undefined;
}