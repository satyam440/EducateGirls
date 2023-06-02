class MstDistrictEntity {
  String? stateCode;
  String? districtCode;
  String? districtName;
  String? districtShort;
  String? nameLocalLng;
  String? fYear;

  MstDistrictEntity({
    this.stateCode,
    this.fYear,
    this.districtCode,
    this.districtShort,
    this.districtName,
    this.nameLocalLng,
});


  MstDistrictEntity.fromJson(Map<String , dynamic> json) {
    stateCode = json["StateCode"];
    districtCode = json["DistrictCode"];
    districtName = json["DistrictName"];
    nameLocalLng = json["NameLocalLng"];
    fYear = json["fYear"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, double>{};
    data["StateCode"] = stateCode;
    data["DistrictCode"] = districtCode;
    data["DistrictName"] = districtName;
    data["NameLocalLng"] = nameLocalLng;
    data["fYear"] = fYear;
    return data;
  }

}