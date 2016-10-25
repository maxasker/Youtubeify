from flask import Flask, request, render_template
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

def spotifysearch(spotifylist,artist,track):
    spotifyurl = "https://api.spotify.com/v1/search?q={0}&artist:{1}&type=track".format(track, artist)
    response = requests.get(spotifyurl)
    jdata = response.json()
    for diction in jdata['tracks']['items']:
        spotifylist.append(diction['uri'])
    return spotifylist

@app.route('/')
def index():
    placeholder="Enter searchterm here"
    return render_template("index.tpl", placeholder=placeholder)

@app.route('/searchresult',methods=['GET', 'POST'])
def searchresult():
    artist = request.form['searchartist']
    track = request.form['searchtrack']
    if artist and track is not None:
        ytsearch = artist + " - " + track
    elif artist is None:
        ytsearch = track
    elif track is None:
        ytsearch = artist
    else:
        return render_template("index.tpl")
    spotifylist = []
    youtubelist = []
    spotifysearch(spotifylist,artist,track)
    youtubesearch(youtubelist, ytsearch)
    return render_template("index.tpl", youtubelist=youtubelist, spotifylist=spotifylist)

if __name__ == "__main__":
    app.run(debug=True)


