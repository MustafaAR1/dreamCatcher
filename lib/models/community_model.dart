class CommunityModel {

final String? communityId;
final String? communityName;
final String? communityImage;





  CommunityModel({this.communityId, this.communityName, this.communityImage});


    factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
              communityId: json['uid'],
        communityName: json['email'],
        communityImage: json['firstName'],
    );


  Map<String, dynamic> toJson() => {
        "communityId": communityId,
        "communityName": communityName,
        "communityImage": communityImage,
      };

}