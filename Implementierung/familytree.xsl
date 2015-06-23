<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/familytree">
        <html>
            <head>
                <title>Stammbaum</title>
                <link type="text/css" rel="stylesheet" href="familytree.css"/>
                <link type="text/css" rel="stylesheet" href="table.css"/>
                <link rel="icon" type="image/png" href="media/img/logo_small.png"/>
            </head>
            <body>
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
                            <li id="menu_item">
                                <a id="menu_link_selected" href="familytree.xml">Der Stammbaum</a>
                            </li>
                            <li class="menu_item">
                                <a class="menu_link" href="create.html">Erstellen</a>
                            </li>
                            <li class="menu_item">
                                <a class="menu_link" href="imprint.html">Impressum</a>
                            </li>
                        </ul>
                    </nav>

                    <!-- Main content -->
                    <main>
                        <h1>Auflistung</h1>

                        <!-- Persons table-->
                        <h2>Personen</h2>
                        <table class="table">
                            <tr class="table_head_row">
                                <th class="table_head_cell">PID</th>
                                <th class="table_head_cell">Forename</th>
                                <th class="table_head_cell">Surname</th>
                                <th class="table_head_cell">Geschl.</th>
                                <th class="table_head_cell">Geb. am</th>
                                <th class="table_head_cell">Todestag</th>
                                <th class="table_head_cell">Ehepartner</th>
                            </tr>
                            <xsl:for-each select="//person">
                                <tr class="table_content_row">
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@pid"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@forename"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@surname"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="@sex = 'M'">männl.</xsl:when>
                                            <xsl:otherwise>weibl.</xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@birth_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@birth_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@death_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@death_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="table_content_cell">Hier soll der Partner referenziert werden</td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <!-- Partners table-->
                        <h2>Zugeheiratete</h2>
                        <table class="table">
                            <tr id="table_head_row">
                                <th class="table_head_cell">PID</th>
                                <th class="table_head_cell">Forename</th>
                                <th class="table_head_cell">Surname</th>
                                <th class="table_head_cell">Geschl.</th>
                                <th class="table_head_cell">Geb. am</th>
                                <th class="table_head_cell">Todestag</th>
                            </tr>

                            <!-- Inlaws -->
                            <xsl:for-each select="//inlaw">
                                <tr class="table_content_row">
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@pid"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@forename"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:value-of select="@surname"/>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="@sex = 'M'">männl.</xsl:when>
                                            <xsl:otherwise>weibl.</xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@birth_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@birth_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@death_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@death_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <!-- Familytree -->
                        <h1>Stammbaum</h1>

                    </main>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>