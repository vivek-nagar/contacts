class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String email;
  final String address;
  final String time;
  UserModel(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.mobileNo,
      required this.email,
      required this.address,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNo': mobileNo,
      'email': email,
      'address': address,
      'time': time,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobileNo: map['mobileNo'],
      email: map['email'],
      address: map['address'],
      time: map['time'],
    );
  }
}
