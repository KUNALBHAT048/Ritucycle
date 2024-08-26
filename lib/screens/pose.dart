import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class PoseDetectionScreen extends StatefulWidget {
  final String imagePath;

  PoseDetectionScreen({required this.imagePath});

  @override
  _PoseDetectionScreenState createState() => _PoseDetectionScreenState();
}

class _PoseDetectionScreenState extends State<PoseDetectionScreen> {
  late PoseDetector poseDetector;
  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void initState() {
    super.initState();
    poseDetector = GoogleMlKit.vision.poseDetector();
    _processImage();
  }

  @override
  void dispose() {
    poseDetector.close();
    super.dispose();
  }

  Future<void> _processImage() async {
    if (isBusy) return;
    isBusy = true;
    setState(() {});

    final inputImage = await _getInputImage();
    final poses = await poseDetector.processImage(inputImage);
    if (poses.isNotEmpty) {
      // Handle the detected poses here
    }

    isBusy = false;
    setState(() {});
  }

  Future<InputImage> _getInputImage() async {
    final imageFile = File(widget.imagePath);
    final image = img.decodeImage(imageFile.readAsBytesSync());

    final directory = await getTemporaryDirectory();
    final tempFile = File('${directory.path}/temp_image.jpg');
    tempFile.writeAsBytesSync(img.encodeJpg(image!));

    return InputImage.fromFilePath(tempFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (customPaint != null)
              Container(
                color: Colors.black,
                child: CustomPaint(
                  painter: customPaint?.painter, // Correctly passing the painter
                  child: Container(),
                ),
              )
            else
              const Text('No pose detected yet'),
            ElevatedButton(
              onPressed: () async {
                await _processImage();
              },
              child: const Text('Detect Pose'),
            ),
          ],
        ),
      ),
    );
  }
}
