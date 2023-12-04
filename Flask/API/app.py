from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '15'

if __name__ == '__main__':
    app.run(host='192.168.1.7', port=5000)