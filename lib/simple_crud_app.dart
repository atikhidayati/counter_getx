import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';

class SimpleCrudApp extends StatefulWidget {
  const SimpleCrudApp({super.key});

  @override
  State<SimpleCrudApp> createState() => _SimpleCrudAppState();
}

class _SimpleCrudAppState extends State<SimpleCrudApp> {
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
              onPressed: () {},
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
              onPressed: () {},
              child: const Text('Update'),
            ),
          ),
        ],
      ),
    );
  }

  deleteView(String oldData, int index) {
    DInfo.dialogConfirmation(
        context, 'Delete', 'You sure want to delet $oldData?');
  }

  @override
  Widget build(BuildContext context) {
    List list = ['Pokemon', 'Doraemon', 'Ultramen'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Crud'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            String item = list[index];
            return ListTile(
              leading: IconButton.filled(
                onPressed: () => deleteView(item, index),
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
          }),
    );
  }
}
