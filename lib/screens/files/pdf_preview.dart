import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/core/app_style.dart';

class PdfPreview extends StatefulWidget {
  final String path;

  const PdfPreview({Key? key, required this.path}) : super(key: key);

  @override
  _PdfPreviewState createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  int? _currentPage = 1;
  int? _totalPages = 0;

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: PDFView(
                filePath: widget.path,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: false,
                onRender: (_pages) {
                  setState(() {
                    _totalPages = _pages;
                  });
                },
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
                onPageChanged: (int? page, int? total) {
                  setState(() {
                    _currentPage = (page ?? 0) + 1;
                  });
                },
              ),
            ),
            Positioned(
              left: 16,
              top: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Text(
                  // TODO(mintt): use Statefulbuilder or hookbuilder instead
                  '$_currentPage / $_totalPages',
                  style: AppStyles.textRegular.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: AppStyles.fontSizeM,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
