// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list_app/Network/Repository.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Repository repository = Repository();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: contentController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: SubmitData, child: Text('Submit'))
        ],
      ),
    );
  }

  void SubmitData() async {
    bool response =
        await repository.postData(titleController.text, contentController.text);
    if (response) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      print('post data gagal');
    }
  }
}
