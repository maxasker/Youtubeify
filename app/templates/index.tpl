<!DOCTYPE HTML>
<html>
    <head>
        <title>Yotubeify</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='style.css') }}" />
        <script type="text/javascript" src="{{ url_for('static', filename='javascript.js') }}"></script>
    </head>
    <body>
        <div id="searchbloc">
        <h1>YOUTUBEIFY</h1>
            
            <form action="/searchresult" method="post">
                <textarea id="searchartist" name="searchartist" onkeydown="return limitLines(this, event)" placeholder="Type in Artist" maxlength="50" rows="1" cols="40"></textarea>
                <input id="searchterm" type="submit" value="Search">
                <textarea id="search" name="searchtrack" onkeydown="return limitLines(this, event)" placeholder="Type in Song" maxlength="50" rows="1" cols="40"></textarea>
            </form>
            
        </div>
        <div id="container">
            
            <div id="tubediv">
                <h3>YouTube search results</h3>
                {%if not youtubelist %}
                    <p class="welcomemessage">Please search for an artist, a song or both</p>
                {%elif youtubelist == "empty"%}
                    <p class="errormessage">Sorry, no results were found on YouTube :(</p>
                {%else%}
                {% for item in youtubelist %}
                    <iframe id="tubepresent" type="text/html" src="{{ item }}" frameborder="0"></iframe>
                {%- endfor %}
                {% endif %}
            </div>

            <div id="spotdiv">
                <h3>Spotify search results</h3>
                
                {%if not spotifylist %}
                    <p class="welcomemessage">Results are presented from both YouTube and Spotify</p>
                {%elif spotifylist == "empty"%}
                    <p class="errormessage">Sorry, no results were found on Spotify :(</p>
                {%else%}
                {% for item in spotifylist %}
                    <iframe id="spotpresent" src="https://embed.spotify.com/?uri={{ item }}"  width="450" height="80"frameborder="0"></iframe>
                {%- endfor %}
                {% endif %}
                
            </div>
        </div>
       
        <footer class="footerindex">
                <p id="footertext">Youtubeify</p>
                <p id="footertext2">Created by Max, Jacob and Per</p>
        </footer>
    </body>
</html>