import 'package:counter_getx/simple_crud_controller.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleCrudApp extends StatefulWidget {
  const SimpleCrudApp({super.key});

  @override
  State<SimpleCrudApp> createState() => _SimpleCrudAppState();
}

class _SimpleCrudAppState extends State<SimpleCrudApp> {
  final simpleCRUDController = Get.put(SimpleCRUDController());
  addView() {
    final edtInput = TextEditingController();
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(
            controller: edtInput,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.add(edtInput.text);
                Navigator.pop(context);
                DInfo.toastSuccess('Success Add Data');
              },
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }

  updateView(String oldData, int index) {
    final edtInput = TextEditingController();
    edtInput.text = oldData;
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: edtInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.updateItem(
                  index,
                  edtInput.text,
                );
                Navigator.pop(context);
                DInfo.toastSuccess('Success Update Data');
              },
              child: const Text('Update'),
            ),
          ),
        ],
      ),
    );
  }

  deleteView(String oldData, int index) {
    DInfo.dialogConfirmation(
      context,
      'Delete',
      'You sure want to delet $oldData?',
    ).then((yes) => {
          if (yes ?? false) {simpleCRUDController.delete(index)}
        });
  }

  @override
  void dispose() {
    simpleCRUDController.clearState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //List list = ['Pokemon', 'Doraemon', 'Ultramen'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Crud'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              addView();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GetBuilder<SimpleCRUDController>(
        //init: SimpleCRUDController(),
        builder: (controller) {
          List<String> list = controller.list;
          if (list.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              String item = list[index];
              return ListTile(
                leading: IconButton.filled(
                  onPressed: () => updateView(item, index),
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                ),
                title: Text(item),
                trailing: IconButton.filled(
                  onPressed: () => deleteView(item, index),
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
