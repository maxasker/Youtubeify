from flask import Flask, request, render_template, redirect, url_for
import requests
import json

app = Flask(__name__)

def youtubesearch(youtubelist,ytsearch):
    yturl = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q={0}&key=AIzaSyAxl8KldWxy7VdkaTIE1FeCJAcNFk7ketw".format(ytsearch)
    response = requests.get(yturl)
    jdata = response.json()
    for diction in jdata['items']:
        for thingie, sak in diction.items():
            if thingie == 'id':
                for itemz, wut in sak.items():
                    if itemz == 'videoId':
                        youtubelist.append("https://www.youtube.com/embed/"+(wut))
    return youtubelist

def spotifysearch(spotifylist,artist,track,spotifystate):
    artist = artist.replace(" ", "+")
    track = track.replace(" ", "+")
    if spotifystate == "artisttrack":
        spotifyurl = "https://api.spotify.com/v1/search?q={0}&artist:{1}&type=track&limit=25".format(track, artist)
        response = requests.get(spotifyurl)
        jdata = response.json()
        for diction in jdata['tracks']['items']:
            spotifylist.append(diction['uri'])
    elif spotifystate == "track":
        spotifyurl = "https://api.spotify.com/v1/search?q=name:{0}&type=track&limit=25".format(track)
        response = requests.get(spotifyurl)
        jdata = response.json()
        for diction in jdata['tracks']['items']:
            spotifylist.append(diction['uri'])
    else:
        spotifyurl = "https://api.spotify.com/v1/search?q={0}&type=artist&limit=25".format(artist)
        response = requests.get(spotifyurl)
        jdata = response.json()
        for diction in jdata['artists']['items']:
            spotifylist.append(diction['uri'])
    return spotifylist

@app.route('/')
def index():
    return render_template("index.tpl")

@app.route('/searchresult',methods=['GET', 'POST'])
def searchresult():
    artist = request.form['searchartist']
    track = request.form['searchtrack']
    if artist == "" and track == "":
        return redirect(url_for('index'))
    elif track == "":
        return redirect(url_for('search', artist=artist, track="none"))
    elif artist == "":
        return redirect(url_for('search', artist="none", track=track))
    else:
        return redirect(url_for('search', artist=artist, track=track))

@app.route('/search/artist:<artist>/song:<track>')
def search(artist,track):
    if artist == "none" and track == "none":
        return render_template("index.tpl", artist=artist, track=track)
    elif artist == "none":
        ytsearch = track
        spotifystate = "track"
    else:
        ytsearch = artist
        spotifystate = "artist"
    spotifylist = []
    youtubelist = []
    spotifysearch(spotifylist,artist,track,spotifystate)
    youtubesearch(youtubelist, ytsearch)
    if not spotifylist:
        spotifylist = "empty"
    if not youtubelist:
        youtubelist = "empty"
    return render_template("index.tpl", youtubelist=youtubelist, spotifylist=spotifylist)

if __name__ == "__main__":
    app.run(debug=True)


