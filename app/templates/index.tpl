<!DOCTYPE HTML>
<html>
    <head>
        <title>Yotubeify</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="static/style.css">
        <script type="text/javascript" src="{{ url_for('static', filename='javascript.js') }}"></script>
    </head>
    <body>
        <h1>YOUTUBEIFY</h1>
        
        <div id="searchbloc">
            <h3>Presenting the searchbox</h3>
            <textarea id="search" name="title" placeholder="Search" maxlength="50" rows="1" cols="50"></textarea>
            <hr>
            <input id="makesearch" type="submit" value="Search for song">
        
        </div>
        
       
        <footer class="footerindex">
                <p>Youtubeify</p>
                <p>Created by Max, Jacob and Per</p>
        </footer>
    </body>
</html>