$(document).ready(init);

function init(){
    $('#infobox').hide();
    $('.member').each(initActivator);
    $('#infobox_background').click(hideInfoBox);
}

function initActivator(){
    $(this).click(showInfoBox);
}

function hideInfoBox(){
    $("#infobox").hide();
}

function showInfoBox(){
    $("#infobox").show();
}