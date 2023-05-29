import sys
from pathlib import Path
from tensorflow.keras.preprocessing.sequence import pad_sequences
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject,Slot,Signal

import tensorflow.lite as tflite
import numpy as np
import pickle


# loading the tokenizer into the memory
with open('tokenizer.pickle', 'rb') as f:
    tokenizer = pickle.load(f)


labels={0:'SADNESS', 1:'ANGER', 2:'DISGUST',3:'FEAR',4:'JOY',5:'SURPRISE',6:'NEUTRAL'}

source_dict={
             'SADNESS':"../images/svg_images/sad.png",
             'ANGER':"../images/svg_images/anger.png",
             'DISGUST':"../images/svg_images/disgust.png",
             'FEAR':"../images/svg_images/fear.png",
             'SURPRISE':"../images/svg_images/surprise.png",
             'NEUTRAL':"../images/svg_images/neutral.png",
             'JOY':"../images/svg_images/joy.png"
                }

# Load TFLite model and allocate tensors.
interpreter = tflite.Interpreter(model_path="model.tflite")

# Get input and output tensors.
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

interpreter.allocate_tensors()

def predict(text):
    input_text=[text]
    input_sequence = tokenizer.texts_to_sequences(input_text)
    padded_input_sequence = pad_sequences(input_sequence, maxlen=130, padding='post', truncating='post',dtype='float32')
    input_sequence=padded_input_sequence[0]
    interpreter.set_tensor(input_details[0]['index'], [input_sequence])

    # Invoke the model
    interpreter.invoke()

    # Get the output tensor and process the output as needed
    output_details = interpreter.get_output_details()
    output_data = interpreter.get_tensor(output_details[0]['index'])
    
    print(f'Text: {text} \nPredition: {labels[np.argmax(output_data,axis=1)[0]]}\n')

    return str(labels[np.argmax(output_data,axis=1)[0]])
    


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    setName=Signal(str)
    setEmote=Signal(str)

    @Slot(str)

    def welcomeText(self,name):
        prediction=predict(name)


        self.setName.emit(f"Your Sentence  Expresses: \n'{prediction}' Emotion")


        self.setEmote.emit(source_dict[prediction])




if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Get Content
    main= MainWindow()
    engine.rootContext().setContextProperty("backend",main)
    qml_file = Path(__file__).resolve().parent / "qml/main.qml"

    engine.load(str(qml_file))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
