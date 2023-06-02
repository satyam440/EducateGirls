class MstLookUpEntity{
  int? topicID;
  String? topicName;
  int? isDeleted;
  int? flag;
  int? language;
  int? topicIDNews;

  MstLookUpEntity({
    this.flag,
    this.isDeleted,
    this.language,
    this.topicID,
    this.topicIDNews,
    this.topicName,
});


  MstLookUpEntity.fromJson(Map<String , dynamic> json) {
    topicName = json["TopicName"];
    flag = json["Flag"];
    topicIDNews = json["TopicIDNews"];
    isDeleted = json["IsDeleted"];
    language = json["Language"];
    topicID = json["TopicID"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, double>{};
    data["TopicID"] = topicID;
    data["TopicName"] = topicName;
    data["Language"] = language;
    data["Flag"] = flag;
    data["IsDeleted"] = isDeleted;
    data["TopicIDNews"] = topicIDNews;
    return data;
  }



}