import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart'; // Import Google ML Kit

class PoseDetectionScreen extends StatefulWidget {
  final String poseName;

  PoseDetectionScreen({required this.poseName});

  @override
  _PoseDetectionScreenState createState() => _PoseDetectionScreenState();
}

class _PoseDetectionScreenState extends State<PoseDetectionScreen> {
  CameraController? _cameraController;
  PoseDetector? _poseDetector;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _poseDetector = GoogleMlKit.vision.poseDetector();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras.first, ResolutionPreset.high);
    await _cameraController!.initialize();
    _cameraController!.startImageStream((image) {
      if (!_isDetecting) {
        _isDetecting = true;
        _detectPose(image);
      }
    });
  }

  void _detectPose(CameraImage image) async {
    final inputImage = _getInputImage(image);

    final poses = await _poseDetector!.processImage(inputImage);
    // Process poses and provide feedback based on `widget.poseName`
    // For example, show a message if the detected pose matches `widget.poseName`
    _isDetecting = false;
  }

  InputImage _getInputImage(CameraImage image) {
    final byteData = image.planes[0].bytes;
    final buffer = byteData.buffer.asUint8List();

    final imageRotation = InputImageRotation.rotation0deg; // Adjust as needed
    final imageFormat = InputImageFormat.yuv420; // Adjust as needed
    final size = Size(image.width.toDouble(), image.height.toDouble());

    return InputImage.fromBytes(
      bytes: buffer,
      inputImageData: InputImageData(
        size: size,
        imageRotation: imageRotation,
        inputImageFormat: imageFormat,
        planeData: image.planes.map((plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _poseDetector?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yoga Pose Detection')),
      body: _cameraController == null
          ? Center(child: CircularProgressIndicator())
          : CameraPreview(_cameraController!),
    );
  }
}
