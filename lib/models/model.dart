class LoginModel {
  String? loggedInUserID;
  String? rolename;
  String? accessToken;
  String? refreshToken;
  String? created;
  String? expires;
  Null? errormsg;

  LoginModel(
      {this.loggedInUserID,
        this.rolename,
        this.accessToken,
        this.refreshToken,
        this.created,
        this.expires,
        this.errormsg});

  LoginModel.fromJson(Map<String, dynamic> json) {
    loggedInUserID = json['loggedInUserID'];
    rolename = json['rolename'];
    accessToken = json['access_Token'];
    refreshToken = json['refresh_Token'];
    created = json['created'];
    expires = json['expires'];
    errormsg = json['errormsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loggedInUserID'] = this.loggedInUserID;
    data['rolename'] = this.rolename;
    data['access_Token'] = this.accessToken;
    data['refresh_Token'] = this.refreshToken;
    data['created'] = this.created;
    data['expires'] = this.expires;
    data['errormsg'] = this.errormsg;
    return data;
  }
}
