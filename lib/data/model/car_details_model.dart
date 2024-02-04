class CarDetailsModel {
  List<dynamic>? features;
  List<dynamic>? carFeatures;
  List<dynamic>? modelFeatures;
  List<dynamic>? damageMedia;
  String? id;
  int? year;
  bool? insured;
  int? mileage;
  String? vin;
  int? marketplacePrice;
  bool? marketplaceVisible;
  String? marketplaceVisibleDate;
  bool? isFeatured;
  String? imageUrl;
  Model? model;
  String? state;
  String? country;
  String? ownerType;
  String? transmission;
  String? fuelType;
  String? sellingCondition;
  BodyType? bodyType;
  String? city;
  int? marketplaceOldPrice;
  String? createdAt;
  String? updatedAt;
  String? mileageUnit;
  bool? hasWarranty;
  bool? hasFinancing;
  String? interiorColor;
  String? exteriorColor;
  String? engineType;
  int? gradeScore;
  double? installment;
  bool? depositReceived;
  double? loanValue;
  String? websiteUrl;
  bool? sold;
  bool? hasThreeDImage;
  String? carName;
  FinancingSettings? financingSettings;
  bool? isUpgraded;
  int? ccMeasurement;

  CarDetailsModel({
    this.features,
    this.carFeatures,
    this.modelFeatures,
    this.damageMedia,
    this.id,
    this.year,
    this.insured,
    this.mileage,
    this.vin,
    this.marketplacePrice,
    this.marketplaceVisible,
    this.marketplaceVisibleDate,
    this.isFeatured,
    this.imageUrl,
    this.model,
    this.state,
    this.country,
    this.ownerType,
    this.transmission,
    this.fuelType,
    this.sellingCondition,
    this.bodyType,
    this.city,
    this.marketplaceOldPrice,
    this.createdAt,
    this.updatedAt,
    this.mileageUnit,
    this.hasWarranty,
    this.hasFinancing,
    this.interiorColor,
    this.exteriorColor,
    this.engineType,
    this.gradeScore,
    this.installment,
    this.depositReceived,
    this.loanValue,
    this.websiteUrl,
    this.sold,
    this.hasThreeDImage,
    this.carName,
    this.financingSettings,
    this.isUpgraded,
    this.ccMeasurement,
  });

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) =>
      CarDetailsModel(
        features: json["features"] == null
            ? []
            : List<dynamic>.from(json["features"]!.map((x) => x)),
        carFeatures: json["carFeatures"] == null
            ? []
            : List<dynamic>.from(json["carFeatures"]!.map((x) => x)),
        modelFeatures: json["modelFeatures"] == null
            ? []
            : List<dynamic>.from(json["modelFeatures"]!.map((x) => x)),
        damageMedia: json["damageMedia"] == null
            ? []
            : List<dynamic>.from(json["damageMedia"]!.map((x) => x)),
        id: json["id"],
        year: json["year"],
        insured: json["insured"],
        mileage: json["mileage"],
        vin: json["vin"],
        marketplacePrice: json["marketplacePrice"],
        marketplaceVisible: json["marketplaceVisible"],
        marketplaceVisibleDate: json["marketplaceVisibleDate"],
        isFeatured: json["isFeatured"],
        imageUrl: json["imageUrl"],
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        state: json["state"],
        country: json["country"],
        ownerType: json["ownerType"],
        transmission: json["transmission"],
        fuelType: json["fuelType"],
        sellingCondition: json["sellingCondition"],
        bodyType: json["bodyType"] == null
            ? null
            : BodyType.fromJson(json["bodyType"]),
        city: json["city"],
        marketplaceOldPrice: json["marketplaceOldPrice"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        mileageUnit: json["mileageUnit"],
        hasWarranty: json["hasWarranty"],
        hasFinancing: json["hasFinancing"],
        interiorColor: json["interiorColor"],
        exteriorColor: json["exteriorColor"],
        engineType: json["engineType"],
        // gradeScore: json["gradeScore"],
        installment: json["installment"]?.toDouble(),
        depositReceived: json["depositReceived"],
        loanValue: json["loanValue"]?.toDouble(),
        websiteUrl: json["websiteUrl"],
        sold: json["sold"],
        hasThreeDImage: json["hasThreeDImage"],
        carName: json["carName"],
        financingSettings: json["financingSettings"] == null
            ? null
            : FinancingSettings.fromJson(json["financingSettings"]),
        isUpgraded: json["isUpgraded"],
        ccMeasurement: json["ccMeasurement"],
      );

  Map<String, dynamic> toJson() => {
        "features":
            features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "carFeatures": carFeatures == null
            ? []
            : List<dynamic>.from(carFeatures!.map((x) => x)),
        "modelFeatures": modelFeatures == null
            ? []
            : List<dynamic>.from(modelFeatures!.map((x) => x)),
        "damageMedia": damageMedia == null
            ? []
            : List<dynamic>.from(damageMedia!.map((x) => x)),
        "id": id,
        "year": year,
        "insured": insured,
        "mileage": mileage,
        "vin": vin,
        "marketplacePrice": marketplacePrice,
        "marketplaceVisible": marketplaceVisible,
        "marketplaceVisibleDate": marketplaceVisibleDate,
        "isFeatured": isFeatured,
        "imageUrl": imageUrl,
        "model": model?.toJson(),
        "state": state,
        "country": country,
        "ownerType": ownerType,
        "transmission": transmission,
        "fuelType": fuelType,
        "sellingCondition": sellingCondition,
        "bodyType": bodyType?.toJson(),
        "city": city,
        "marketplaceOldPrice": marketplaceOldPrice,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "mileageUnit": mileageUnit,
        "hasWarranty": hasWarranty,
        "hasFinancing": hasFinancing,
        "interiorColor": interiorColor,
        "exteriorColor": exteriorColor,
        "engineType": engineType,
        "gradeScore": gradeScore,
        "installment": installment,
        "depositReceived": depositReceived,
        "loanValue": loanValue,
        "websiteUrl": websiteUrl,
        "sold": sold,
        "hasThreeDImage": hasThreeDImage,
        "carName": carName,
        "financingSettings": financingSettings?.toJson(),
        "isUpgraded": isUpgraded,
        "ccMeasurement": ccMeasurement,
      };
}

