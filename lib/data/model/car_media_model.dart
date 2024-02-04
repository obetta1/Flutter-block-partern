class CarMediaModel {
  List<CarMediaList>? carMediaList;
  Pagination? pagination;

  CarMediaModel({
    this.carMediaList,
    this.pagination,
  });

  factory CarMediaModel.fromJson(Map<String, dynamic> json) => CarMediaModel(
        carMediaList: json["carMediaList"] == null
            ? []
            : List<CarMediaList>.from(
                json["carMediaList"]!.map((x) => CarMediaList.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "carMediaList": carMediaList == null
            ? []
            : List<dynamic>.from(carMediaList!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class CarMediaList {
  int? id;
  String? name;
  String? url;
  String? createdAt;
  Type? type;

  CarMediaList({
    this.id,
    this.name,
    this.url,
    this.createdAt,
    this.type,
  });

  factory CarMediaList.fromJson(Map<String, dynamic> json) => CarMediaList(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        createdAt: json["createdAt"],
        // type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "createdAt": createdAt,
        "type": typeValues.reverse[type],
      };
}

enum Type { IMAGE_JPEG, VIDEO_MP4 }

final typeValues =
    EnumValues({"image/jpeg": Type.IMAGE_JPEG, "video/mp4": Type.VIDEO_MP4});

class Pagination {
  int? total;
  int? currentPage;
  int? pageSize;

  Pagination({
    this.total,
    this.currentPage,
    this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "currentPage": currentPage,
        "pageSize": pageSize,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
