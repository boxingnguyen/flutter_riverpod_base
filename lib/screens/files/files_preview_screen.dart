import 'dart:developer';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider_base/screens/files/pdf_preview.dart';
import 'package:provider_base/screens/files/video_player_preview.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class FilesPreviewScreen extends StatelessWidget with Utils {
  final String path;
  const FilesPreviewScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: basename(path),
        actions: [
          GestureDetector(
            onTap: () async => await _downloadFile(context, path),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.download),
            ),
          ),
          GestureDetector(
            onTap: () => _shareFile(path),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.share),
            ),
          ),
        ],
      ),
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

  Future<void> _downloadFile(BuildContext context, String filePath) async {
    final fileDownloaded = await _saveFileToStorage(filePath);

    await showOkAlertDialog(
      context: context,
      title: 'File Download',
      message: fileDownloaded == true
          ? 'Download file successfully'
          : 'Download failed',
    );
  }

  Future<bool> _saveFileToStorage(String url) async {
    final Dio dio = Dio();
    final fileName = basename(url);
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage) &&
            await _requestPermission(Permission.accessMediaLocation) &&
            await _requestPermission(Permission.manageExternalStorage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = '';

          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/BaseApp";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path);
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> _shareFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/BaseApp';
    File(path).writeAsBytes(bytes);

    await Share.shareFiles([path]);
  }

  // request permission
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
