import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test2/screen/main.dart';
import 'package:test2/viewModel/todo_list_view_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(todoListViewModel.notifier);
    final detail =
        ref.watch(todoListViewModel.select((value) => value.todoTask));
    final selected =
        ref.watch(todoListViewModel.select((value) => value.selected));
    String task = '';
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    String date = outputFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
            onPressed: () => {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const TodoList()))
                },
            icon: const Icon(Icons.auto_graph)),
        title: TextButton(
          child: const Text(
            'TODOリスト',
            style: TextStyle(fontSize: 21, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    showCupertinoDialog(
                      context: context, //コンテキスト
                      builder: (context) {
                        return Center(
                          child: CupertinoAlertDialog(
                            title: Text('タスクを追加'),
                            content: CupertinoTextField(
                              placeholder: 'タスクを入力して追加',
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                task = value;
                              },
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('キャンセル'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('追加'),
                                onPressed: () {
                                  vm.addList(task);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      }, //表示するダイアログ
                    )
                  },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                for (var list in detail) ...{
                  Slidable(
                    enabled: true,
                    closeOnScroll: true,
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      // (2)
                      extentRatio: 0.5,
                      motion: const StretchMotion(), // (5)
                      dismissible: DismissiblePane(onDismissed: () {
                        vm.removeList(detail.indexOf(list));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('タスクを削除しました。')));
                      }),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            vm.removeList(detail.indexOf(list));
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Trash',
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: IconButton(
                            onPressed: () {
                              vm.changeSelected(detail.indexOf(list));
                            },
                            icon: list.isSelected
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          title: Text(list.title),
                          subtitle: Text('追加日：$date'),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                }
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: detail.any((e) => e.isSelected) ? () {} : null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: detail.any((e) => e.isSelected)
                            ? Colors.purpleAccent
                            : Colors.grey),
                    child: Text(
                      'チェックしたタスクを完了',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: detail.any((e) => e.isSelected)
                              ? Colors.black
                              : Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}