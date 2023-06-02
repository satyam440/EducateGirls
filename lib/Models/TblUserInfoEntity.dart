class TblUserInfoEntity{
  int? userInfoID;
  String? userGUID;
  int? userID;
  String? dISECode;
  String? teacherName;
  String? designation;
  String? userName;
  String? mobileNo;
  String? password;
  String? schoolName;
  String? villageCode;
  String? panchayatCode;
  String? blockCode;
  String? districtCode;
  String? stateCode;
  String? schoolCode;
  String? mohallaName;
  int? isDeleted;
  int? createdBy;
  int? count;
  String? emailId;
  String? otherDesignation;

  TblUserInfoEntity({
    this.userID,
    this.districtCode,
    this.mohallaName,
    this.schoolCode,
    this.villageCode,
    this.blockCode,
    this.stateCode,
    this.panchayatCode,
    this.userName,
    this.password,
    this.isDeleted,
    this.teacherName,
    this.createdBy,
    this.mobileNo,
    this.count,
    this.designation,
    this.dISECode,
    this.emailId,
    this.otherDesignation,
    this.schoolName,
    this.userGUID,
    this.userInfoID,
});

  TblUserInfoEntity.fromJson(Map<String, dynamic> json) {
    userInfoID = json["UserInfoID"];
    userGUID = json["UserGUID"];
    schoolName = json["SchoolName"];
    otherDesignation = json["OtherDesignation"];
    emailId = json["EmailId"];
    dISECode = json["DISECode"];
    designation = json["Designation"];
    count = json["Count"];
    mobileNo = json["MobileNo"];
    createdBy = json["CreatedBy"];
    teacherName = json["TeacherName"];
    isDeleted = json["IsDeleted"];
    password = json["Password"];
    userName = json["UserName"];
    panchayatCode = json["PanchayatCode"];
    stateCode = json["StateCode"];
    blockCode = json["BlockCode"];
    villageCode = json["VillageCode"];
    schoolCode = json["SchoolCode"];
    mohallaName = json["MohallaName"];
    districtCode = json["DistrictCode"];
    userID = json["UserID"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["UserID"] = userID;
    data["MohallaName"] = mohallaName;
    data["SchoolCode"] = schoolCode;
    data["VillageCode"] = villageCode;
    data["StateCode"] = stateCode;
    data["PanchayatCode"] = panchayatCode;
    data["UserName"] = userName;
    data["Password"] = password;
    data["IsDeleted"] = isDeleted;
    data["TeacherName"] = teacherName;
    data["CreatedBy"] = createdBy;
    data["MobileNo"] = mobileNo;
    data["Count"] = count;
    data["Designation"] = designation;
    data["DISECode"] = dISECode;
    data["EmailId"] = emailId;
    data["OtherDesignation"] = otherDesignation;
    data["SchoolName"] = schoolName;
    data["UserGUID"] = userGUID;
    data["UserInfoID"] = userInfoID;
    return data;
  }
}