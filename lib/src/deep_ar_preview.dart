import 'dart:io';
import 'package:flutter/material.dart';

import 'deep_ar_controller.dart';

/// Displays live preview with desired effects.
class DeepArPreview extends StatelessWidget {
  const DeepArPreview(this.deepArController, {Key? key}) : super(key: key);
  final DeepArController deepArController;

  @override
  Widget build(BuildContext context) {
    return deepArController.isInitialized
        ? Platform.isAndroid
            ? deepArController.buildPreview()
            : _DeepArIosPreview(deepArController)
        : Container();
  }
}

class _DeepArIosPreview extends StatefulWidget {
  final DeepArController deepArController;
  const _DeepArIosPreview(this.deepArController, {Key? key}) : super(key: key);

  @override
  State<_DeepArIosPreview> createState() => __DeepArIosPreviewState();
}

class __DeepArIosPreviewState extends State<_DeepArIosPreview> {
  @override
  Widget build(BuildContext context) {
    return widget.deepArController.buildPreview(oniOSViewCreated: () {
      setState(() {});
    });
  }
}
