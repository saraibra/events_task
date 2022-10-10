import 'package:task_app/features/events/domain/entities/event_entity.dart';

class EventModel extends Event {
  EventModel({
    super.id,
    super.title,
    super.description,
    super.spots,
    super.price,
    super.lat,
    super.lon,
    super.placeName,
    super.featuredImage,
    super.date,
    super.tagId,
    super.createdBy,
    super.communityId,
    super.images,
    super.finishDate,
    super.locationId,
    super.isPrivate,
    super.paymentMethod,
    super.receiveUpdates,
    super.state,
    super.isCheckedIn,
    super.isFeatured,
    super.viewersCount,
    super.users,
    super.community,
    super.tag,
    super.isWaiting,
    super.isJoined,
    super.joinedUsersCount,
    super.checkedInCount,
    super.paidAmount,
    super.ownerEarnings,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      lat: json['lat'],
      lon: json['lon'],
      placeName: json['placeName'],
      featuredImage: json['featuredImage'],
      date: json['date'],
      tagId: json['tagId'],
      createdBy: json['createdBy'],
      communityId: json['communityId'],
      images:
          json['images'].map<Images>((v) => ImagesModel.fromJson(v)).toList(),
      finishDate: json['finish_date'],
      locationId: json['location_id'],
      isPrivate: json['is_private'],
      paymentMethod: json['paymentMethod'],
      receiveUpdates: json['receiveUpdates'],
      state: json['state'],
      isCheckedIn: json['isCheckedIn'],
      isFeatured: json['isFeatured'],
      viewersCount: json['viewersCount'],
      users: json['users'].map<Users>((v) => UserModel.fromJson(v)).toList(),
      community: CommunityModel.fromJson(json['community']),
      tag: TagModel.fromJson(json['tag']),
      isWaiting: json['isWaiting'],
      isJoined: json['isJoined'],
      joinedUsersCount: json['joinedUsersCount'],
      checkedInCount: json['checkedInCount'],
      paidAmount: json['paidAmount'],
      ownerEarnings: json['ownerEarnings'],
    );
  }
}

class ImagesModel extends Images {
  ImagesModel({super.url});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}

class TagModel extends Tag {
  TagModel({super.id, super.icon, super.title});
  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(id: json['id'], title: json['title'], icon: json['icon']);
  }
}

class UserModel extends Users {
  UserModel(
      {super.id,
      super.firstName,
      super.lastName,
      super.email,
      super.bio,
      super.profilePicture,
      super.points,
      super.mobile,
      super.countryCode,
      super.isVerified,
      super.isTrusted});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    points = json['points'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    isVerified = json['is_verified'];
    isTrusted = json['isTrusted'];
  }
}

class CommunityModel extends Community {
  CommunityModel(
      {super.id,
      super.title,
      super.image,
      super.bio,
      super.points,
      super.ratingCount,
      super.connectionCount,
      super.eventCount,
      super.profilePicture,
      super.deeplink,
      super.linkExpiry,
      super.state});

  CommunityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    bio = json['bio'];
    points = json['points'];
    ratingCount = json['rating_count'];
    connectionCount = json['connection_count'];
    eventCount = json['event_count'];
    profilePicture = json['profile_picture'];
    deeplink = json['deeplink'];
    linkExpiry = json['link_expiry'];
    state = json['state'];
  }
}
