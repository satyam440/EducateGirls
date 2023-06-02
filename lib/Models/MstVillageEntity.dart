class MstVillageEntity{

  String? stateCode;
  String? districtCode;
  String? blockCode;
  String? panchayatCode;
  String? villageCode;
  String? villageName;
  String? nameLocalLng;
  String? fYear;

  MstVillageEntity({
    this.blockCode,
    this.districtCode,
    this.fYear,
    this.nameLocalLng,
    this.panchayatCode,
    this.stateCode,
    this.villageCode,
    this.villageName,
});


  MstVillageEntity.fromJson(Map<String, dynamic> json) {

    stateCode = json["StateCode"];
    districtCode = json["DistrictCode"];
    blockCode = json["BlockCode"];
    panchayatCode = json["PanchayatCode"];
    villageCode = json["VillageCode"];
    villageName = json["VillageName"];
    nameLocalLng = json["NameLocalLng"];
    fYear = json["FYear"];
  }

  Map<String, dynamic> toJson() {
    Map<String , dynamic> data = <String, dynamic>{};

    data["StateCode"] = stateCode;
    data["DistrictCode"] = districtCode;
    data["BlockCode"] = blockCode;
    data["PanchayatCode"] = panchayatCode;
    data["VillageCode"] = villageCode;
    data["VillageName"] = villageName;
    data["NameLocalLng"] = nameLocalLng;
    data["FYear"] = fYear;
    return data;
  }

}