from flask import Flask
app = Flask(__name__)
@app.route('/')
def homepage():
    return """
    <h1>Hello Cloud!</h1>

    <iframe class="vimeo-embed" src="https://player.vimeo.com/video/148751763" width="533" height="300" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" data-external="1"></iframe>
    """

app.run(host='0.0.0.0')
