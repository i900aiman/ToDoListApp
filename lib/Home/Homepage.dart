import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_list_app/Home/Addpage.dart';
import 'package:to_do_list_app/Model/AlbumModel.dart';
import 'package:to_do_list_app/Network/Repository.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Album> listAlbum = [];
  Repository repository = Repository();

  getData() async {
    listAlbum = await repository.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listAlbum[index].id),
                  Text(listAlbum[index].content),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listAlbum.length),
      floatingActionButton: FloatingActionButton(onPressed: navigateToAddPage),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddPage());
    Navigator.of(context).popAndPushNamed('/addPage');
  }
}
