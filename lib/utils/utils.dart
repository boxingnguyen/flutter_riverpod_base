import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin Utils {
  Future<dynamic> push(
    BuildContext context,
    Widget route, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) async {
    return Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (context) => route,
        fullscreenDialog: fullscreenDialog,
        settings: settings,
      ),
    );
  }

  Future<dynamic> pushReplacement(BuildContext context, Widget routerName) async {
     Navigator.of(context).pushReplacement(
        MaterialPageRoute<dynamic>(builder: (context) => routerName));
  }
  Future<dynamic> pushAndRemoveUntil(BuildContext context, Widget routerName) async{
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> routerName), (route) => false);
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

  void snackBar(BuildContext context, String title, Color titlecolor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      title,
      style: TextStyle(color: titlecolor),
    )));
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  AppBar getAppBar({
    required BuildContext context,
    String? title,
    String? leftTitle,
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
          )
        : null;

    final _actions = <Widget>[];

    if (hasClose) {
      _actions.add(_closeBtn(context, popValue));
    }

    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor,
      title: _title,
      centerTitle: centerTitle,
      leading:
          _leading(context, leading, logoUrl, leftTitle, pressBack, popValue),
      actions: actions ?? _actions,
      bottom: widget,
    );
  }

  static Widget _leading(
    BuildContext context,
    Widget? leading,
    String? logoUrl,
    String? leftTitle,
    VoidCallback? pressBack,
    dynamic popValue,
  ) {
    Widget _leading;

    if (logoUrl != null) {
      _leading = _logo(logoUrl);
    } else if (leftTitle != null) {
      _leading = _leftTitle(context, leftTitle);
    } else {
      _leading = leading ?? _backBtn(context, pressBack, popValue);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: _leading,
    );
  }

  static Widget _leftTitle(BuildContext context, String leftTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(leftTitle),
    );
  }

  static Widget _logo(String url) {
    return Center(
      child: Container(
        width: 56,
        height: 22,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: CachedNetworkImageProvider(
            //     url,
            //   ),
            // ),
            ),
      ),
    );
  }

  static Widget _backBtn(
      BuildContext context, VoidCallback? pressBack, dynamic popValue) {
    return InkWell(
      onTap: pressBack ??
          () {
            Navigator.of(context).pop(popValue);
          },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 20,
      ),
    );
  }

  static Widget _closeBtn(BuildContext context, dynamic popValue) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(popValue),
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

  Widget customBtn(
      {Color backgoundColor = Colors.white,
      required String label,
      Color labelColor = Colors.blue,
      required Color iconColor,
      required IconData iconData,
      required Function() onTap}) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgoundColor),
      ),
      onPressed: onTap,
      icon: FaIcon(
        iconData,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }
}
