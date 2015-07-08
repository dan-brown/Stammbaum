<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:key name="inlawByPid" match="inlaw" use="@pid"/>
    <xsl:template match="/familytree">
        <html>
            <head>
                <title>Stammbaum</title>
                <link type="text/css" rel="stylesheet" href="familytree.css"/>
                <link type="text/css" rel="stylesheet" href="tree.css"/>
                <link type="text/css" rel="stylesheet" href="infobox.css"/>
                <link rel="icon" type="image/png" href="media/img/favicon.png"/>
                <script src="jquery.js"/>
                <script src="filesaver.js"/>
                <script src="familytree.js"/>
            </head>
            <body>
                <div id="infobox">
                    <div id="infoboxContent">
                        <form>
                            <fieldset>
                                <legend>Personeninformation</legend>
                                <div class="inputLine">
                                    <label class="inputLabel" for="inputForename">Vorname:</label>
                                    <input id="inputForename" type="text" class="infoInput" placeholder="Vorname"/>
                                    <br/>
                                </div>
                                <div class="inputLine">
                                    <label class="inputLabel" for="inputSurname">Nachname:</label>
                                    <input id="inputSurname" class="infoInput" type="text" placeholder="Nachname"/>
                                    <br/>
                                </div>
                                <div class="inputLine">
                                    <label class="inputLabel">Geschlecht:</label>
                                    <span class="infoInput">
                                        <input id="inputSexMale" name="sex" type="radio"/>
                                        <label class="inputSexLabel" for="inputSexMale">männl.</label>
                                        <input id="inputSexFemale" name="sex" type="radio"/>
                                        <label class="inputSexLabel" for="inputSexFemale">weibl.</label>
                                    </span>
                                    <br/>
                                </div>
                                <div class="inputLine">
                                    <label class="inputLabel" for="inputBirthDate">Geburtstag:</label>
                                    <input id="inputBirthDate" type="text" class="infoInput" placeholder="T.M.JJJJ"/>
                                    <br/>
                                </div>
                                <div class="inputLine">

                                    <label class="inputLabel " for="inputDeathDate">Todestag:</label>
                                    <input id="inputDeathDate" type="text" class="infoInput" placeholder="T.M.JJJJ"/>
                                    <br/>
                                </div>
                                <input id="infoboxCancel" class="formButton" type="button" value="Abbrechen"/>
                                <input id="infoboxSubmit" class="formButton" type="button" value="Speichern"/>
                            </fieldset>
                        </form>
                    </div>
                    <div id="infoboxBackground"/>
                </div>

                <div id="bodydiv">

                    <!-- Header -->
                    <header>
                        <a href="index.html">
                            <img id="logoSmall" src="media/img/FamilytreeSmall.png" width="200"
                                 alt="das Logo mit einem Baum und einer kleinen Familie"/>
                        </a>
                    </header>

                    <!-- Navbar -->
                    <nav>
                        <ul id="menu">
                            <li class="menuItem">
                                <a class="menuLink" href="home.html">Home</a>
                            </li>
                            <li class="menuItem">
                                <a id="menuLinkSelected" href="familytree.xml">Der Stammbaum</a>
                            </li>
                            <li class="menuItem">
                                <a class="menuLink" href="imprint.html">Impressum</a>
                            </li>
                        </ul>
                    </nav>

                    <!-- Main content -->
                    <main>
                        <!-- Familytree -->
                        <h1>Stammbaum</h1>
                            <xsl:call-template name="tree">
                                <xsl:with-param name="xpath" select="/familytree"/>
                            </xsl:call-template>
                    </main>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="tree">
        <xsl:param name="xpath"/>
        <ul class="familytree">
            <xsl:for-each select="$xpath/child::person">
                <li class="familymember">
                    <xsl:call-template name="displayPerson"/>
                    <!-- recursive select -->
                    <xsl:if test="child::person">
                        <xsl:call-template name="tree">
                            <xsl:with-param name="xpath" select="self::person"/>
                        </xsl:call-template>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>

    </xsl:template>

    <xsl:template name="displayPerson">
        <div class="member">
            <xsl:attribute name="data-pid">
                <xsl:value-of select="@pid"/>
            </xsl:attribute>
            <xsl:call-template name="displayInformation">
                <xsl:with-param name="xpath" select="."/>
            </xsl:call-template>
            <xsl:if test="child::inlaw">
                <span class="inlaw">
                    <xsl:attribute name="data-pid">
                        <xsl:value-of select="child::inlaw/@pid"/>
                    </xsl:attribute>
                    <xsl:call-template name="displayInformation">
                        <xsl:with-param name="xpath" select="child::inlaw"/>
                    </xsl:call-template>
                </span>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="displayInformation">
        <xsl:param name="xpath"/>
        <span class="space">
            <xsl:value-of select="$xpath/@forename"/>
        </span>
        <span class="space">
            <xsl:value-of select="$xpath/@surname"/>
        </span>
        <span class="space">(<xsl:value-of select="$xpath/@sex"/>)</span>
        <br/>
        <span class="space">
            <xsl:value-of select="$xpath/@birthDate"/>
        </span>
        <span class="space">
            <xsl:value-of select="$xpath/@deathDate"/>
        </span>

    </xsl:template>

</xsl:stylesheet>
