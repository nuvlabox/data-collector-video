# data-collector-video
Stream video to MQTT broker

# ffmpeg vs OpenCV

The data-collector-video implementation can be based on either one of the following two tools: **ffmpeg** or **opencv**.

## ffmpeg

With **ffmpeg**, the tool can be installed via apt and it will be automatically available via the command line interface.

## opencv

With **opencv**, we use Python. We need to install the required dependencies (opencv-python, paho-mqtt, etc... see https://github.com/SixSq/video-analysis-demo-container for an example of a base image). Then, the Python script could simply look like this:

```python
import cv2
import paho.mqtt.client as mqtt

client = mqtt.Client()

client.connect("data-gateway", 1883)

client.loop_start()

v = cv2.VideoCapture()
v.open(0) # 0, as in video0

while True:
  _x, frame = v.read()
  retval, buffer = cv2.imencode('.jpg', frame)
  client.publish("mytopic", buffer.tostring())
```

## Copyright

Copyright &copy; 2021, SixSq SA
