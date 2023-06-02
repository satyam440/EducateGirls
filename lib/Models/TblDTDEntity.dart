class TblDTDEntity {

  String? uniqueCode;
  String? uniqueChildCode;
  String? villageCode;
  String? schoolCode;
  int? serial;
  String? childName;
  int? gender;
  int? dOBAvailable;
  String? dOB;
  int? ageAson;
  int? aadharAvailable;
  int? educationStatus;
  //className is actually class
  int? className;
  String? anganwadiWorkerName;
  int? reason;
  int? isPrivateSchool;
  String? dOEnrolledSchool;
  String? otherSchool;
  String? specialAttentionFamily;
  int? specialNeedChild;
  String? createDate;
  String? createBy;
  String? modifyDate;
  String? modifyBy;
  String? enrollCode;
  int? enrollStatus;
  String? deletedDate;
  String? deleteBy;
  int? deleteFlag;
  int? isEdited;
  String? aadharNumber;
  String? specialAttentionFamilyOther;
  String? specialNeedChildOther;
  int? covidReasonID;
  String? latitude;
  String? longitude;
  String? districtCode;


  TblDTDEntity({
    this.districtCode,
    this.villageCode,
    this.schoolCode,
    this.gender,
    this.aadharNumber,
    this.aadharAvailable,
    this.ageAson,
    this.anganwadiWorkerName,
    this.childName,
    this.className,
    this.covidReasonID,
    this.createBy,
    this.createDate,
    this.deleteBy,
    this.deletedDate,
    this.deleteFlag,
    this.dOB,
    this.dOBAvailable,
    this.dOEnrolledSchool,
    this.educationStatus,
    this.enrollCode,
    this.enrollStatus,
    this.isEdited,
    this.isPrivateSchool,
    this.latitude,
    this.longitude,
    this.modifyBy,
    this.modifyDate,
    this.otherSchool,
    this.reason,
    this.serial,
    this.specialAttentionFamily,
    this.specialAttentionFamilyOther,
    this.specialNeedChild,
    this.specialNeedChildOther,
    this.uniqueChildCode,
    this.uniqueCode
  });



  TblDTDEntity.fromJson(Map<String, dynamic> json) {
    uniqueCode = json["UniqueCode"];
    uniqueChildCode = json["UniqueChildCode"];
    specialNeedChildOther = json["SpecialNeedChildOther"];
    specialNeedChild = json["SpecialNeedChild"];
    specialAttentionFamilyOther = json["SpecialAttentionFamilyOther"];
    specialAttentionFamily = json["SpecialAttentionFamily"];
    serial = json["Serial"];
    otherSchool = json["OtherSchool"];
    modifyDate = json["ModifyDate"];
    modifyBy = json["ModifyBy"];
    longitude = json["Longitude"];
    latitude = json["Latitude"];
    isPrivateSchool = json["IsPrivateSchool"];
    isEdited = json["IsEdited"];
    enrollStatus = json["EnrollStatus"];
    enrollCode = json["EnrollCode"];
    educationStatus = json["EducationStatus"];
    dOEnrolledSchool = json["DOEnrolledSchool"];
    dOBAvailable = json["DOBAvailable"];
    dOB = json["DOB"];
    deleteFlag = json["DeleteFlag"];
    deletedDate = json["DeletedDate"];
    deleteBy = json["DeleteBy"];
    createDate = json["CreateDate"];
    createBy = json["CreateBy"];
    covidReasonID = json["CovidReasonID"];
    className = json["ClassName"];
    anganwadiWorkerName = json["AnganwadiWorkerName"];
    ageAson = json["AgeAson"];
    aadharAvailable = json["AadharAvailable"];
    gender = json["Gender"];
    schoolCode = json["SchoolCode"];
    villageCode = json["VillageCode"];
    districtCode = json["DistrictCode"];
  }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["UniqueCode"] = uniqueCode;
    data["UniqueChildCode"] = uniqueChildCode;
    data["SpecialNeedChildOther"] = specialNeedChildOther;
    data["SpecialNeedChild"] = specialNeedChild;
    data["SpecialAttentionFamilyOther"] = specialAttentionFamilyOther;
    data["SpecialAttentionFamily"] = specialAttentionFamily;
    data["Serial"] = serial;
    data["OtherSchool"] = otherSchool;
    data["ModifyDate"] = modifyDate;
    data["ModifyBy"] = modifyBy;
    data["Longitude"] = longitude;
    data["Latitude"] = latitude;
    data["IsPrivateSchool"] = isPrivateSchool;
    data["IsEdited"] = isEdited;
    data["DistrictCode"] = districtCode;
    data["VillageCode"] = villageCode;
    data["SchoolCode"] = schoolCode;
    data["Gender"] = gender;
    data["AadharAvailable"] = aadharAvailable;
    data["AgeAson"] = ageAson;
    data["AnganwadiWorkerName"] = anganwadiWorkerName;
    data["ClassName"] = className;
    data["CovidReasonID"] = covidReasonID;
    data["DistrictCode"] = districtCode;
    data["CreateBy"] = createBy;
    data["CreateDate"] = createDate;
    data["DeleteBy"] = deleteBy;
    data["DeletedDate"] = deletedDate;
    data["DeleteFlag"] = deleteFlag;
    data["DOB"] = dOB;
    data["DOBAvailable"] = dOBAvailable;
    data["DOEnrolledSchool"] = dOEnrolledSchool;
    data["EducationStatus"] = educationStatus;
    data["EnrollCode"] = enrollCode;
    data["EnrollStatus"] = enrollStatus;
    return data;
  }
}