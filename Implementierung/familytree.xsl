<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:key name="inlaw_by_pid" match="inlaw" use="@pid"/>
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
                    <div id="infobox_content">
                        <form>
                            <fieldset>
                                <legend>Personeninformation</legend>

                                <label class="form_label" for="input_forename">Vorname:</label>
                                <input id="input_forename" type="tex" class="info_input" placeholder="Vorname"/>
                                <br/>

                                <label class="form_label" for="input_surname">Nachname:</label>
                                <input id="input_surname" type="tex" class="info_input" placeholder="Nachname"/>
                                <br/>

                                <label class="form_label">Geschlecht:</label>
                                <span class="info_input">
                                    <input id="input_sex_male" name="sex" type="radio"/>
                                    <label class="input_sex_label" for="input_sex_male">männl.</label>
                                    <input id="input_sex_female" name="sex" type="radio"/>
                                    <label class="input_sex_label" for="input_sex_female">weibl.</label>
                                </span>
                                <br/>

                                <label class="form_label" for="input_birth_date">Geburtstag:</label>
                                <input id="input_birth_date" type="text" class="info_input" placeholder="T.M.JJJJ"/>
                                <br/>

                                <label class="form_label " for="input_death_date">Todestag:</label>
                                <input id="input_death_date" type="text" class="info_input" placeholder="T.M.JJJJ"/>
                                <br/>

                                <input id="infobox_cancel" class="form_button" type="button" value="Abbrechen"/>
                                <input id="infobox_submit" class="form_button" type="button" value="Speichern"/>
                            </fieldset>
                        </form>
                    </div>
                    <div id="infobox_background"/>
                </div>

                <div id="bodydiv">

                    <!-- Header -->
                    <header>
                        <a href="index.html">
                            <img id="logo_small" src="media/img/Familytree_small.png" width="200"
                                 alt="das Logo mit einem Baum und einer kleinen Familie"/>
                        </a>
                    </header>

                    <!-- Navbar -->
                    <nav>
                        <ul id="menu">
                            <li class="menu_item">
                                <a class="menu_link" href="home.html">Home</a>
                            </li>
                            <li class="menu_item">
                                <a id="menu_link_selected" href="familytree.xml">Der Stammbaum</a>
                            </li>
                            <li class="menu_item">
                                <a class="menu_link" href="imprint.html">Impressum</a>
                            </li>
                        </ul>
                    </nav>

                    <!-- Main content -->
                    <main>
                        <!-- Familytree -->
                        <h1>Stammbaum</h1>
                        <div id="familytree_div">
                            <xsl:call-template name="tree">
                                <xsl:with-param name="xpath" select="/familytree"/>
                            </xsl:call-template>
                        </div>
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
                    <xsl:call-template name="display_person"/>
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

    <xsl:template name="display_person">
        <div class="member">
            <xsl:attribute name="data-pid">
                <xsl:value-of select="@pid"/>
            </xsl:attribute>
            <xsl:call-template name="display_information">
                <xsl:with-param name="xpath" select="."/>
            </xsl:call-template>
            <xsl:if test="child::inlaw">
                <span class="inlaw">
                    <xsl:attribute name="data-pid">
                        <xsl:value-of select="child::inlaw/@pid"/>
                    </xsl:attribute>
                    <xsl:call-template name="display_information">
                        <xsl:with-param name="xpath" select="child::inlaw"/>
                    </xsl:call-template>
                </span>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="display_information">
        <xsl:param name="xpath"/>
        <span class="space">
            <xsl:value-of select="$xpath/@forename"/>
        </span>
        <span class="space">
            <xsl:value-of select="$xpath/@surname"/>
        </span>
        <span class="space">
            (<xsl:value-of select="$xpath/@sex"/>)
        </span>
        <br/>
        <span class="space">
            <xsl:value-of select="$xpath/@birth_date"/>
        </span>
        <span class="space">
            <xsl:value-of select="$xpath/@death_date"/>
        </span>

    </xsl:template>

</xsl:stylesheet>
