import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/hyperlink_text.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/screens/files/files_preview_screen.dart';
import 'package:provider_base/screens/files/pdf_preview.dart';
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
  final pdfPath = 'http://www.africau.edu/images/default/sample.pdf';

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
            HyperLinkText(
                text: pdfPath,
                press: () {
                  push(context, PdfPreview(path: pdfPath));
                }),
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            // TODO(mintt): change to thumbnail view instead of go to screen 2
            Text(
              'Preview Video',
              style: AppStyles.textMedium.copyWith(
                fontSize: AppStyles.fontSizeL,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            HyperLinkText(
              text: videoPath,
              press: () => push(
                context,
                FilesPreviewScreen(
                  path: videoPath,
                ),
              ),
            ),
            // ThumbnailVideo(filePath: videoPath),
            // TODO(mintt): add youtube player
          ],
        ),
      ),
    );
  }
}
