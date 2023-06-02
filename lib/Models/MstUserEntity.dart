class MstUserEntity{

  int? userId;
  String? userName;
  String? password;
  String? userLevel;
  String? stateCode;
  String? districtCode;
  String? blockCode;
  String? firstName;
  String? lastname;
  String? userCreateBy;
  String? userCreateDate;
  int? activeStatus;


  MstUserEntity({
    this.stateCode,
    this.districtCode,
    this.blockCode,
    this.password,
    this.firstName,
    this.activeStatus,
    this.lastname,
    this.userCreateBy,
    this.userCreateDate,
    this.userLevel,
    this.userName,
    this.userId
});


  MstUserEntity.fromJson(Map<String , dynamic> json) {
    stateCode = json["StateCode"];
    districtCode = json["DistrictCode"];
    blockCode = json["BlockCode"];
    password = json["password"];
    firstName = json["firstName"];
    activeStatus = json["activeStatus"];
    lastname = json["lastname"];
    userCreateBy = json["userCreateBy"];
    userLevel = json["userLevel"];
    userName = json["userName"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, double>{};
    data["StateCode"] = stateCode;
    data["DistrictCode"] = districtCode;
    data["BlockCode"] = blockCode;
    data["Password"] = password;
    data["FirstName"] = firstName;
    data["ActiveStatus"] = activeStatus;
    data["ActiveStatus"] = userCreateBy;
    data["UserLevel"] = userLevel;
    data["Lastname"] = lastname;
    data["userName"] = userName;
    data["UserId"] = userId;
    return data;
  }
}