import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:preperlist/src/models/supply_item.dart';
import 'package:preperlist/src/repository/supply_list_repo.dart';

class AddSupplyPage extends StatefulWidget {
  // define any variables we may need
  const AddSupplyPage({super.key, required this.title});

  final String title;

  // create the state
  @override
  State<AddSupplyPage> createState() => _AddSupplyState();
}

class _AddSupplyState extends State<AddSupplyPage> {
  List<SupplyItem> supplyList = [];
  SupplyItem supplyItem = SupplyItem("", "");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void handleSubmit() {
    final FormState? form = formKey.currentState;
    SupplyListRepo repo = SupplyListRepo();

    if (formKey.currentState!.validate()) {
      print('form was validated');

      if (form != null) {
        print(Text("About to save the form: ${form.toString()}"));
        form.save();
        form.reset();
        repo.pushSupplyData(supplyItem);
        createSnackBar(supplyItem);
      } else {
        print(const Text("the form was null"));
      }
    } else {
      print(const Text("the form was not validated. "));
    }
  }

  void createSnackBar(SupplyItem newSupplyItem) {
    final snackBar = SnackBar(
      content: Text('Successfuly Created Item: ${newSupplyItem.supplyName}'),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle ourButtonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        elevation: 15.0,
        padding: const EdgeInsets.all(20.0));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(30),
          child: Title(
              color: Colors.black,
              child: const Text("- Enter New Supply Item -",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold))),
        ),
        Flexible(
          flex: 0,
          child: Center(
            child: Form(
              key: formKey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Supply Category'),
                        initialValue: "",
                        onSaved: (val) =>
                            supplyItem.category = val?.toLowerCase(),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            print('here is val $val');
                          }
                          return null;
                        }),
                  ),
                  ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Supply Item Name'),
                        initialValue: "",
                        onSaved: (val) {
                          supplyItem.supplyName = val?.toLowerCase();
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            print('here is val $val');
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(height: 50),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        handleSubmit();
                        createSnackBar(supplyItem);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }
}