class BodyType {
  int? id;
  String? name;
  String? imageUrl;

  BodyType({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
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

class FinancingSettings {
  LoanCalculator? loanCalculator;

  FinancingSettings({
    this.loanCalculator,
  });

  factory FinancingSettings.fromJson(Map<String, dynamic> json) =>
      FinancingSettings(
        loanCalculator: json["loanCalculator"] == null
            ? null
            : LoanCalculator.fromJson(json["loanCalculator"]),
      );

  Map<String, dynamic> toJson() => {
        "loanCalculator": loanCalculator?.toJson(),
      };
}

class LoanCalculator {
  double? loanPercentage;
  Ranges? ranges;
  DefaultValues? defaultValues;

  LoanCalculator({
    this.loanPercentage,
    this.ranges,
    this.defaultValues,
  });

  factory LoanCalculator.fromJson(Map<String, dynamic> json) => LoanCalculator(
        loanPercentage: json["loanPercentage"]?.toDouble(),
        ranges: json["ranges"] == null ? null : Ranges.fromJson(json["ranges"]),
        defaultValues: json["defaultValues"] == null
            ? null
            : DefaultValues.fromJson(json["defaultValues"]),
      );

  Map<String, dynamic> toJson() => {
        "loanPercentage": loanPercentage,
        "ranges": ranges?.toJson(),
        "defaultValues": defaultValues?.toJson(),
      };
}

class DefaultValues {
  double? interestRate;
  double? downPayment;
  int? tenure;

  DefaultValues({
    this.interestRate,
    this.downPayment,
    this.tenure,
  });

  factory DefaultValues.fromJson(Map<String, dynamic> json) => DefaultValues(
        interestRate: json["interestRate"]?.toDouble(),
        downPayment: json["downPayment"]?.toDouble(),
        tenure: json["tenure"],
      );

  Map<String, dynamic> toJson() => {
        "interestRate": interestRate,
        "downPayment": downPayment,
        "tenure": tenure,
      };
}

class Ranges {
  double? minInterestRate;
  double? maxInterestRate;
  double? minDownPayment;
  double? maxDownPayment;
  int? tenure;

  Ranges({
    this.minInterestRate,
    this.maxInterestRate,
    this.minDownPayment,
    this.maxDownPayment,
    this.tenure,
  });

  factory Ranges.fromJson(Map<String, dynamic> json) => Ranges(
        minInterestRate: json["minInterestRate"]?.toDouble(),
        maxInterestRate: json["maxInterestRate"]?.toDouble(),
        minDownPayment: json["minDownPayment"]?.toDouble(),
        maxDownPayment: json["maxDownPayment"]?.toDouble(),
        tenure: json["tenure"],
      );

  Map<String, dynamic> toJson() => {
        "minInterestRate": minInterestRate,
        "maxInterestRate": maxInterestRate,
        "minDownPayment": minDownPayment,
        "maxDownPayment": maxDownPayment,
        "tenure": tenure,
      };
}

class Model {
  List<dynamic>? modelFeatures;
  int? id;
  String? name;
  String? imageUrl;
  String? wheelType;
  BodyType? make;
  bool? popular;

  Model({
    this.modelFeatures,
    this.id,
    this.name,
    this.imageUrl,
    this.wheelType,
    this.make,
    this.popular,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelFeatures: json["modelFeatures"] == null
            ? []
            : List<dynamic>.from(json["modelFeatures"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        wheelType: json["wheelType"],
        make: json["make"] == null ? null : BodyType.fromJson(json["make"]),
        popular: json["popular"],
      );

  Map<String, dynamic> toJson() => {
        "modelFeatures": modelFeatures == null
            ? []
            : List<dynamic>.from(modelFeatures!.map((x) => x)),
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "wheelType": wheelType,
        "make": make?.toJson(),
        "popular": popular,
      };
}
