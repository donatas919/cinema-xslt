<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no" />
    <xsl:template match="/">
        <fo:root language="EN">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="297mm" page-width="210mm">
                    <fo:region-body region-name="xsl-region-body" />
                    <!-- <fo:region-after background-color="#f4f4f4" extent="297mm" /> -->
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block background-color="#f4f4f4" page-break-before="always" height="100%">

                        <xsl:for-each select="cinema/films/film" >
                            <fo:block background-color="#fff" margin-top="5mm" margin-bottom="3mm" margin-left="20mm" margin-right="20mm">
                                <fo:block color="#044264" text-transform="uppercase" text-align="center" font-family="monospace" font-size="24pt" margin-top="8mm" margin-bottom="8mm">
                                    <xsl:value-of select="name" />
                                </fo:block>
                                <fo:block text-align="center">
                                    <fo:external-graphic src="url('{image}')" width="100%" content-height="100%" content-width="scale-to-fit" scaling="uniform" />
                                </fo:block>
                                <fo:block text-align="right">
                                    <fo:external-graphic src="url('{rating}')" width="10%" content-height="10%" content-width="scale-to-fit" scaling="uniform" />
                                </fo:block>
                                <fo:block text-align="left">
                                    Score <xsl:value-of select="score" />
                                </fo:block>
                                <fo:block margin-left="5mm" margin-right="5mm">
                                    <fo:block color="#a7573b" text-transform="uppercase" text-align="left" font-size="15pt" margin-top="5mm">
                                        About
                                    </fo:block>
                                    <fo:block margin-bottom="10mm">
                                        <xsl:value-of select="about" />
                                    </fo:block>
                                    <fo:block>
                                        Schedule
                                    </fo:block>
                                    <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="1pt" />
                                    <xsl:for-each select="schedule/play">
                                        <fo:block margin-left="1mm" margin-right="1mm" margin-bottom="1mm">
                                            <xsl:value-of select="date" />
                                            <xsl:value-of select="time" />
                                        </fo:block>
                                    </xsl:for-each>
                                    <fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="1pt" />
                                    <fo:block page-break-after="always" />
                                </fo:block>
                            </fo:block>
                        </xsl:for-each>

                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
