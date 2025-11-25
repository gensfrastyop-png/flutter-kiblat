import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class InfoListPage extends StatelessWidget {
  final List<String> data = ["Info 1", "Info 2", "Info 3", "Info 4"];

  InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Informasi")),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(data[i]),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.explore),
        onPressed: () => Navigator.pushNamed(context, '/qibla'),
      ),
    );
  }
}
