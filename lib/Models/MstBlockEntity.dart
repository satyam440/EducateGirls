class MstBlockEntity {
  String? stateCode;
  String? blockCode;
  String? blockName;
  String? blockShort;
  String? nameLocalLng;
  String? fYear;

  MstBlockEntity({
    this.blockCode,
    this.stateCode,
    this.nameLocalLng,
    this.fYear,
    this.blockShort,
    this.blockName,
  });

  MstBlockEntity.fromJson(Map<String , dynamic> json) {
    stateCode = json["StateCode"];
    blockCode = json["BlockCode"];
    blockName = json["BlockName"];
    blockShort = json["BlockShort"];
    nameLocalLng = json["NameLocalLng"];
    fYear = json["fYear"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, double>{};
    data["StateCode"] = stateCode;
    data["BlockCode"] = blockCode;
    data["BlockName"] = blockName;
    data["BlockShort"] = blockShort;
    data["NameLocalLng"] = nameLocalLng;
    data["fYear"] = fYear;
    return data;
  }
}
