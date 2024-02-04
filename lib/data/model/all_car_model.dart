class AllCarModel {
  List<Result>? result;
  Pagination? pagination;

  AllCarModel({
    this.result,
    this.pagination,
  });

  factory AllCarModel.fromJson(Map<String, dynamic> json) => AllCarModel(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
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

class Result {
  String? id;
  String? title;
  String? imageUrl;
  int? year;
  String? city;
  String? state;
  double? gradeScore;
  SellingCondition? sellingCondition;
  bool? hasWarranty;
  int? marketplacePrice;
  int? marketplaceOldPrice;
  bool? hasFinancing;
  int? mileage;
  MileageUnit? mileageUnit;
  double? installment;
  bool? depositReceived;
  double? loanValue;
  String? websiteUrl;
  Stats? stats;
  String? bodyTypeId;
  bool? sold;
  bool? hasThreeDImage;
  Transmission? transmission;
  FuelType? fuelType;
  DateTime? marketplaceVisibleDate;
  int? ccMeasurement;

  Result({
    this.id,
    this.title,
    this.imageUrl,
    this.year,
    this.city,
    this.state,
    this.gradeScore,
    this.sellingCondition,
    this.hasWarranty,
    this.marketplacePrice,
    this.marketplaceOldPrice,
    this.hasFinancing,
    this.mileage,
    this.mileageUnit,
    this.installment,
    this.depositReceived,
    this.loanValue,
    this.websiteUrl,
    this.stats,
    this.bodyTypeId,
    this.sold,
    this.hasThreeDImage,
    this.transmission,
    this.fuelType,
    this.marketplaceVisibleDate,
    this.ccMeasurement,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        year: json["year"],
        city: json["city"],
        state: json["state"],
        gradeScore: json["gradeScore"]?.toDouble(),
        sellingCondition: sellingConditionValues.map[json["sellingCondition"]]!,
        hasWarranty: json["hasWarranty"],
        marketplacePrice: json["marketplacePrice"],
        marketplaceOldPrice: json["marketplaceOldPrice"],
        hasFinancing: json["hasFinancing"],
        mileage: json["mileage"],
        mileageUnit: mileageUnitValues.map[json["mileageUnit"]]!,
        installment: json["installment"]?.toDouble(),
        depositReceived: json["depositReceived"],
        loanValue: json["loanValue"]?.toDouble(),
        websiteUrl: json["websiteUrl"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        bodyTypeId: json["bodyTypeId"],
        sold: json["sold"],
        hasThreeDImage: json["hasThreeDImage"],
        transmission: transmissionValues.map[json["transmission"]]!,
        fuelType: fuelTypeValues.map[json["fuelType"]]!,
        marketplaceVisibleDate: json["marketplaceVisibleDate"] == null
            ? null
            : DateTime.parse(json["marketplaceVisibleDate"]),
        ccMeasurement: json["ccMeasurement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "year": year,
        "city": city,
        "state": state,
        "gradeScore": gradeScore,
        "sellingCondition": sellingConditionValues.reverse[sellingCondition],
        "hasWarranty": hasWarranty,
        "marketplacePrice": marketplacePrice,
        "marketplaceOldPrice": marketplaceOldPrice,
        "hasFinancing": hasFinancing,
        "mileage": mileage,
        "mileageUnit": mileageUnitValues.reverse[mileageUnit],
        "installment": installment,
        "depositReceived": depositReceived,
        "loanValue": loanValue,
        "websiteUrl": websiteUrl,
        "stats": stats?.toJson(),
        "bodyTypeId": bodyTypeId,
        "sold": sold,
        "hasThreeDImage": hasThreeDImage,
        "transmission": transmissionValues.reverse[transmission],
        "fuelType": fuelTypeValues.reverse[fuelType],
        "marketplaceVisibleDate": marketplaceVisibleDate?.toIso8601String(),
        "ccMeasurement": ccMeasurement,
      };
}

enum FuelType { PETROL }

extension FuelTypeExtension on FuelType {
  String toStringValue() {
    return fuelTypeValues.reverse[this] ?? '';
  }
}

final fuelTypeValues = EnumValues({"petrol": FuelType.PETROL});

enum MileageUnit { KM, MILES }

final mileageUnitValues =
    EnumValues({"km": MileageUnit.KM, "miles": MileageUnit.MILES});

extension MileageUnitExtension on MileageUnit {
  String toStringValue() {
    return mileageUnitValues.reverse[this] ?? '';
  }
}

enum SellingCondition { FOREIGN, LOCAL, NEW }

extension SellingConditionExtension on SellingCondition {
  String toStringValue() {
    return sellingConditionValues.reverse[this] ?? '';
  }
}

final sellingConditionValues = EnumValues({
  "foreign": SellingCondition.FOREIGN,
  "local": SellingCondition.LOCAL,
  "new": SellingCondition.NEW
});

class Stats {
  int? webViewCount;
  int? webViewerCount;
  int? interestCount;
  int? testDriveCount;
  int? appViewCount;
  int? appViewerCount;
  int? processedLoanCount;

  Stats({
    this.webViewCount,
    this.webViewerCount,
    this.interestCount,
    this.testDriveCount,
    this.appViewCount,
    this.appViewerCount,
    this.processedLoanCount,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        webViewCount: json["webViewCount"],
        webViewerCount: json["webViewerCount"],
        interestCount: json["interestCount"],
        testDriveCount: json["testDriveCount"],
        appViewCount: json["appViewCount"],
        appViewerCount: json["appViewerCount"],
        processedLoanCount: json["processedLoanCount"],
      );

  Map<String, dynamic> toJson() => {
        "webViewCount": webViewCount,
        "webViewerCount": webViewerCount,
        "interestCount": interestCount,
        "testDriveCount": testDriveCount,
        "appViewCount": appViewCount,
        "appViewerCount": appViewerCount,
        "processedLoanCount": processedLoanCount,
      };
}

enum Transmission { AUTOMATIC, DUPLEX, MANUAL }

extension TransmissionExtension on Transmission {
  String toStringValue() {
    return transmissionValues.reverse[this] ?? '';
  }
}

final transmissionValues = EnumValues({
  "automatic": Transmission.AUTOMATIC,
  "duplex": Transmission.DUPLEX,
  "manual": Transmission.MANUAL
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
