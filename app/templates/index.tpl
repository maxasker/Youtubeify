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
                <textarea id="search" name="searchterm" onkeydown="return limitLines(this, event)" placeholder="{{ placeholder }}" maxlength="50" rows="1" cols="40"></textarea>
                <input id="searchterm" type="submit" value="Search">
            </form>
            
            <form action= ARTIST? method="post">
                <textarea id="searchartist" name="searchterm" onkeydown="return limitLines(this, event)" placeholder="{{ placeholder }}" maxlength="50" rows="1" cols="40"></textarea>
            </form>
            
        </div>
        <div id="container">
            <div id="tubediv">
                <h3>YouTube search results</h3>
                {% for item in youtubelist %}
                    <iframe id="tubepresent" type="text/html" src="{{ item }}" frameborder="0"></iframe>
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