<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:key name="inlaw_by_pid" match="inlaw" use="@pid"/>
    <xsl:template match="/familytree">
        <html>
            <head>
                <title>Stammbaum</title>
                <link type="text/css" rel="stylesheet" href="familytree.css"/>
                <link type="text/css" rel="stylesheet" href="table.css"/>
                <link rel="icon" type="image/png" href="media/img/favicon.png"/>
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
                            <li class="menu_item">
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
                        <!--  
                        <h1>Auflistung</h1>

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
                                    <td class="table_content_cell">
                                        <xsl:for-each select="key('inlaw_by_pid', @partner)">
                                            <xsl:value-of select="@forename"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="@surname"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>

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
                        -->
                        <!-- Familytree -->
                        <h1>Stammbaum</h1>
                          <xsl:call-template name="tree">
                            <xsl:with-param name="xpath" select="/familytree" />
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
              
              <xsl:call-template name="display_person"/>         
              
              <!-- recursive select -->
              <xsl:if test="child::person">
               	<xsl:call-template name="tree">
                    <xsl:with-param name="xpath" select="$xpath/child::person" />
                </xsl:call-template>
              </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
    
    </xsl:template>
    
    <xsl:template name="display_person">
        <div class="member">
          <xsl:call-template name="display_information">
            <xsl:with-param name="xpath" select="." />
          </xsl:call-template>
            <span class="inlaw">
              <xsl:if test="child::inlaw">
                  <xsl:call-template name="display_information">
                    <xsl:with-param name="xpath" select="child::inlaw" />
                  </xsl:call-template>
              </xsl:if>
            </span>
        </div>
    </xsl:template>
    
    <xsl:template name="display_information">
        <xsl:param name="xpath"/>
        <span class="space"><xsl:value-of select="$xpath/@forename"/></span>
        <span class="space"><xsl:value-of select="$xpath/@surname"/></span>
        <span class="space">(<xsl:value-of select="$xpath/@sex"/>)</span>
    
    </xsl:template>
    
</xsl:stylesheet>