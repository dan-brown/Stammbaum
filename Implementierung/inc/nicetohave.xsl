<div>
    <!--Toggle input/label -->
    <fieldset>
        <legend>Personeninformation</legend>

        <label for="inputForename">Vorname:</label>
        <input id="inputForename" type="tex" class="infoInput"/>
        <span id="labelForename" class="infoDisplay"/>
        <br/>

        <label for="">Nachname:</label>
        <input id="inputSurname" type="tex" class="infoInput"/>
        <span id="labelSurname" class="infoDisplay"/>
        <br/>

        <label for="inputSex">Geschlecht:</label>
        <span id="inputSex" class="infoInput">
            <input id="radioMale" name="sex" type="radio"/>
            <input id="radioFemale" name="sex" type="radio"/>
        </span>
        <span id="labelSex" class="infoDisplay"/>
        <br/>

        <label for="inputBirthdate">Geburtstag:</label>
        <input id="inputBirthdate" type="date" class="infoInput"/>
        <span id="labelBirthdate" class="infoDisplay"/>
        <br/>

        <label for="inputDeathdate">Todestag:</label>
        <input id="inputDeathdate" type="date" class="infoInput"/>
        <span id="labelDeathdate" class="infoDisplay"/>
    </fieldset>

    <!--File Upload -->
    <span id="upload-button" class="io-button">Upload</span>
    <input id="input-file" type="file" accept=".fam"/>
</div>