import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:version_3_22_8/core/domain/model/dash.dart';
import 'package:version_3_22_8/database/dbhelpers/dbhelpers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String name = '', description = '';
  double price = 0.0;

  var dbHelper = DBHelper();
  void getName(String name) {
    this.name = name;
  }

  void getDescription(description) {
    this.description = description;
  }

  void getPrice(price) {
    this.price = double.tryParse(price) ?? 0.0;
  }

  void createData() {
    if (kDebugMode) {
      print('create data');
    }
    setState(() {
      var dish = Dish(name: name, description: description, price: price);
      dbHelper.createDish(dish);
    });
  }

  void readData() {
    if (kDebugMode) {
      print('read data');
    }

    Future<Dish> dishread = dbHelper.readData(name);
    dishread.then((value) {
      if (kDebugMode) {
        print(
            'Name: ${value.name}, Description: ${value.description}, Price: ${value.price}');
      }
    });
  }

  void updateData() {
    if (kDebugMode) {
      print('update data');
    }
    setState(() {
      var dishUpdate = Dish(name: name, description: description, price: price);
      dbHelper.updateDish(dishUpdate);
    });
  }

  void deleteData() {
    if (kDebugMode) {
      print('delete data');
    }
    setState(() {
      dbHelper.deleteDish(name);
    });
  }

  Future<List<Dish>> getAllDishes() async {
    Future<List<Dish>> dishes = dbHelper.readAllDishes();
    return dishes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crud System'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (String name) {
                  getName(name);
                },
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Description'),
                onChanged: (String description) {
                  getDescription(description);
                },
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Price'),
                onChanged: (String price) {
                  getPrice(price);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            createData();
                          },
                          child: const Text("Create")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            readData();
                          },
                          child: const Text("Read")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            updateData();
                          },
                          child: const Text("Update")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            deleteData();
                          },
                          child: const Text("Delete")),
                    )
                  ],
                ),
              ),
              Row(
                children: const [
                  Expanded(child: Text("name")),
                  Expanded(child: Text("description")),
                  Expanded(child: Text("price"))
                ],
              ),
              FutureBuilder<List<Dish>>(
                future: getAllDishes(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(child: Text(snapshot.data![index].name)),
                          Expanded(
                              child: Text(snapshot.data![index].description)),
                          Expanded(
                              child:
                                  Text(snapshot.data![index].price.toString()))
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
