import 'package:info_app/helper/personDatabaseHelper.dart';

bool value = true;
Future<bool> checkCredentials(String email, String password) async {
  String checkEmail;
  String checkPassword;

  PersonDatabaseHelper person = new PersonDatabaseHelper();
  // Initialise the database
  // await person.initializeDatabase();

  // Fetching
  var info = await person.getPerson(email);

  for (int i = 0; i < info.length; i++) {
    if (info[i].values.toString() == email) {
      checkEmail = info[i].values.toString();
    }

    if (info[i].values.toString() == password) {
      checkPassword = info[i].values.toString();
    }
  }

  if (email == checkEmail && password == checkPassword) {
    value = true;
  } else {
    value = false;
  }
  return value;
}
