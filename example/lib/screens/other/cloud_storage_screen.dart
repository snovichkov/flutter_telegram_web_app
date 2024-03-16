import 'package:example/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class CloudStorageScreen extends StatefulWidget {
  const CloudStorageScreen({super.key});

  @override
  State<CloudStorageScreen> createState() => _CloudStorageScreenState();
}

class _CloudStorageScreenState extends State<CloudStorageScreen> {
  CloudStorage get cloudStorage => TelegramWebApp.instance.cloudStorage;

  TextEditingController setItemKeyController = TextEditingController();
  TextEditingController setItemValueController = TextEditingController();
  TextEditingController getItemController = TextEditingController();
  TextEditingController removeItemController = TextEditingController();

  void onSetItemCallback(String? error, [bool? isStored]) {
    showSnackbar("Error: $error\nisStored: $isStored");
  }

  void onGetItemCallback(String? error, [String? result]) {
    showSnackbar("Error: $error\nresult: $result");
  }

  void onRemoveItemCallback(String? error, [bool? removed]) {
    showSnackbar("Error: $error\nremoved: $removed");
  }

  void onGetKeysCallback(String? error, [List<String>? keys]) {
    showSnackbar("Error: $error\nkeys: ${keys.toString()}");
  }

  void onGetKeysForGetItemsCallback(String? error, [List<String>? keys]) {
    if (error == null && keys != null) {
      cloudStorage.getItems(keys, onGetItemsCallback);
    } else {
      showSnackbar("Error: $error\nkeys: ${keys.toString()}");
    }
  }

  void onGetItemsCallback(String? error, List<dynamic>? values) {
    try {
      String res = '';
      if (values != null) {
        for (var cur in values) {
          res += ", $cur";
        }
      }
      showSnackbar("Error: $error\nValues: $res");
    } catch (e) {
      showSnackbar("Error happened: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cloud Storage')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// **************** Set Item method ***************
            const TitleWidget('setItem(key, value)'),
            const SizedBox(height: 4),
            TextField(
              controller: setItemKeyController,
              decoration: const InputDecoration(labelText: 'Key'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: setItemValueController,
              decoration: const InputDecoration(labelText: 'Value'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  cloudStorage.setItem(
                    setItemKeyController.text,
                    setItemValueController.text,
                    onSetItemCallback,
                  );
                },
                child: const Text('setItem')),
            const SizedBox(height: 24),
            const Divider(height: 12),

            /// **************** Get Item method ***************
            const TitleWidget('getItem(key)'),
            const SizedBox(height: 4),
            TextField(
              controller: getItemController,
              decoration: const InputDecoration(labelText: 'Key'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  cloudStorage.getItem(
                    getItemController.text,
                    onGetItemCallback,
                  );
                },
                child: const Text('getItem')),
            const SizedBox(height: 24),
            const Divider(height: 12),

            /// **************** Remove Item method ***************
            const TitleWidget('removeItem(key)'),
            const SizedBox(height: 4),
            TextField(
              controller: removeItemController,
              decoration: const InputDecoration(labelText: 'Key'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  cloudStorage.removeItem(
                    removeItemController.text,
                    onRemoveItemCallback,
                  );
                },
                child: const Text('removeItem')),
            const SizedBox(height: 24),
            const Divider(height: 12),

            /// **************** Get Keys method ***************
            const TitleWidget('getKeys'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => cloudStorage.getKeys(onGetKeysCallback),
                child: const Text('getKeys')),

            const SizedBox(height: 24),
            const Divider(height: 12),

            /// **************** Get All Items method ***************
            const TitleWidget('Get all items'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => cloudStorage.getKeys(onGetKeysForGetItemsCallback),
                child: const Text('Get All Items')),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void showSnackbar(String value) {
    var snackBar = SnackBar(content: Text(value));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
