import 'dart:convert';

PopularCarMakes popularCarMakesFromJson(dynamic json) =>
    PopularCarMakes.fromJson(json.decode(json));

String popularCarMakesToJson(PopularCarMakes data) =>
    json.encode(data.toJson());

MakeList makeListFromJson(String str) => MakeList.fromJson(json.decode(str));

class PopularCarMakes {
  List<MakeList>? makeList;
  Pagination? pagination;

  PopularCarMakes({
    this.makeList,
    this.pagination,
  });

  factory PopularCarMakes.fromJson(Map<String, dynamic> json) =>
      PopularCarMakes(
        makeList: json["makeList"] == null
            ? []
            : List<MakeList>.from(
                json["makeList"]!.map((x) => MakeList.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "makeList": makeList == null
            ? []
            : List<dynamic>.from(makeList!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class MakeList {
  int? id;
  String? name;
  String? imageUrl;

  MakeList({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory MakeList.fromJson(Map<String, dynamic> json) => MakeList(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };
}

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
