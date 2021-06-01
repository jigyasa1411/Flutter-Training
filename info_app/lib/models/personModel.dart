import 'package:info_app/models/gender.dart';

class Person {
  String _fullName;
  String _email;
  String _phoneNumber;
  String _password;
  //String _confirmPassword;
  String _birthDate;
  Gender _gender;

  Person(
    this._fullName,
    this._email,
    this._phoneNumber,
    this._password,
    //this._confirmPassword,
    this._birthDate,
    this._gender,
  );

// Getter
  String get fullName => _fullName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get birthDate => _birthDate;
  Gender get gender => _gender;

//Setter
  set fullName(String newName) {
    if (newName != null) {
      this._fullName = newName;
    }
  }

  set email(String newEmail) {
    if (newEmail != null) {
      this._email = newEmail;
    }
  }

  set phoneNumber(String newPhoneNumber) {
    this._phoneNumber = newPhoneNumber;
  }

  set password(String newPassword) {
    if (newPassword != null) {
      this._password = newPassword;
    }
  }

  set birthDate(String newBirthDate) {
    this._birthDate = newBirthDate;
  }

  set gender(Gender newGender) {
    if (newGender != null) {
      this._gender = newGender;
    }
  }

// Convering person schema into Map.
  Map<dynamic, dynamic> toMap() {
    var map = Map<dynamic, dynamic>();

    map['fullName'] = _fullName;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    map['birthDate'] = _birthDate;
    map[gender] = _gender;

    return map;
  }

  // Function which will help us extract a person object from a Map object.
  Person.fromMapObject(Map<dynamic, dynamic> map) {
    this._fullName = map['fullName'];
    this._email = map['email'];
    this._phoneNumber = map['phoneNumber'];
    this._password = map['password'];
    this._birthDate = map['birthDate'];
    this._gender = map[gender];
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // @override
  // String toString() {
  //   return 'Person {fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password, birthDate: $birthDate, gender: $gender}';
  // }
}
