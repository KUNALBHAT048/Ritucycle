import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sdp/screens/home_screen.dart';
import 'package:sdp/screens/yoga_list_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: ${e.code}\nError Message: ${e.description}');
  }
  runApp(RituCycleApp());
}

class RituCycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RituCycle',
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(cameras: cameras),
      },
    );
  }
}
// import tensorflow as tf
// import tensorflow_hub as hub
//
// # Load the MoveNet Lightning model from TensorFlow Hub
// module = hub.load("https://tfhub.dev/google/movenet/singlepose/lightning/4")
//
// # Define a function for inference
// @tf.function(input_signature=[tf.TensorSpec(shape=[1, 192, 192, 3], dtype=tf.float32)])
// def detect_keypoints(input_tensor):
// return module.signatures['serving_default'](input_tensor)
//
// # Save the model with the new signature
// saved_model_path = 'movenet_saved_model'
// tf.saved_model.save(module, saved_model_path, signatures={'serving_default': detect_keypoints})
//
// # Convert the SavedModel to TensorFlow Lite format
// converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_path)
// tflite_model = converter.convert()
//
// # Save the converted model to a .tflite file
// tflite_model_path = 'movenet_lightning.tflite'
// with open(tflite_model_path, 'wb') as f:
// f.write(tflite_model)
//
// # Provide a link to download the .tflite file
// from google.colab import files
// files.download(tflite_model_path)
