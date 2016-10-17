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
        
            
            <textarea id="search" name="title" placeholder="Search" maxlength="50" rows="1" cols="50"></textarea>
            
            <input id="makesearch" type="submit" value="Search for song">
        
        </div>
        <div id="container">
            <div id="tubediv">
                <h3>YouTube search results</h3>
            </div>

            <div id="spotdiv">
                <h3>Spotify search results</h3>
            </div>
        </div>
       
        <footer class="footerindex">
                <p>Youtubeify</p>
                <p>Created by Max, Jacob and Per</p>
        </footer>
    </body>
</html>