import 'package:camera/camera.dart';


class CameraHelper {
  // Private constructor
  CameraHelper._();

  // Static final instance of the Singleton class
  static final CameraHelper _instance = CameraHelper._();

  // Factory constructor to return the same instance
  factory CameraHelper() {
    return _instance;
  }

  static List<CameraDescription> cameras = [];
}