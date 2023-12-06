class AuthResponse {
  AuthResponse({
      String? message, 
      User? user, 
      String? token,
      String? statusMsg,}){
    _message = message;
    _user = user;
    _token = token;
    _statusMsg = statusMsg;
}

  AuthResponse.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _statusMsg = json['statusMsg'];
  }
  String? _message;
  User? _user;
  String? _token;
  String? _statusMsg;
AuthResponse copyWith({  String? message,
  User? user,
  String? token,
  String? statusMsg,
}) => AuthResponse(  message: message ?? _message,
  user: user ?? _user,
  token: token ?? _token,
    statusMsg: statusMsg?? _statusMsg
);
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;
  String? get statusMsg=> _statusMsg;


}

class User {
  static String currentUserToken ="";
  User({
      String? name, 
      String? email,
      String? role,}){
    _name = name;
    _email = email;
    _role = role;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _role = json['role'];
  }
  String? _name;
  String? _email;
  String? _role;
User copyWith({  String? name,
  String? email,
  String? role,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  role: role ?? _role,
);
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;



}