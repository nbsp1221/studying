import numpy as np
import tensorflow.python.keras as keras
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

app = FastAPI()
model = keras.models.load_model('model.h5')

@app.post('/predict')
async def predict(data: list):
    return {
        'prediction': str(np.argmax(model.predict((np.array(data, 'float32') / 255).reshape(1, 28, 28, 1))))
    }

app.mount('/', StaticFiles(directory='public', html=True), name='public')
