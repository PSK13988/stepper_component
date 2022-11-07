class CampaignList {
  List<CampaignModel>? campaignData;

  CampaignList({this.campaignData});

  CampaignList.fromJson(Map<String, dynamic> json) {
    if (json['campaign_data'] != null) {
      campaignData = <CampaignModel>[];
      json['campaign_data'].forEach((v) {
        campaignData!.add(CampaignModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (campaignData != null) {
      data['campaign_data'] = campaignData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CampaignModel {
  String? title;
  String? message;
  bool? isNext;
  bool? isDone;
  bool? isCompleted;

  CampaignModel(
      {this.title, this.message, this.isNext, this.isDone, this.isCompleted});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    isNext = json['is_next'];
    isDone = json['is_done'];
    isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['is_next'] = isNext;
    data['is_done'] = isDone;
    data['is_completed'] = isCompleted;
    return data;
  }
}
