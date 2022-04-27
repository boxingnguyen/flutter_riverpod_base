import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider_base/screens/files/pdf_preview.dart';
import 'package:provider_base/screens/files/video_player_preview.dart';
import 'package:provider_base/utils/utils.dart';

class FilesPreviewScreen extends StatelessWidget with Utils {
  final String path;
  const FilesPreviewScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Preview'),
      body: Center(
        child: _buildPreview(context, path),
      ),
    );
  }

  Widget _buildPreview(BuildContext context, String filePath) {
    if (isImage(filePath)) {
      return _buildImagePreview(context, filePath);
    }

    if (isVideo(filePath)) {
      return VideoPlayerPreview(
        path: filePath,
      );
    }

    return PdfPreview(path: filePath);
  }

  Widget _buildImagePreview(BuildContext context, String path) {
    // TODO(mintt): use Herro instead, comment package photo to introduce
    return PhotoView(
      imageProvider: AssetImage(path),
    );
  }

  bool isImage(String path) {
    final mimeType = lookupMimeType(path);

    return (mimeType ?? '').startsWith('image/');
  }

  bool isVideo(String path) {
    final mimeType = lookupMimeType(path);

    return (mimeType ?? '').startsWith('video/');
  }

  bool isPdf(String path) {
    final mimeType = lookupMimeType(path);

    return (mimeType ?? '').endsWith('pdf');
  }
}
