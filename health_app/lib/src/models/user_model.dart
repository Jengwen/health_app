class user {
  int id;
  String name;
  String email;
  String password;
  String applicationUserID;
  Null account;

  user(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.applicationUserID,
      this.account});

  user.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    applicationUserID = json['applicationUserID'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userData = new Map<String, dynamic>();
    userData['id'] = this.id;
    userData['name'] = this.name;
    userData['email'] = this.email;
    userData['password'] = this.password;
    userData['applicationUserID'] = this.applicationUserID;
    userData['account'] = this.account;
    return userData;
  }
}
