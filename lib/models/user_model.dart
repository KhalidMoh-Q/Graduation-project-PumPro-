class UserModel {
  final String uid;
  final String email;
  final Map<String, dynamic>? calculatorResults;

  UserModel({
    required this.uid,
    required this.email,
    this.calculatorResults,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'calculatorResults': calculatorResults,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      calculatorResults: map['calculatorResults'],
    );
  }
}
