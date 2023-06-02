class TblUserLoginEntity{

  String? uniqueID;
  String? userID;
  String? loginTime;
  String? logoutTime;
  String? isUpload;
  String? latitudeLogin;
  String? longitudeLogin;
  String? latitudeLogout;
  String? longitudeLogout;
  String? date;


  TblUserLoginEntity({
    this.date,
    this.isUpload,
    this.latitudeLogin,
    this.latitudeLogout,
    this.loginTime,
    this.logoutTime,
    this.longitudeLogin,
    this.longitudeLogout,
    this.uniqueID,
    this.userID,
});


  TblUserLoginEntity.fromJson(Map<String , dynamic> json) {
    uniqueID = json["UniqueId"];
    userID = json["UserId"];
    date = json["Date"];
    isUpload = json["IsUpload"];
    latitudeLogin = json["LatitudeLogin"];
    latitudeLogout = json["LatitudeLogout"];
    loginTime = json["LoginTime"];
    logoutTime = json["LogoutTime"];
    longitudeLogin = json["LongitudeLogin"];
    longitudeLogout = json["LongitudeLogout"];

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["UniqueId"] = uniqueID;
    data["UserId"] = userID;
    data["Date"] = date;
    data["IsUpload"] = isUpload;
    data["LatitudeLogin"] = latitudeLogin;
    data["LatitudeLogout"] = latitudeLogout;
    data["LoginTime"] = loginTime;
    data["LogoutTime"] = logoutTime;
    data["LongitudeLogin"] = longitudeLogin;
    data["LongitudeLogout"] = longitudeLogout;

    return data;
  }
}