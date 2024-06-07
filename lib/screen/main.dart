import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test2/screen/todo_list.dart';
import 'package:test2/viewModel/todo_list_view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Create TODOList',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(todoListViewModel.notifier);
    final dayTasks = ref
        .watch(todoListViewModel.select((value) => value.dayCompleteTaskCount));
    final leftTasks =
        ref.watch(todoListViewModel.select((value) => value.todoTask.length));

    useEffect(() {
      vm.initialSet();
      return null;
    },
        const []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const TodoList()))
                },
            icon: const Icon(Icons.auto_graph)),
        backgroundColor: Colors.purpleAccent,
        title: const TextButton(
          onPressed: null,
          child: Text(
            'TODOリスト',
            style: TextStyle(fontSize: 21, color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '本日の完了実績',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$dayTasks個',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '現在の残件数',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$leftTasks個',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoList()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: const Text('TODOリストへ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
