import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/screens/files/files_preview_screen.dart';
import 'package:provider_base/utils/utils.dart';

class FilesScreen extends StatefulWidget with Utils {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> with Utils {
  // Used for test preview
  final imagePath = 'assets/files_example/landscape.jpeg';
  final videoPath =
      'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4';
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Files',
        centerTitle: true,
        pressBack: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.horizontalSpace,
          vertical: AppStyles.verticalSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview Images',
              style: AppStyles.textMedium.copyWith(
                fontSize: AppStyles.fontSizeL,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              onTap: () => push(
                context,
                FilesPreviewScreen(
                  path: imagePath,
                ),
              ),
            ),
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            Text(
              'Preview PDF',
              style: AppStyles.textMedium.copyWith(
                fontSize: AppStyles.fontSizeL,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            file != null
                ? GestureDetector(
                    child: Text(file?.path ?? ''),
                    onTap: () => push(
                      context,
                      FilesPreviewScreen(
                        path: file!.path,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await _pickFiles();
                setState(() {
                  file = pickedFile;
                });
              },
              child: const Text('Upload file to test'),
            ),
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            Text(
              'Preview Video',
              style: AppStyles.textMedium.copyWith(
                fontSize: AppStyles.fontSizeL,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => push(
                context,
                FilesPreviewScreen(
                  path: videoPath,
                ),
              ),
              child: Text(
                videoPath,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Pick file to test
  Future<File?> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final File file = File(result.files.single.path ?? '');
      return file;
    }
    return null;
  }
}
