import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/dashboard/cupertino_tab_controller_hook.dart';
import 'package:provider_base/screens/dashboard/dashboard_state_notifier.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/post/post_screen.dart';
import 'package:provider_base/screens/todo/todo_screen.dart';
import 'package:provider_base/utils/utils.dart';

class DashboardScreen extends HookConsumerWidget with Utils {
  DashboardScreen({Key? key}) : super(key: key);

  static String routeName = '/dashboard';

  int _oldIndex = 0;

  final List<GlobalKey<NavigatorState>> _tabNavKeyList =
      List.generate(5, (index) => index)
          .map((e) => GlobalKey<NavigatorState>())
          .toList();

  final _pages = const [
    TodoScreen(),
    PostScreen(),
    HomeScreen(
      title: 'Home 3',
    ),
    HomeScreen(
      title: 'Home 4',
    ),
    HomeScreen(
      title: 'Home 5',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useCupertinoTabController();

    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      controller: _controller,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        onTap: (index) => {},
        items: [
          BottomNavigationBarItem(
            icon: _svgIcon(
              color: Color(0xFFCDD0EA),
            ),
            activeIcon: _svgIcon(
              color: Color(0xFF6070DF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: _svgIcon(
                    color: Color(0xFFCDD0EA),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: _buildUnreadMessagesBadge(context),
                ),
              ],
            ),
            activeIcon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: _svgIcon(
                    color: Color(0xFF6070DF),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: _buildUnreadMessagesBadge(context),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _svgIcon(
              color: Color(0xFFCDD0EA),
            ),
            activeIcon: _svgIcon(
              color: Color(0xFF6070DF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _svgIcon(
              color: Color(0xFFCDD0EA),
            ),
            activeIcon: _svgIcon(
              color: Color(0xFF6070DF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: _svgIcon(
                    color: Color(0xFFCDD0EA),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: _buildOtherBadge(context),
                ),
              ],
            ),
            activeIcon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: _svgIcon(
                    color: Color(0xFF6070DF),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: _buildOtherBadge(context),
                ),
              ],
            ),
            label: 'Home',
          ),
        ],
        activeColor: Color(0xFF6070DF),
        inactiveColor: Color(0xFFCDD0EA),
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          navigatorKey: _tabNavKeyList[index],
          builder: (context) {
            return _pages[index];
          },
        );
      },
    );
  }

  Widget _svgIcon({Color? color}) {
    return Icon(
      Icons.home,
      color: color ?? Colors.blue,
      size: 25,
    );
  }

  Widget _buildOtherBadge(BuildContext context) {
    return const SizedBox();
  }

  Widget _buildUnreadMessagesBadge(BuildContext context) {
    return const SizedBox();
  }

  void _onTapItem(
      BuildContext context, int index, CupertinoTabController controller) {
    if (index != _oldIndex) {
      _oldIndex = index;
      return;
    }

    final canPop = _tabNavKeyList[controller.index].currentState!.canPop();
    if (canPop) {
      _tabNavKeyList[controller.index]
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      // context.read<DashboardStateNotifier>().notifyRefresh(_pages[index]);
    }
  }
}

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);
//
//   static String routeName = '/dashboard';
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   late CupertinoTabController _controller;
//
//   int _oldIndex = 0;
//
//   final List<GlobalKey<NavigatorState>> _tabNavKeyList =
//   List.generate(5, (index) => index)
//       .map((e) => GlobalKey<NavigatorState>())
//       .toList();
//
//   final _pages = const [
//     TodoScreen(),
//     PostScreen(),
//     HomeScreen(title: 'Home 3',),
//     HomeScreen(title: 'Home 4',),
//     HomeScreen(title: 'Home 5',),
//   ];
//
//   @override
//   void initState() {
//     _controller = CupertinoTabController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       backgroundColor: Colors.white,
//       controller: _controller,
//       tabBar: CupertinoTabBar(
//         backgroundColor: Colors.white,
//         onTap: (index) => {},
//         items: [
//           BottomNavigationBarItem(
//             icon: _svgIcon(
//               color: Color(0xFFCDD0EA),
//             ),
//             activeIcon: _svgIcon(
//               color: Color(0xFF6070DF),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 15),
//                   child: _svgIcon(
//                     color: Color(0xFFCDD0EA),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 5,
//                   child: _buildUnreadMessagesBadge(context),
//                 ),
//               ],
//             ),
//             activeIcon: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 15),
//                   child: _svgIcon(
//                     color: Color(0xFF6070DF),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 5,
//                   child: _buildUnreadMessagesBadge(context),
//                 ),
//               ],
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: _svgIcon(
//               color: Color(0xFFCDD0EA),
//             ),
//             activeIcon: _svgIcon(
//               color: Color(0xFF6070DF),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: _svgIcon(
//               color:
//               Color(0xFFCDD0EA),
//             ),
//             activeIcon: _svgIcon(
//               color: Color(0xFF6070DF),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: _svgIcon(
//                     color: Color(0xFFCDD0EA),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 5,
//                   child: _buildOtherBadge(context),
//                 ),
//               ],
//             ),
//             activeIcon: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: _svgIcon(
//                     color: Color(0xFF6070DF),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 5,
//                   child: _buildOtherBadge(context),
//                 ),
//               ],
//             ),
//             label: 'Home',
//           ),
//         ],
//         activeColor: Color(0xFF6070DF),
//         inactiveColor: Color(0xFFCDD0EA),
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           navigatorKey: _tabNavKeyList[index],
//           builder: (context) {
//             return _pages[index];
//           },
//         );
//       },
//     );
//   }
//
//   Widget _svgIcon({Color? color}) {
//     return Icon(Icons.home, color: color ?? Colors.blue,
//       size: 25,
//     );
//   }
//
//   Widget _buildOtherBadge(BuildContext context) {
//     return const SizedBox();
//   }
//
//   Widget _buildUnreadMessagesBadge(BuildContext context) {
//     return const SizedBox();
//   }
//
//   void _onTapItem(BuildContext context, int index) {
//     if (index != _oldIndex) {
//       _oldIndex = index;
//       return;
//     }
//
//     final canPop = _tabNavKeyList[_controller.index].currentState!.canPop();
//     if (canPop) {
//       _tabNavKeyList[_controller.index]
//           .currentState!
//           .popUntil((route) => route.isFirst);
//     } else {
//      // context.read<DashboardStateNotifier>().notifyRefresh(_pages[index]);
//     }
//   }
//
// }
