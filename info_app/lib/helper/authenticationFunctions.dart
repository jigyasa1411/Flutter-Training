import 'package:info_app/helper/personDatabaseHelper.dart';
import 'package:info_app/models/gender.dart';
import 'package:info_app/models/personModel.dart';

Future<bool> checkCredentials(String email, String password) async {
  bool value = true;
  PersonDatabaseHelper person = new PersonDatabaseHelper();
  // Initialise the database
  // await person.initializeDatabase();

  // Fetching
  var info = await person.getPerson(email);

  List<Person> listPerson = [];
  info.forEach((element) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  });

  listPerson.forEach((element) {
    if (element.password == password && element.email == email) {
      value = true;
    }
  });

  return value;
}

// Get list of persons

String name;
String email;
Gender gender;
String birthDate;
String phoneNumber;
getList(List<Person> listPerson) async {
  PersonDatabaseHelper person = new PersonDatabaseHelper();
  var info = await person.getPerson(email);

  //listPerson = [];
  info.forEach((element) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  });
}

//String name;

Future<List<dynamic>> getInfoList(String email) async {
  PersonDatabaseHelper person = new PersonDatabaseHelper();
  var info = await person.getPerson(email);

  List<Person> listPerson = [];
  info.forEach((element) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  });

  List<dynamic> personInfoList = [];

  listPerson.forEach((element) {
    name = element.fullName;
    personInfoList.add(name);
    email = element.email;
    personInfoList.add(email);
    birthDate = element.birthDate;
    personInfoList.add(birthDate);
    gender = element.gender;
    personInfoList.add(gender);
    phoneNumber = element.phoneNumber;
    personInfoList.add(phoneNumber);
  });

  print(personInfoList);

  return personInfoList;
}

Future<List<dynamic>> getPersonList(String email) async {
  List<dynamic> personList;
  personList = await getInfoList(email);
  return personList;
}
