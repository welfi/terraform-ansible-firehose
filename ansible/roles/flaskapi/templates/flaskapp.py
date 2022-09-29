from distutils.command.config import config
from flask import Flask, request
import boto3
from flasgger import Swagger, LazyJSONEncoder
from aws_config import AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, STREAM_NAME


app = Flask(__name__)
app.json_encoder = LazyJSONEncoder

swagger = Swagger(app, template_file='swagger.yml')
kinesis = boto3.client('firehose', aws_access_key_id=AWS_ACCESS_KEY_ID,
                       aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
                       region_name=AWS_REGION)


@app.route("/track", methods=['POST'])
def sendTrack():
    data = request.get_data()
    response = kinesis.put_record(
        DeliveryStreamName=STREAM_NAME,
        Record={'Data': data})
    return response


@app.route("/alias", methods=['POST'])
def sendAlias():
    data = request.get_data()
    response = kinesis.put_record(
        DeliveryStreamName=STREAM_NAME,
        Record={'Data': data})
    return response


@app.route("/profile", methods=['POST'])
def sendProfile():
    data = request.get_data()
    response = kinesis.put_record(
        DeliveryStreamName=STREAM_NAME,
        Record={'Data': data})
    return response


if __name__ == "__main__":
    app.run(host='0.0.0.0')
