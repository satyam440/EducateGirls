class MstStateEntity{

  String? stateCode;
  String? stateName;
  String? stateShort;
  String? nameLocalLng;
  String? languageCode;
  String? interventionStart;
  int? active;
  // String? active:Boolean;

  MstStateEntity({
    this.stateCode,
    this.nameLocalLng,
    this.active,
    this.interventionStart,
    this.languageCode,
    this.stateName,
    this.stateShort,
});

  MstStateEntity.fromJson(Map<String , dynamic> json) {
    stateCode = json["StateCode"];
    nameLocalLng = json["NameLocalLng"];
    active = json["Active"];
    interventionStart = json["InterventionStart"];
    languageCode = json["LanguageCode"];
    stateName = json["StateName"];
    stateShort = json["StateShort"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["StateCode"] = stateCode;
    data["NameLocalLng"] = nameLocalLng;
    data["Active"] = active;
    data["LanguageCode"] = languageCode;
    data["InterventionStart"] = interventionStart;
    data["StateName"] = stateName;
    data["StateShort"] = stateShort;
    return data;
  }

}