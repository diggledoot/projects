import flask
import pickle
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression

#import in model
with open(f"model/bike_model.pkl","rb") as f:
    model = pickle.load(f)

app = flask.Flask(__name__,template_folder='templates')

@app.route("/",methods=['GET','POST'])
def main():
    if flask.request.method=="GET":
        return(flask.render_template('main.html'))
    if flask.request.method=="POST":
        temperature = flask.request.form['temperature']
        humidity = flask.request.form['humidity']
        windspeed = flask.request.form['windspeed']
        input_variables = pd.DataFrame([[temperature, humidity, windspeed]],columns=['temperature', 'humidity', 'windspeed'],dtype=float)
        pred = model.predict(input_variables)[0]
        return flask.render_template('main.html',input={'Temperature':temperature,'Humidity':humidity,'Windspeed':windspeed},result=pred[0])
@app.route("/test")
def test():
    return flask.render_template('test.html',message="In test html")
if __name__=="__main__":
    app.run()