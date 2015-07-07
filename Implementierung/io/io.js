$(window).load(init);

function dateiauswahl(evt) {
    alert("HI");
    console.log("auswahl");
    var files = evt.target.files;
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
        output.push('<li><strong>', f.name, '</strong> (', f.type || 'n/a', ') - ', f.size, ' bytes</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
}

function init(){
    $("#file").change(dateiauswahl, false);
    $("#file").abort(say, false);
    console.log("inited");
}

function say(evt){
    alert("abvort");
}
