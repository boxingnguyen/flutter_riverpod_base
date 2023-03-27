import 'dart:io';
import 'package:mime/src/mime_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/api/api_client.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/common/core/data/local_storage.dart';
import 'package:provider_base/common/core/routes.dart';
import 'package:provider_base/main/app.dart';

final loadingProvider = StateProvider<bool>(((ref) => false));

mixin Utils {
  static final navigatorState = Constants.navigatorKey.currentState;
  ApiClient apiClient(Ref ref) => ref.read(envProvider.notifier);

  showLoading(Ref ref, bool enableLoading) {
    if (!enableLoading) return;

    ref.read(loadingProvider.notifier).state = true;
  }

  hideLoading(Ref ref, bool enableLoading) {
    if (!enableLoading) return;

    ref.read(loadingProvider.notifier).state = false;
  }

  bool isImage(String path) {
    final mimeType = lookupMimeType(path) ?? '';
    return mimeType.startsWith('image/');
  }

  String mimeType(String path) {
    final mimeType = lookupMimeType(path) ?? '';
    return mimeType.split('/').last;
  }

  void popWithoutContext([dynamic value]) {
    navigatorState?.pop(value);
  }

  Future<dynamic>? pushReplacementNamedWithoutContext(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? pushReplacementWithoutContext(Widget routerName) {
    return navigatorState?.pushReplacement(
        MaterialPageRoute<dynamic>(builder: (_) => routerName));
  }

  Future<dynamic>? pushNamedAndRemoveUntilWithoutContext(
    String routeName,
    bool Function(Route route) predicate, {
    Object? arguments,
  }) {
    return navigatorState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  Future<void> snackBarWithoutContext(
    String title,
    Color titlecolor,
  ) async {
    Constants.snackbarKey.currentState?.showSnackBar(SnackBar(
        content: Text(
      title,
      style: AppStyles.textMedium.copyWith(color: titlecolor),
    )));
  }

  void pushNameWithoutContext(
    String routeName, {
    Object? arguments,
  }) {
    navigatorState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushWithoutContext(
    Widget route, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) async {
    return navigatorState?.push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (_) => route,
        fullscreenDialog: fullscreenDialog,
        settings: settings,
      ),
    );
  }

  Future<dynamic>? pushAndRemoveUntilWithoutContext(Widget routerName) {
    return navigatorState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => routerName), (route) => false);
  }

  Future<dynamic> push(
    BuildContext context,
    Widget route, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) async {
    if (Platform.isIOS) {
      return Navigator.of(context, rootNavigator: true).push(
        CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => route,
          settings: settings,
        ),
      );
    }
    return Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (context) => route,
        fullscreenDialog: fullscreenDialog,
        settings: settings,
      ),
    );
  }

  Future<dynamic> pushReplacement(BuildContext context, Widget routerName) {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute<dynamic>(builder: (context) => routerName));
  }

  Future<dynamic> pushAndRemoveUntil(BuildContext context, Widget routerName) {
    return Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => routerName), (route) => false);
  }

  void unFocusScope(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future<void> snackBar(
    BuildContext context,
    String title,
    Color titlecolor,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      title,
      style: AppStyles.textMedium.copyWith(color: titlecolor),
    )));
  }

  void pushName(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  bool isPortrait(context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait;
  }

  AppBar getAppBar({
    String? title,
    bool centerTitle = true,
    double elevation = 0,
    Color? bgColor,
    Color titleColor = Colors.grey,
    PreferredSizeWidget? widget,
    List<Widget>? actions,
    String? logoUrl,
    int? unreadCount,
    bool hasSearch = false,
    bool hasClose = false,
    bool hasProfile = false,
    Widget? leading,
    VoidCallback? pressBack,
    dynamic popValue,
    void Function()? actionSearch,
    void Function()? actionProfile,
    void Function()? actionNotify,
  }) {
    final _title = title != null
        ? Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        : null;
    final _actions = <Widget>[];

    if (hasClose) {
      _actions.add(_closeBtn(popValue));
    }

    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor,
      title: _title,
      centerTitle: centerTitle,
      leading: _leading(leading, logoUrl, pressBack, popValue),
      actions: actions ?? _actions,
      bottom: widget,
    );
  }

  static Widget? _leading(
    Widget? leading,
    String? logoUrl,
    VoidCallback? pressBack,
    dynamic popValue,
  ) {
    Widget? _leading;

    if (logoUrl != null) {
      _leading = _logo(logoUrl);
    } else {
      _leading =
          leading ?? (pressBack != null ? _backBtn(pressBack, popValue) : null);
    }

    return _leading;
  }

  static Widget _logo(String url) {
    return Center(
      child: Container(
        width: 56,
        height: 22,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            // use CachedNetworkImageProvider if need cache image
            image: NetworkImage(
              url,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _backBtn(VoidCallback? pressBack, dynamic popValue) {
    return InkWell(
      onTap: pressBack ?? () => navigatorState?.pop(popValue),
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  static Widget _closeBtn(dynamic popValue) {
    return InkWell(
      onTap: () => navigatorState?.pop(popValue),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: const Icon(Icons.close, size: 20),
      ),
    );
  }

  // push to login when unauthorized -> force logout and push to login
  static void handleUnauthorizedError() async {
    _showSnackBar();

    await LocalStorage.clearSession();
    navigatorState?.pushNamedAndRemoveUntil(
        Routes.loginScreen, (route) => false);
  }

  static void _showSnackBar() {
    Constants.snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          Constants.sessionExpired,
          style: AppStyles.textMedium.copyWith(color: AppStyles.errorColor),
        ),
      ),
    );
  }
}
