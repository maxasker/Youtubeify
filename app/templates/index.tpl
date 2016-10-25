<!DOCTYPE HTML>
<html>
    <head>
        <title>Yotubeify</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="static/style.css">
        <script type="text/javascript" src="{{ url_for('static', filename='javascript.js') }}"></script>
    </head>
    <body>
        <div id="searchbloc">
        <h1>YOUTUBEIFY</h1>
            
            <form action="/searchresult" method="post">
                <textarea id="search" name="searchterm" placeholder="{{ placeholder }}" maxlength="50" rows="1" cols="50"></textarea>
                <input id="searchterm" type="submit" value="Search for song">
            </form>
        </div>
        <div id="container">
            <div id="tubediv">
                <h3>YouTube search results</h3>
                {% for item in youtubelist %}
                    <iframe id="tubepresent" type="text/html" width="640" height="390" src="{{ item }}" frameborder="0"></iframe>
                {%- endfor %}
                
            </div>

            <div id="spotdiv">
                <h3>Spotify search results</h3>
                
                <div class="spotpresent">
                    <p class="spottext"> "Song name" performed by "Artist" Spotify</p>
                </div>
                
                <div class="spotpresent">
                    <p class="spottext"> "Song name" performed by "Artist" Spotify</p>
                </div>
            </div>
        </div>
       
        <footer class="footerindex">
                <p id="footertext">Youtubeify</p>
                <p id="footertext2">Created by Max, Jacob and Per</p>
        </footer>
    </body>
</html>