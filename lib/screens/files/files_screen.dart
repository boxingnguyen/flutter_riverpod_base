import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/utils/utils.dart';

class FilesScreen extends StatelessWidget with Utils {
  const FilesScreen({Key? key}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.horizontalSpace,
              vertical: AppStyles.verticalSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preview Images',
                style: AppStyles.textMedium
                    .copyWith(fontSize: AppStyles.fontSizeL),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Image.network(
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                onTap: () => getFileExtension(
                    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80'),
              ),
              const SizedBox(
                height: AppStyles.verticalSpace,
              ),
              Text(
                'Preview PDF',
                style: AppStyles.textMedium
                    .copyWith(fontSize: AppStyles.fontSizeL),
              ),
              const SizedBox(
                height: AppStyles.verticalSpace,
              ),
              Text(
                'Preview Video',
                style: AppStyles.textMedium
                    .copyWith(fontSize: AppStyles.fontSizeL),
              ),
            ],
          ),
        ));
  }

  String getFileExtension(String fileName) {
    print("." + fileName.split('.').last);
    return "." + fileName.split('.').last;
  }
}
