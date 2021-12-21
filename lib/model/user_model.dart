class User {
  String _email;
  String _firstName;
  String _lastName;

  constructorUser({
    String email,
    String firstName,
    String lastName,
  }) {
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
  }

// Properties
  String get email => _email;
  set email(String email) => _email = email;

  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;

// create the ambassador profile from json input
  User.fromJson(Map<dynamic, dynamic> json) {
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
  }

// Export to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = _email;
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;

    return data;
  }
}
