// import 'dart:async';
// import 'package:flutter/widgets.dart';
// //import 'package:info_app/models/gender.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// // Defining Information class model

// class Person {
//   String fullName;
//   String email;
//   String phoneNumber;
//   String password;
//   String confirmPassword;
//   String birthDate;
//   String gender;

//   Person({
//     this.fullName,
//     this.email,
//     this.phoneNumber,
//     this.password,
//     this.confirmPassword,
//     this.birthDate,
//     this.gender,
//   });

// // Convering person schema into Map.
//   Map<String, dynamic> toMap() {
//     return {
//       'fullName': fullName,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'password': password,
//       'confirmPassword': confirmPassword,
//       'birthDate': birthDate,
//       'gender': gender
//     };
//   }

//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'Person{fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password, confirmPassword: $confirmPassword, birthDate: $birthDate}, gender: $gender';
//   }
// }

// class DatabasePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// Future<Database> main() async {
//   final database = openDatabase(
//     join(await getDatabasesPath(), 'person_database.db'),

//     // Creating schema of person
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE dogs(fullName TEXT, email TEXT PRIMARY KEY, password TEXT, confirmPassword TEXT, birthDate TEXT, gender TEXT)',
//       );
//     },
//     version: 1,
//   );
//   return database;
// }

// Future<void> insertPerson(Person person) async {
//   // Get a reference to the database.
//   final db = await main();

//   // Insert the Dog into the correct table. You might also specify the
//   // `conflictAlgorithm` to use in case the same dog is inserted twice.
//   //
//   // In this case, replace any previous data.
//   await db.insert(
//     'persons',
//     person.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
//   print("Inserted!!");
// }

// Future<List<Person>> persons() async {
//   // Get a reference to the database.
//   final db = await openDatabase('person_database.db');

//   // Query the table for all The Dogs.
//   final List<Map<String, dynamic>> maps = await db.query('persons');

//   // Convert the List<Map<String, dynamic> into a List<Dog>.
//   return List.generate(maps.length, (i) {
//     return Person(
//       fullName: maps[i]['fullName'],
//       email: maps[i]['email'],
//       phoneNumber: maps[i]['phoneNumber'],
//       password: maps[i]['password'],
//       confirmPassword: maps[i]['confirmPassword'],
//       birthDate: maps[i]['birthDate'],
//       gender: maps[i]['gender'],
//     );
//   });
// }

// // Opening the database
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   final database = openDatabase(
// //     join(await getDatabasesPath(), 'person_database.db'),

// //     // Creating schema of person
// //     onCreate: (db, version) {
// //       // Run the CREATE TABLE statement on the database.
// //       return db.execute(
// //         'CREATE TABLE dogs(fullName TEXT, email TEXT PRIMARY KEY, password TEXT, confirmPassword TEXT, birthDate TEXT, gender TEXT)',
// //       );
// //     },
// //     version: 1,
// //   );

// //   // Future<void> insertPerson(Person person) async {
// //   //   final database = openDatabase(
// //   //     join(await getDatabasesPath(), 'person_database.db'),

// //   //     // Creating schema of person
// //   //     onCreate: (db, version) {
// //   //       // Run the CREATE TABLE statement on the database.
// //   //       return db.execute(
// //   //         'CREATE TABLE dogs(fullName TEXT, email TEXT PRIMARY KEY, password TEXT, confirmPassword TEXT, birthDate TEXT, gender TEXT)',
// //   //       );
// //   //     },
// //   //     version: 1,
// //   //   );
// //   //   // Get a reference to the database.
// //   //   final db = await database;

// //   //   // Insert the Dog into the correct table. You might also specify the
// //   //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
// //   //   //
// //   //   // In this case, replace any previous data.
// //   //   await db.insert(
// //   //     'persons',
// //   //     person.toMap(),
// //   //     conflictAlgorithm: ConflictAlgorithm.replace,
// //   //   );
// //   // }

// // // A method that retrieves all the dogs from the dogs table.
// //   Future<List<Person>> persons() async {
// //     // Get a reference to the database.
// //     final db = await database;

// //     // Query the table for all The Dogs.
// //     final List<Map<String, dynamic>> maps = await db.query('persons');

// //     // Convert the List<Map<String, dynamic> into a List<Dog>.
// //     return List.generate(maps.length, (i) {
// //       return Person(
// //         fullName: maps[i]['fullName'],
// //         email: maps[i]['email'],
// //         phoneNumber: maps[i]['phoneNumber'],
// //         password: maps[i]['password'],
// //         confirmPassword: maps[i]['confirmPassword'],
// //         birthDate: maps[i]['birthDate'],
// //         gender: maps[i]['gender'],
// //       );
// //     });
// //   }

// //   // Future<void> updatePerson(Person person) async {
// //   //   // Get a reference to the database.
// //   //   final db = await database;

// //   //   // Update the given Dog.
// //   //   var update = db.update(
// //   //     'persons',
// //   //     person.toMap(),
// //   //     // Ensure that the person has a matching email.
// //   //     where: 'email = ?',
// //   //     // Pass the Dog's id as a whereArg to prevent SQL injection.
// //   //     whereArgs: [person.email],
// //   //   );
// //   //   await update;
// //   // }

// //   // Future<void> deletePerson(String email) async {
// //   //   // Get a reference to the database.
// //   //   final db = await database;

// //   //   // Remove the Dog from the database.
// //   //   await db.delete(
// //   //     'persons',
// //   //     // Use a `where` clause to delete a specific dog.
// //   //     where: 'email = ?',
// //   //     // Pass the Dog's id as a whereArg to prevent SQL injection.
// //   //     whereArgs: [email],
// //   //   );
// //   // }

// //   //*********************************************************************************** */
// //   // Create a Dog and add it to the dogs table
// //   // Create a Dog and add it to the dogs table
// //   var jigyasa = Person(
// //     fullName: 'Jigyasa Chaudhary',
// //     email: 'jigyasa123@gmail.com',
// //     phoneNumber: '1234567890',
// //     password: 'Abc123%%',
// //     confirmPassword: 'Abc123%%',
// //     birthDate: '1999/14/11',
// //     gender: 'Female',
// //   );

// //   await insertPerson(jigyasa);

// //   // Now, use the method above to retrieve all the dogs.
// //   print(await persons()); // Prints a list that include Fido.

// // //   // Update Fido's age and save it to the database.
// // //   jigyasa = Person(
// // //     email: jigyasa.id,
// // //     name: fido.name,
// // //     age: fido.age + 7,
// // //   );
// // //   await updateDog(fido);

// // //   // Print the updated results.
// // //   print(await dogs()); // Prints Fido with age 42.

// // //   // Delete Fido from the database.
// // //   await deleteDog(fido.id);

// // //   // Print the list of dogs (empty).
// // //   print(await dogs());
// // }
