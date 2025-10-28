import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:version_3_22_8/core/repository/auth_repository.dart';
import 'package:version_3_22_8/features/login/bloc/login_bloc.dart';
import 'package:version_3_22_8/features/login/pages/login_view.dart';
import 'package:version_3_22_8/features/login/repository/repositories.dart';
import 'package:version_3_22_8/features/sqlite/presentation/domain/entities/dog.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),

    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Create a Dog and add it to the dogs table
  var fido = const Dog(id: 3, name: 'Fidou', age: 36);

  await insertDog(fido);

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return dogMaps.map((map) {
      return Dog(
          id: map['id'] as int,
          name: map['name'] as String,
          age: map['age'] as int);
    }).toList();
  }

// Now, use the method above to retrieve all the dogs.
  if (kDebugMode) {
    print(await dogs());
  } // Prints a list that include Fido.

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  // Update Fido's age and save it to the database.
  fido = Dog(id: fido.id, name: fido.name, age: fido.age + 7);
  await updateDog(fido);
  if (kDebugMode) {
    print(await dogs());
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  await deleteDog(1);
  if (kDebugMode) {
    print(await dogs());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AuthRepsotory authRepsotory = AuthRepsotory();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => AuthenticationRepository(),
            dispose: (repository) => repository,
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: BlocProvider(
          create: (context) => LoginBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
              userRepository: context.read<UserRepository>())
            ..add(AuthenticationSubscriptionRequested()),
          child:  LoginScreen(),
        ),
      ),
      // routes: {
      //   '/login': (context) => const LoginScreen(),
      // },
    );
  }
}
