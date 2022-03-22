import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/error_indicator.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:provider_base/screens/todo/todo_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class TodoScreen extends StatelessWidget with Utils {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: 'List Todo'),
      body: TodoBody(),
    );
  }
}

class TodoBody extends HookConsumerWidget with Utils {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoNotifierProvider);
    final todoStateNotifier = ref.read(todoNotifierProvider.notifier);

    final listTodo = todoState.listTodo;

    final scrollController = useScrollController();

    void scrollListener() {
      if (scrollController.position.atEdge) {
        final isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          // load 10 items
          todoStateNotifier.fetchData(limit: 10);
        }
      }
    }

    useEffect(() {
      scrollController.addListener(scrollListener);
      return () => scrollController.removeListener(scrollListener);
    }, [scrollController]);

    return Stack(
      children: [
        todoState.showLoadingIndicator
            ? const LoadingIndicator()
            : const SizedBox(),
        todoState.showErrorIndicator
            ? CommonErrorIndicator(
                onTapRetry: todoStateNotifier.refreshList,
              )
            : const SizedBox(),
        RefreshIndicator(
          onRefresh: () => todoStateNotifier.refreshList(),
          child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: listTodo.length,
              itemBuilder: (context, index) {
                final item = listTodo.elementAt(index);
                return ListTile(
                  title: Text(item.title ?? ''),
                  subtitle: Text(item.id.toString()),
                  leading: const Icon(Icons.watch),
                );
              }),
        )
      ],
    );
  }
}
