<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:key name="inlaw-by-pid" match="inlaw" use="@pid"/>
    <xsl:template match="/familytree">
        <html>
            <head>
                <title>Stammbaum</title>
                <link type="text/css" rel="stylesheet" href="inc/main.css"/>
                <link type="text/css" rel="stylesheet" href="inc/familytree.css"/>
                <link type="text/css" rel="stylesheet" href="inc/infobox.css"/>
                <link type="image/png" rel="icon" href="media/img/favicon.png"/>
                <script src="inc/jquery.js"/>
                <script src="inc/filesaver.js"/>
                <script src="inc/familytree.js"/>
            </head>
            <body>
                <!-- infobox -->
                <div id="infobox">
                    <div id="infobox-content">
                        <form>
                            <fieldset>
                                <legend>Personeninformation</legend>
                                <div class="input-line">
                                    <label class="input-label" for="input-forename">Vorname:</label>
                                    <input id="input-forename" type="text" class="infobox-input" placeholder="Vorname"/>
                                    <br/>
                                </div>
                                <div class="infobox-input-group">
                                    <label class="input-label" for="input-surname">Nachname:</label>
                                    <input id="input-surname" class="infoInput" type="text" placeholder="Nachname"/>
                                    <br/>
                                </div>
                                <div class="infobox-input-group">
                                    <label class="infobox-input-label">Geschlecht:</label>
                                    <span class="infobox-input">
                                        <input id="input-sex-male" name="sex" type="radio"/>
                                        <label for="input-sex-male">männl.</label>
                                        <input id="input-sex-female" name="sex" type="radio"/>
                                        <label for="input-sex-female">weibl.</label>
                                    </span>
                                    <br/>
                                </div>
                                <div class="input-group">
                                    <label class="infobox-input-label" for="input-birth-date">Geburtstag:</label>
                                    <input id="input-birth-date" type="text" class="infobox-input"
                                           placeholder="T.M.JJJJ"/>
                                    <br/>
                                </div>
                                <div class="infobox-input-group">
                                    <label class="infobox-input-label " for="input-death-date">Todestag:</label>
                                    <input id="input-death-date" type="text" class="infobox-input"
                                           placeholder="T.M.JJJJ"/>
                                    <br/>
                                </div>
                                <input id="infobox-cancel" class="infobox-button" type="button" value="Abbrechen"/>
                                <input id="infobox-submit" class="infobox-button" type="button" value="Speichern"/>
                            </fieldset>
                        </form>
                    </div>
                    <div id="infobox-background"/>
                </div>


                <div id="body-div">

                    <!-- Header -->
                    <header>
                        <a id="logo-link" href="intro.html">
                            <img id="logoSmall" src="media/img/familytree_small.png" width="200"
                                 alt="das Logo mit einem Baum und einer kleinen Familie"/>
                        </a>
                    </header>

                    <!-- Navigation bar -->
                    <nav>
                        <ul id="menu">
                            <li class="menu-item">
                                <a class="menu-link" href="index.html">Home</a>
                            </li>
                            <li class="menu-item">
                                <a id="menu-link-current" href="#">Der Stammbaum</a>
                            </li>
                            <li class="menu-item">
                                <a class="menu-link" href="impressum.html">Impressum</a>
                            </li>
                        </ul>
                    </nav>

                    <!-- Main content -->
                    <main>
                        <h1>Stammbaum</h1>

                        <!-- Familytree -->
                        <div id="family-tree">
                            <xsl:call-template name="tree">
                                <xsl:with-param name="xpath" select="/familytree"/>
                            </xsl:call-template>
                        </div>

                        <!-- File -->
                        <div id="input-output">
                            <span id="upload-button" class="io-button">Upload</span>
                            <input id="input-file" type="file" accept=".fam"/>
                            <span id="download-button" class="io-button">Download</span>
                        </div>
                    </main>
                    <footer>&#169; 2015 Daniel Brown, Micha Piertzik</footer>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="tree">
        <xsl:param name="xpath"/>
        <ul class="family">
            <xsl:for-each select="$xpath/child::person">
                <li class="family-member">
                    <xsl:call-template name="display-person"/>
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

    <xsl:template name="display-person">
        <div class="member">
            <xsl:attribute name="data-pid">
                <xsl:value-of select="@pid"/>
            </xsl:attribute>
            <xsl:call-template name="display-information">
                <xsl:with-param name="xpath" select="."/>
            </xsl:call-template>
            <xsl:if test="child::inlaw">
                <img src="media/img/rings.jpg" width="20" alt="engaged"/>
                <span class="inlaw">
                    <xsl:attribute name="data-pid">
                        <xsl:value-of select="child::inlaw/@pid"/>
                    </xsl:attribute>
                    <xsl:call-template name="display-information">
                        <xsl:with-param name="xpath" select="child::inlaw"/>
                    </xsl:call-template>
                </span>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="display-information">
        <xsl:param name="xpath"/>
        <xsl:if test="$xpath/@death-date != ''">
            <img class="cross" src="media/img/cross.jpg" width="16" alt="died"/>
        </xsl:if>
        <span class="space display-forename">
            <xsl:value-of select="$xpath/@forename"/>
        </span>
        <span class="space display-surname">
            <xsl:value-of select="$xpath/@surname"/>
        </span>
    </xsl:template>

</xsl:stylesheet>
