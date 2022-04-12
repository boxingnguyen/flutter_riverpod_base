import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/components/update_phone.dart';
import 'package:provider_base/screens/home/home_state_notifier.dart';
import 'package:provider_base/screens/login/login_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/screens/post/post_screen.dart';
import 'package:provider_base/utils/utils.dart';

class HomeScreen extends HookConsumerWidget with Utils {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(homeProvider);
    // if declare state here entire HomeScreen will be rebuild when state change
    final loginState = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.counterExample,
          style: AppStyles.textBold,
        ),
      ),
      drawer: drawerCustom(context, ref),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer(
            builder: (_, ref, child) {
              final state = ref.watch(homeProvider);
              return Column(
                children: [
                  Center(child: Text('${state.counter}')),
                  Text(
                    Constants.getNumberNum + '${state.random}',
                    style: AppStyles.textRegular,
                  ),
                  TextButton(
                    onPressed: () =>
                        ref.read(homeProvider.notifier).getRandom(),
                    child: const Text(
                      Constants.getRandom,
                      style: AppStyles.textRegular,
                    ),
                  ),
                  Text(
                    Constants.rebuildWhenStateChange + secondNow,
                    style: AppStyles.textRegular,
                  ),
                ],
              );
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 32,
            backgroundImage: NetworkImage(
                loginState.userDetail?.photoUrl ?? Asset.imageDefault),
          ),
          Text(
            loginState.userDetail?.displayName ?? '',
            style: AppStyles.textRegular.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Constants.notRebuild + secondNow,
            style: AppStyles.textRegular,
          ),
          ElevatedButton(
              onPressed: () => pushWithoutContext(const PostScreen()),
              // onPressed: () => push(context, const PostScreen()),
              child: const Text(
                Constants.postList,
                style: AppStyles.textRegular,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String get secondNow {
    return DateTime.now().second.toString();
  }

  Widget drawerCustom(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(loginProvider);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userState.userDetail?.displayName ?? Constants.name,
              style: AppStyles.textRegular.copyWith(fontSize: 24),
            ),
            accountEmail: Text(
              userState.userDetail?.email ?? '',
              style: AppStyles.textRegular,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  userState.userDetail?.photoUrl ?? Asset.imageDefault),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.phone),
              title: const Text(
                Constants.updatePhoneNumber,
                style: AppStyles.textRegular,
              ),
              onTap: () => pushWithoutContext(const UpdatePhone())
              //push(context, const UpdatePhone()),
              ),
          ListTile(
            leading: const Icon(Icons.power_settings_new),
            title: const Text(
              Constants.logOut,
              style: AppStyles.textRegular,
            ),
            onTap: () {
              ref.read(loginProvider.notifier).logOut();
              // snackBar(context, Constants.logOut, Colors.green);
              // pushAndRemoveUntil(context, const LoginScreen());
              snackBarWithoutContext(Constants.logOut, Colors.green);
              pushAndRemoveUntilWithoutContext(const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
