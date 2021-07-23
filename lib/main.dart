import 'dart:developer';

import 'package:apidemo/category_response.dart';
import 'package:apidemo/server_communicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<CategoryResponse>(
            future: getCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<CategoryResponse> snapshot) {
                  var data = snapshot.data!.data!;
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return ListView.builder(
                    itemCount:data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading:
                            Text(data[index].catId.toString()),
                            title:Image.network(baseURL+data[index].catImage!),
                      );
                    },
                  );
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
