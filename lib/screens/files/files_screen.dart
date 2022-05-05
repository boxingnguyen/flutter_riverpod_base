import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/common_view/hyperlink_text.dart';
import 'package:provider_base/common/common_view/shimmer_widget.dart';
import 'package:provider_base/common/common_view/youtube_player.dart';
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
  final imagePath =
      'https://www.mickeyshannon.com/images/landscape-photography.jpg';
  final videoPath =
      'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4';
  final pdfPath = 'http://www.africau.edu/images/default/sample.pdf';

  final youtubeUrl = 'https://www.youtube.com/watch?v=Py5ahdxl2ck';

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
            _buildHeader('Preview Image'),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: CachedNetworkImage(
                imageUrl: imagePath,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    const ShimmerWidget(
                  height: 200,
                  width: 200,
                  shapeBorder: ContinuousRectangleBorder(),
                ),
                errorWidget: (context, url, error) =>
                    const CommonErrorIndicator(
                  message: 'Image not found',
                ),
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
            _buildHeader('Preview PDF'),
            const SizedBox(
              height: 10,
            ),
            HyperLinkText(
              text: pdfPath,
              press: () => push(
                context,
                FilesPreviewScreen(path: pdfPath),
              ),
            ),
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            _buildHeader('Preview Video'),
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
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            _buildHeader('Youtube Player'),
            const SizedBox(
              height: 10,
            ),
            YoutubeViewer(youtubeUrl: youtubeUrl),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String header) {
    return Text(
      header,
      style: AppStyles.textMedium.copyWith(
        fontSize: AppStyles.fontSizeL,
      ),
    );
  }
}
