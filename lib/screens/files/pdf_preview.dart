import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/utils/utils.dart';

class PdfPreview extends HookWidget with Utils {
  final String path;
  const PdfPreview({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentPage = useValueNotifier(1);
    final _totalPages = useValueNotifier(0);

    final Completer<PDFViewController> _controller =
        Completer<PDFViewController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: PDF(
                pageFling: false,
                onRender: (_pages) => _totalPages.value = _pages ?? 0,
                onError: (error) {
                  CommonErrorIndicator(
                    message: error.toString(),
                  );
                },
                onPageError: (page, error) {
                  CommonErrorIndicator(
                    message: '$page: ${error.toString()}',
                  );
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onPageChanged: (int? page, int? total) =>
                    _currentPage.value = (page ?? 0) + 1,
              ).fromUrl(
                path,
              ),
            ),
            Positioned(
              left: 16,
              top: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor.withOpacity(
                    0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: ValueListenableBuilder(
                    valueListenable: _totalPages,
                    builder: (context, totalPages, child) {
                      return ValueListenableBuilder(
                          valueListenable: _currentPage,
                          builder: (context, currentPage, child) {
                            return Text(
                              '$currentPage/$totalPages',
                              style: AppStyles.textRegular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: AppStyles.fontSizeM,
                              ),
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFileName(String path) {
    return path.split('/').last;
  }
}
