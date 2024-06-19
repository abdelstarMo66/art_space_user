import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARPreviewScreen extends StatelessWidget {
  const ARPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/glbs/test2.glb',
        alt: 'A 3D model of an astronaut',
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        arScale: ArScale.auto,
        disableZoom: true,
        ar: true,
        arPlacement: ArPlacement.wall,
        autoRotate: false,
        cameraControls: true,
      ),
    );
  }
}
