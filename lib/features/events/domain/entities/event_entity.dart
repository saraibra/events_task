import 'package:equatable/equatable.dart';

class Event extends Equatable {
  int? id;
  String? title;
  String? description;
  int? spots;
  int? price;
  double? lat;
  double? lon;
  String? placeName;
  String? featuredImage;
  String? date;
  int? tagId;
  int? createdBy;
  int? communityId;
  List<Images>? images;
  String? finishDate;
  int? locationId;
  bool? isPrivate;
  String? paymentMethod;
  bool? receiveUpdates;
  String? state;
  bool? isCheckedIn;
  bool? isFeatured;
  int? viewersCount;
  List<Users>? users;
  Community? community;
  Tag? tag;
  bool? isWaiting;
  bool? isJoined;
  int? joinedUsersCount;
  int? checkedInCount;
  int? paidAmount;
  int? ownerEarnings;
  Event(
      {this.id,
      this.title,
      this.description,
      this.spots,
      this.price,
      this.lat,
      this.lon,
      this.placeName,
      this.featuredImage,
      this.date,
      this.tagId,
      this.createdBy,
      this.communityId,
      this.images,
      this.finishDate,
      this.locationId,
      this.isPrivate,
      this.paymentMethod,
      this.receiveUpdates,
      this.state,
      this.isCheckedIn,
      this.isFeatured,
      this.viewersCount,
      this.users,
      this.community,
      this.tag,
      this.isWaiting,
      this.isJoined,
      this.joinedUsersCount,
      this.checkedInCount,
      this.paidAmount,
      this.ownerEarnings});

  @override
  List<Object?> get props => [];
}

class Images extends Equatable {
  String? url;

  Images({this.url});

  @override
  List<Object?> get props => [];
}

class Users extends Equatable {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? bio;
  String? profilePicture;
  int? points;
  String? mobile;
  String? countryCode;
  bool? isVerified;
  bool? isTrusted;
  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.bio,
      this.profilePicture,
      this.points,
      this.mobile,
      this.countryCode,
      this.isVerified,
      this.isTrusted});
  @override
  List<Object?> get props => [];
}

class Community extends Equatable {
  int? id;
  String? title;
  String? image;
  String? bio;
  int? points;
  int? ratingCount;
  int? connectionCount;
  int? eventCount;
  String? profilePicture;
  String? deeplink;
  String? linkExpiry;
  String? state;

  Community(
      {this.id,
      this.title,
      this.image,
      this.bio,
      this.points,
      this.ratingCount,
      this.connectionCount,
      this.eventCount,
      this.profilePicture,
      this.deeplink,
      this.linkExpiry,
      this.state});

  @override
  List<Object?> get props => [];
}

class Tag extends Equatable {
  int? id;
  String? title;
  String? icon;

  Tag({this.id, this.title, this.icon});

  @override
  List<Object?> get props => [];
}
