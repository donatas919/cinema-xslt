<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template match="/">
        <html>
            <head>
                <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;0,900;1,400" rel="stylesheet" />
                <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700" rel="stylesheet" />
                <link rel="stylesheet" href="styles/style.css" />
                <script src="script/main.js"></script>
            </head>

            <body>
                <div class="page_container">
                    <xsl:for-each select="cinema/films/film">
                        <div id="modal{@id}" class="modal hide">
                            <div class="modal_content">
                                <div class="modal_film_schedule">
                                    <h3 class="schedule">
                                        Schedule
                                    </h3>
                                    <hr />
                                    <xsl:for-each select="schedule/play">
                                        <div class="schedule">
                                            <div class="schedule_date_time_container">
                                                <div>
                                                    <xsl:value-of select="date" />
                                                </div>
                                                <div>
                                                    <xsl:value-of select="time" />
                                                </div>
                                            </div>

                                            <button>Buy Ticket</button>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                            <div style="display:flex; justify-content: flex-end; margin: 2rem;">
                                <button data-close-id="{@id}">Close</button>
                            </div>
                        </div>
                        <div class="main_page">
                            <h1 class="modal_film_title">
                                <xsl:value-of select="name" />
                            </h1>
                            <img class="film_image" src="{image}" alt="film_img" />
                            <div class="main_page_content">
                                <div class="rating_container">
                                    <div class="core">
                                        Score: <xsl:value-of select="score" />
                                    </div>
                                    <div class="rating">
                                        <img class="rating_image" src="{rating}" alt="rating_img" />
                                    </div>
                                </div>

                                <h2 style="margin: 30px 0;">
                                    About
                                </h2>
                                <p>
                                    <xsl:value-of select="about" />
                                </p>
                                <button style="margin: 2rem 0;" data-id="{@id}">Buy Tickets</button>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>