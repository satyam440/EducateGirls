class TblHouseholdEntity{

  String? uniqueCode;
  String? villageCode;
  String? schoolCode;
  int? serial;
  String? hHNo;
  int? childAvailable;
  String? mohallaName;
  String? motherName;
  String? mGRelation;
  String? fatherName;
  String? fGRelation;
  String? mobile;
  int? religion;
  int? socialCategory;
  String? createBy;
  String? createDate;
  String? modifyBy;
  String? modifyDate;
  String? d2dChildCode;
  int? deleteFlag;
  String? deleteBy;
  String? deletedDate;
  int? isEdited;
  String? latitude;
  String? longitude;
  String? surveyStartTime;
  String? surveyEndTime;
  String? districtCode;
  int? surveyStatus;

  TblHouseholdEntity({
    this.socialCategory,
    this.d2dChildCode,
    this.mobile,
    this.motherName,
    this.fatherName,
    this.villageCode,
    this.schoolCode,
    this.createBy,
    this.createDate,
    this.deleteBy,
    this.deleteFlag,
    this.uniqueCode,
    this.modifyDate,
    this.modifyBy,
    this.isEdited,
    this.latitude,
    this.longitude,
    this.serial,
    this.deletedDate,
    this.districtCode,
    this.mohallaName,
    this.childAvailable,
    this.fGRelation,
    this.hHNo,
    this.mGRelation,
    this.religion,
    this.surveyEndTime,
    this.surveyStartTime,
    this.surveyStatus,
});



}