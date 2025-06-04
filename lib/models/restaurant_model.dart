// import 'package:meta/meta.dart';
import 'dart:convert';

class Welcome {
    final List<Restaurant> restaurants;
    final int total;

    Welcome({
        required this.restaurants,
        required this.total,
    });

    Welcome copyWith({
        List<Restaurant>? restaurants,
        int? total,
    }) => 
        Welcome(
            restaurants: restaurants ?? this.restaurants,
            total: total ?? this.total,
        );

    factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
        "total": total,
    };
}

class Restaurant {
    final bool hasOnlineDelivery;
    final UserRating userRating;
    final String id;
    final String name;
    final int hasTableBooking;
    final int isDeliveringNow;
    final int costForTwo;
    final Cuisine cuisine;
    final String imageUrl;
    final MenuType menuType;
    final String location;
    final String opensAt;
    final bool groupByTime;

    Restaurant({
        required this.hasOnlineDelivery,
        required this.userRating,
        required this.id,
        required this.name,
        required this.hasTableBooking,
        required this.isDeliveringNow,
        required this.costForTwo,
        required this.cuisine,
        required this.imageUrl,
        required this.menuType,
        required this.location,
        required this.opensAt,
        required this.groupByTime,
    });

    Restaurant copyWith({
        bool? hasOnlineDelivery,
        UserRating? userRating,
        String? id,
        String? name,
        int? hasTableBooking,
        int? isDeliveringNow,
        int? costForTwo,
        Cuisine? cuisine,
        String? imageUrl,
        MenuType? menuType,
        String? location,
        String? opensAt,
        bool? groupByTime,
    }) => 
        Restaurant(
            hasOnlineDelivery: hasOnlineDelivery ?? this.hasOnlineDelivery,
            userRating: userRating ?? this.userRating,
            id: id ?? this.id,
            name: name ?? this.name,
            hasTableBooking: hasTableBooking ?? this.hasTableBooking,
            isDeliveringNow: isDeliveringNow ?? this.isDeliveringNow,
            costForTwo: costForTwo ?? this.costForTwo,
            cuisine: cuisine ?? this.cuisine,
            imageUrl: imageUrl ?? this.imageUrl,
            menuType: menuType ?? this.menuType,
            location: location ?? this.location,
            opensAt: opensAt ?? this.opensAt,
            groupByTime: groupByTime ?? this.groupByTime,
        );

    factory Restaurant.fromRawJson(String str) => Restaurant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        hasOnlineDelivery: json["has_online_delivery"],
        userRating: UserRating.fromJson(json["user_rating"]),
        id: json["id"],
        name: json["name"],
        hasTableBooking: json["has_table_booking"],
        isDeliveringNow: json["is_delivering_now"],
        costForTwo: json["cost_for_two"],
        cuisine: cuisineValues.map[json["cuisine"]]!,
        imageUrl: json["image_url"],
        menuType: menuTypeValues.map[json["menu_type"]]!,
        location: json["location"],
        opensAt: json["opens_at"],
        groupByTime: json["group_by_time"],
    );

    Map<String, dynamic> toJson() => {
        "has_online_delivery": hasOnlineDelivery,
        "user_rating": userRating.toJson(),
        "id": id,
        "name": name,
        "has_table_booking": hasTableBooking,
        "is_delivering_now": isDeliveringNow,
        "cost_for_two": costForTwo,
        "cuisine": cuisineValues.reverse[cuisine],
        "image_url": imageUrl,
        "menu_type": menuTypeValues.reverse[menuType],
        "location": location,
        "opens_at": opensAt,
        "group_by_time": groupByTime,
    };
}

enum Cuisine {
    FAST_FOOD,
    NORTH_INDIAN_CHINESE,
    STREET_FOOD
}

final cuisineValues = EnumValues({
    "Fast Food": Cuisine.FAST_FOOD,
    "North Indian, Chinese": Cuisine.NORTH_INDIAN_CHINESE,
    "Street Food": Cuisine.STREET_FOOD
});

enum MenuType {
    NON_VEG,
    VEG
}

final menuTypeValues = EnumValues({
    "NON-VEG": MenuType.NON_VEG,
    "VEG": MenuType.VEG
});

class UserRating {
    final RatingText ratingText;
    final RatingColor ratingColor;
    final int totalReviews;
    final double rating;

    UserRating({
        required this.ratingText,
        required this.ratingColor,
        required this.totalReviews,
        required this.rating,
    });

    UserRating copyWith({
        RatingText? ratingText,
        RatingColor? ratingColor,
        int? totalReviews,
        double? rating,
    }) => 
        UserRating(
            ratingText: ratingText ?? this.ratingText,
            ratingColor: ratingColor ?? this.ratingColor,
            totalReviews: totalReviews ?? this.totalReviews,
            rating: rating ?? this.rating,
        );

    factory UserRating.fromRawJson(String str) => UserRating.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        ratingText: ratingTextValues.map[json["rating_text"]]!,
        ratingColor: ratingColorValues.map[json["rating_color"]]!,
        totalReviews: json["total_reviews"],
        rating: json["rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "rating_text": ratingTextValues.reverse[ratingText],
        "rating_color": ratingColorValues.reverse[ratingColor],
        "total_reviews": totalReviews,
        "rating": rating,
    };
}

enum RatingColor {
    CDD614,
    THE_5_BA829,
    THE_9_ACD32
}

final ratingColorValues = EnumValues({
    "CDD614": RatingColor.CDD614,
    "5BA829": RatingColor.THE_5_BA829,
    "9ACD32": RatingColor.THE_9_ACD32
});

enum RatingText {
    AVERAGE,
    GOOD,
    VERY_GOOD
}

final ratingTextValues = EnumValues({
    "Average": RatingText.AVERAGE,
    "Good": RatingText.GOOD,
    "Very Good": RatingText.VERY_GOOD
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
