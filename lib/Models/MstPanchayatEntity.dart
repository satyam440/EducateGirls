class MstPanchayatEntity{

  String? stateCode;
  String? districtCode;
  String? blockCode;
  String? panchayatCode;
  String? panchayatName;
  String? fYear;

  MstPanchayatEntity({
    this.blockCode,
    this.districtCode,
    this.fYear,
    this.stateCode,
    this.panchayatCode,
    this.panchayatName,
});


  MstPanchayatEntity.fromJson(Map<String, dynamic> json) {
    stateCode = json["StateCode"];
    districtCode = json["DistrictCode"];
    blockCode = json["BlockCode"];
    panchayatCode = json["PanchayatCode"];
    panchayatName = json["PanchayatName"];
    fYear = json["FYear"];
  }
  
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["StateCode"] = stateCode;
    data["DistrictCode"] = districtCode;
    data["BlockCode"] = blockCode;
    data["PanchayatCode"] = panchayatCode;
    data["PanchayatName"] = panchayatName;
    data["FYear"] = fYear;
    return data;
  }

}