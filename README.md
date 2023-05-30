# Twizzer-Twitter-Emotion-analyzer
<div align="center">
<img align="center" src="https://raw.github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer/main/ScreenShots/Tz_logo.png?sanitize=true" alt="Imagination">

</div>

### About:
The GUI developed for this project provides a user-friendly platform for real-time emotion prediction from text data. Created with PySide2 and Qt Creator, the GUI offers an interactive experience, allowing users to input text and receive accurate emotion predictions. Integrated with the trained LSTM model on Twitter datasets, the GUI demonstrates the effectiveness of emotion prediction.
  
    
### Cloning the repository

--> Clone the repository using the command below :
```bash
git clone https://github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer.git

```

--> Move into the directory where we have the project files : 
```bash
cd Twizzer_Twitter_Emotion_analyzer


```

--> Create a virtual environment :
```bash
# Let's install virtualenv first
pip install virtualenv

# Then we will be creating our virtual environment
virtualenv envname

```

--> Activate the virtual environment :
```bash
envname\scripts\activate

```

--> Install the requirements :
```bash
pip install -r requirements.txt

```

#

### Running the App

--> To run the App, we use :
```bash
python main.py

```

> ⚠ Then, the G.U.I. will run be patient as it takes sometime

#

### Note

The model trained using kaggle notebook that we collaborated in here are the links:  

◉ Make sure to download and move the [Model.tflite](https://www.kaggle.com/datasets/shaikhsaadali/lstm-model-pickle?select=model.tflite) into the root directory of the project  
  
◉ [Model_training](https://www.kaggle.com/code/shaikhsaadali/final-major)  
  
◉ [Model_testing](https://www.kaggle.com/code/shaikhsaadali/model-tester)



#

### App Preview :

<table width="100%"> 
<tr>
<td width="50%">      
&nbsp; 
<br>
<p align="center">
  Application At First Glance
</p>
<img src="https://raw.github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer/main/ScreenShots/first_page.PNG?sanitize=true" >
</td> 
<td width="50%">
<br>
<p align="center">
  Predicting Emotions
</p>
<img src="https://raw.github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer/main/ScreenShots/output1.PNG?sanitize=true" >  
</td>

<tr>
<td width="50%">      
&nbsp; 
<br>

<img src="https://raw.github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer/main/ScreenShots/output3.PNG?sanitize=true" >
</td> 
<td width="50%">
<br>

<img src="https://raw.github.com/SkSaadAli/Twizzer_Twitter_Emotion_analyzer/main/ScreenShots/output4.PNG?sanitize=true" >  
</td>
  
  

