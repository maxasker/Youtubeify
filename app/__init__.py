from flask import Flask, request, render_template
import requests
import json

app = Flask(__name__)

def youtubesearch(youtubelist, searchterm):
    yturl = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q={0}&key=AIzaSyAxl8KldWxy7VdkaTIE1FeCJAcNFk7ketw".format(searchterm)
    response = requests.get(yturl)
    jdata = response.json()
    for diction in jdata['items']:
        for thingie, sak in diction.items():
            if thingie == 'id':
                for itemz, wut in sak.items():
                    if itemz == 'videoId':
                        youtubelist.append("https://www.youtube.com/embed/"+(wut))
    return youtubelist

@app.route('/')
def index():
    placeholder="Enter searchterm here"
    return render_template("index.tpl", placeholder=placeholder)

@app.route('/searchresult', methods=['GET', 'POST'])
def searchresult():
    searchterm = request.form['searchterm']
    youtubelist = []
    youtubesearch(youtubelist, searchterm)
    return render_template("index.tpl", youtubelist=youtubelist)

if __name__ == "__main__":
    app.run(debug=True)


