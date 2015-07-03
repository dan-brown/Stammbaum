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
                <link type="text/css" rel="stylesheet" href="table.css"/>
                <link type="text/css" rel="stylesheet" href="infobox.css"/>
                <link rel="icon" type="image/png" href="media/img/favicon.png"/>
                <script src="familytree.js"/>
            </head>
            <body>
                <div id="infobox">
                    <div id="infobox_content">
                        <form>
                            <div>
                                Forename:&#160;
                                <span id="edit_forename" class="editable"/>
                            </div>
                            <div>
                                Surname:&#160;
                                <span id="edit_surname" class="editable"/>
                            </div>
                            <div>
                                Sex:&#160;
                                <span id="edit_sex" class="editable"/>
                            </div>
                            <div>
                                Birthdate:&#160;
                                <span id="edit_birth_date" class="editable"/>
                            </div>
                            <div>
                                Deathdate:&#160;
                                <span id="edit_death_date" class="editable"/>
                            </div>
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