import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:info_app/models/personModel.dart';

class PersonDatabaseHelper {
  static PersonDatabaseHelper
      _personDatabaseHelper; //Singleton object of the class

  static Database _database;

  String personTable = 'personTable';
  String personFullName = 'fullName';
  String personEmail = 'email';
  String personPhoneNumber = 'phoneNumber';
  String personPassword = 'password';
  String personBirthDate = 'birthDate';
  String personGender = 'gender';

  PersonDatabaseHelper._createInstance();
  factory PersonDatabaseHelper() {
    //initializing the object
    if (_personDatabaseHelper == null) {
      _personDatabaseHelper = PersonDatabaseHelper._createInstance();
    }
    return _personDatabaseHelper;
  }

  // Getter for our database
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // Function to initialize the database
  Future<Database> initializeDatabase() async {
    // Getting directory path for both Android and Ios

    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'person.db';

    // Open or create database at a given path.
    var personDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    print("Database Created");

    // _createDb(personDatabase, 1);
    // print("Table created");

    return personDatabase;
  }

  // Function for creating a Database,
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE personTable ($personFullName TEXT, $personEmail VARCHAR PRIMARY KEY, $personPhoneNumber TEXT UNIQUE, $personPassword VARCHAR, $personBirthDate TEXT, $personGender TEXT)');
  }

  // Functions for CRUD operations

  //Fetch operation
  Future<List<Map<String, dynamic>>> getPerson(String email) async {
    Database db = await this.database;

    var result = await db.rawQuery(
        'SELECT * FROM $personTable WHERE $personFullName = \'$email\' ');
    return result;
  }

  // Insert Operation
  Future<int> insertPerson(Person person) async {
    Database db = await this.database;

    var result = await db.insert(personTable, person.toMap());
    print("Person details inserted in the table.");
    return result;
  }

  // Update Operation
  Future<int> updatePerson(Person person) async {
    Database db = await this.database;

    var result = await db.update(personTable, person.toMap(),
        where: '$personEmail = ?', whereArgs: [person.email]);
    return result;
  }

  // Delete Operation
  Future<int> deletePerson(String email) async {
    Database db = await this.database;

    var result = await db
        .rawDelete('DELETE FROM $personTable WHERE $personEmail = $email');
    return result;
  }
}
