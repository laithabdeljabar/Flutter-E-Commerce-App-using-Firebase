// ignore_for_file: constant_identifier_names

class Proudct {
  Proudct({
    this.code,
    this.name,
    this.stock,
    this.price,
    this.images,
    this.categories,
    this.pk,
    this.sellingAttributes,
    this.whitePrice,
    this.articles,
    this.visible,
    this.concept,
    this.numbersOfPieces,
    this.defaultArticle,
    this.sale,
    this.variantSizes,
    this.swatches,
    this.articleCodes,
    this.ticket,
    this.searchEngineProductId,
    this.dummy,
    this.linkPdp,
    this.categoryName,
    this.rgbColors,
    this.articleColorNames,
    this.ecoTaxValue,
    this.swatchesTotal,
    this.showPriceMarker,
    this.redirectToPdp,
    this.mainCategoryCode,
    this.comingSoon,
    this.brandName,
    this.markers,
    this.redPrice,
    this.promotionMarker,
  });

  String? code;
  String? name;
  Stock? stock;
  Price? price;
  List<Imag>? images;
  List<dynamic>? categories;
  String? pk;
  List<SellingAttribute>? sellingAttributes;
  Price? whitePrice;
  List<Article>? articles;
  bool? visible;
  List<Concept>? concept;
  int? numbersOfPieces;
  Article? defaultArticle;
  bool? sale;
  List<VariantSize>? variantSizes;
  List<dynamic>? swatches;
  List<String>? articleCodes;
  String? ticket;
  String? searchEngineProductId;
  bool? dummy;
  String? linkPdp;
  CategoryName? categoryName;
  List<String>? rgbColors;
  List<String>? articleColorNames;
  double? ecoTaxValue;
  int? swatchesTotal;
  bool? showPriceMarker;
  bool? redirectToPdp;
  String? mainCategoryCode;
  bool? comingSoon;
  BrandName? brandName;
  List<Marker>? markers;
  Price? redPrice;
  PromotionMarker? promotionMarker;

  factory Proudct.fromJson(Map<Object?, dynamic> json) => Proudct(
        code: json["code"],
        name: json["name"],
        stock: Stock.fromJson(json["stock"]),
        price: Price.fromJson(json["price"]),
        images: List<Imag>.from(json["images"].map((x) => Imag.fromJson(x)))
            .toList(),
        pk: json["pk"],
        sellingAttributes: json["sellingAttributes"] == null
            ? null
            : List<SellingAttribute>.from(json["sellingAttributes"]
                .map((x) => sellingAttributeValues.map![x])).toList(),
        whitePrice: Price.fromJson(json["whitePrice"]),
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromJson(x)))
                .toList(),
        visible: json["visible"],
        concept: List<Concept>.from(
            json["concept"].map((x) => conceptValues.map![x])).toList(),
        numbersOfPieces: json["numbersOfPieces"],
        // defaultArticle: Article.fromJson(json["defaultArticle"]),
        sale: json["sale"],
        variantSizes: List<VariantSize>.from(
            json["variantSizes"].map((x) => VariantSize.fromJson(x))).toList(),
        swatches: List<dynamic>.from(json["swatches"] ?? [].map((x) => x)),
        articleCodes: List<String>.from(json["articleCodes"].map((x) => x)),
        ticket: json["ticket"],
        searchEngineProductId: json["searchEngineProductId"],
        dummy: json["dummy"],
        linkPdp: json["linkPdp"],
        categoryName: categoryNameValues.map![json["categoryName"]],
        rgbColors: List<String>.from(json["rgbColors"].map((x) => x)),
        articleColorNames:
            List<String>.from(json["articleColorNames"].map((x) => x)),
        //  ecoTaxValue: json["ecoTaxValue"],
        swatchesTotal: json["swatchesTotal"],
        showPriceMarker: json["showPriceMarker"],
        redirectToPdp: json["redirectToPdp"],
        mainCategoryCode: json["mainCategoryCode"],
        comingSoon: json["comingSoon"],
        brandName: brandNameValues.map![json["brandName"]],
        markers: json["markers"] == null
            ? null
            : List<Marker>.from(json["markers"].map((x) => Marker.fromJson(x)))
                .toList(),
        redPrice:
            json["redPrice"] == null ? null : Price.fromJson(json["redPrice"]),
        promotionMarker: json["promotionMarker"] == null
            ? null
            : PromotionMarker.fromJson(json["promotionMarker"]),
        categories: List<dynamic>.from(json["categories"] ?? [].map((x) => x)),
      );

  Map<Object?, dynamic> toJson() => {
        "code": code,
        "name": name,
        "stock": stock!.toJson(),
        "price": price!.toJson(),

        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        //  "images": List<dynamic>.from(images ?? [].map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories ?? [].map((x) => x)),
        "pk": pk,
        "sellingAttributes": sellingAttributes == null
            ? null
            : List<dynamic>.from(sellingAttributes!
                .map((x) => sellingAttributeValues.reverse![x])),
        "whitePrice": whitePrice!.toJson(),
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
        // List<dynamic>.from(articles ?? [].map((x) => x.toJson())),
        "visible": visible,
        "concept": // List<dynamic>.from(concept!.map((x) => x.toJson())),
            List<dynamic>.from(concept!.map((x) => conceptValues.reverse![x])),
        "numbersOfPieces": numbersOfPieces,
        //    "defaultArticle": defaultArticle!.toJson(),
        "sale": sale,
        "variantSizes":
            List<dynamic>.from(variantSizes!.map((x) => x.toJson())),
        "swatches": List<dynamic>.from(swatches ?? [].map((x) => x)),
        "articleCodes": List<dynamic>.from(articleCodes ?? [].map((x) => x)),
        "ticket": ticket,
        "searchEngineProductId": searchEngineProductId,
        "dummy": dummy,
        "linkPdp": linkPdp,
        "categoryName": categoryNameValues.reverse![categoryName],
        "rgbColors": List<dynamic>.from(rgbColors ?? [].map((x) => x)),
        "articleColorNames":
            List<dynamic>.from(articleColorNames ?? [].map((x) => x)),
        //  "ecoTaxValue": ecoTaxValue,
        "swatchesTotal": swatchesTotal,
        "showPriceMarker": showPriceMarker,
        "redirectToPdp": redirectToPdp,
        "mainCategoryCode": mainCategoryCode,
        "comingSoon": comingSoon,
        "brandName": brandNameValues.reverse![brandName],
        "markers": markers == null
            ? null
            : List<dynamic>.from(markers ?? [].map((x) => x.toJson())),
        "redPrice": redPrice == null ? null : redPrice!.toJson(),
        "promotionMarker":
            promotionMarker == null ? null : promotionMarker!.toJson(),
      };
}

class Article {
  Article({
    this.code,
    this.name,
    this.images,
    this.pk,
    this.sellingAttributes,
    this.whitePrice,
    this.logoPicture,
    this.normalPicture,
    this.visible,
    this.numbersOfPieces,
    this.ticket,
    this.dummy,
    this.ecoTaxValue,
    this.redirectToPdp,
    this.comingSoon,
    this.color,
    this.rgbColor,
    this.genArticle,
    this.markers,
    this.environmentalMarkers,
    this.redPrice,
  });

  String? code;
  String? name;
  List<Imag>? images;
  String? pk;
  List<SellingAttribute>? sellingAttributes;
  Price? whitePrice;
  List<Imag>? logoPicture;
  List<Imag>? normalPicture;
  bool? visible;
  int? numbersOfPieces;
  String? ticket;
  bool? dummy;
  double? ecoTaxValue;
  bool? redirectToPdp;
  bool? comingSoon;
  Colo? color;
  String? rgbColor;
  String? genArticle;
  List<Marker>? markers;
  List<EnvironmentalMarker>? environmentalMarkers;
  Price? redPrice;

  factory Article.fromJson(Map<dynamic, dynamic> json) => Article(
        code: json["code"],
        name: json["name"],
        images: List<Imag>.from(json["images"].map((x) => Imag.fromJson(x))),
        pk: json["pk"],
        sellingAttributes: json["sellingAttributes"] == null
            ? null
            : List<SellingAttribute>.from(json["sellingAttributes"]
                .map((x) => sellingAttributeValues.map![x])),
        whitePrice: Price.fromJson(json["whitePrice"]),
        logoPicture:
            List<Imag>.from(json["logoPicture"].map((x) => Imag.fromJson(x))),
        normalPicture:
            List<Imag>.from(json["normalPicture"].map((x) => Imag.fromJson(x))),
        visible: json["visible"],
        numbersOfPieces: json["numbersOfPieces"],
        ticket: json["ticket"],
        dummy: json["dummy"],
        // ecoTaxValue: json["ecoTaxValue"],
        redirectToPdp: json["redirectToPdp"],
        comingSoon: json["comingSoon"],
        color: Colo.fromJson(json["color"]),
        rgbColor: json["rgbColor"],
        genArticle: json["genArticle"],
        markers: json["markers"] == null
            ? null
            : List<Marker>.from(json["markers"].map((x) => Marker.fromJson(x))),
        environmentalMarkers: json["environmentalMarkers"] == null
            ? null
            : List<EnvironmentalMarker>.from(json["environmentalMarkers"]
                .map((x) => environmentalMarkerValues.map![x])),
        redPrice:
            json["redPrice"] == null ? null : Price.fromJson(json["redPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "pk": pk,
        "sellingAttributes": sellingAttributes == null
            ? null
            : List<dynamic>.from(sellingAttributes!
                .map((x) => sellingAttributeValues.reverse![x])),
        "whitePrice": whitePrice!.toJson(),
        "logoPicture": List<dynamic>.from(logoPicture!.map((x) => x.toJson())),
        "normalPicture":
            List<dynamic>.from(normalPicture!.map((x) => x.toJson())),
        "visible": visible,
        "numbersOfPieces": numbersOfPieces,
        "ticket": ticket,
        "dummy": dummy,
        //   "ecoTaxValue": ecoTaxValue,
        "redirectToPdp": redirectToPdp,
        "comingSoon": comingSoon,
        "color": color!.toJson(),
        "rgbColor": rgbColor,
        "genArticle": genArticle,
        "markers": markers == null
            ? null
            : List<dynamic>.from(markers!.map((x) => x.toJson())),
        "environmentalMarkers": environmentalMarkers == null
            ? null
            : List<dynamic>.from(environmentalMarkers!
                .map((x) => environmentalMarkerValues.reverse![x])),
        "redPrice": redPrice == null ? null : redPrice!.toJson(),
      };
}

class Colo {
  Colo({
    this.code,
    this.text,
    this.filterName,
    this.hybrisCode,
  });

  String? code;
  String? text;
  String? filterName;
  String? hybrisCode;

  factory Colo.fromJson(Map<dynamic, dynamic> json) => Colo(
        code: json["code"],
        text: json["text"],
        filterName: json["filterName"],
        hybrisCode: json["hybrisCode"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "text": text,
        "filterName": filterName,
        "hybrisCode": hybrisCode,
      };
}

enum EnvironmentalMarker { CONSCIOUS_CHOICE, PREMIUM_SELECTION }

final environmentalMarkerValues = EnumValues({
  "Conscious choice  ": EnvironmentalMarker.CONSCIOUS_CHOICE,
  "Premium Selection": EnvironmentalMarker.PREMIUM_SELECTION
});

class Imag {
  Imag({
    this.url,
  });

  String? url;

  factory Imag.fromJson(Map<dynamic, dynamic> json) => Imag(
        url: json["url"],
      );

  Map toJson() => {
        "url": url,
      };
}

class Marker {
  Marker({
    this.text,
    this.type,
  });

  EnvironmentalMarker? text;
  MarkerType? type;

  factory Marker.fromJson(Map<dynamic, dynamic> json) => Marker(
        text: environmentalMarkerValues.map![json["text"]],
        type: markerTypeValues.map![json["type"]],
      );

  Map<Object?, dynamic> toJson() => {
        "text": environmentalMarkerValues.reverse![text],
        "type": markerTypeValues.reverse![type],
      };
}

enum MarkerType { ENVIRONMENT, QUALITY }

final markerTypeValues = EnumValues(
    {"ENVIRONMENT": MarkerType.ENVIRONMENT, "QUALITY": MarkerType.QUALITY});

class Price {
  Price({
    this.currencyIso,
    this.value,
    this.priceType,
    this.formattedValue,
    this.type,
  });

  CurrencyIso? currencyIso;
  double? value;
  PriceTypeEnum? priceType;
  String? formattedValue;
  PriceType? type;

  factory Price.fromJson(Map<dynamic, dynamic> json) => Price(
        currencyIso: currencyIsoValues.map![json["currencyIso"]],
        value: json["value"].toDouble(),
        priceType: priceTypeEnumValues.map![json["priceType"]],
        formattedValue: json["formattedValue"],
        type: priceTypeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "currencyIso": currencyIsoValues.reverse![currencyIso],
        "value": value,
        "priceType": priceTypeEnumValues.reverse![priceType],
        "formattedValue": formattedValue,
        "type": priceTypeValues.reverse![type],
      };
}

enum CurrencyIso { USD }

final currencyIsoValues = EnumValues({"USD": CurrencyIso.USD});

enum PriceTypeEnum { BUY }

final priceTypeEnumValues = EnumValues({"BUY": PriceTypeEnum.BUY});

enum PriceType { RED, WHITE }

final priceTypeValues =
    EnumValues({"RED": PriceType.RED, "WHITE": PriceType.WHITE});

enum SellingAttribute { NEW_ARRIVAL }

final sellingAttributeValues =
    EnumValues({"New Arrival": SellingAttribute.NEW_ARRIVAL});

enum BrandName { H_M }

final brandNameValues = EnumValues({"H&M": BrandName.H_M});

enum CategoryName { MEN }

final categoryNameValues = EnumValues({"Men": CategoryName.MEN});

enum Concept { H_M_MAN }

final conceptValues = EnumValues({"H&M MAN": Concept.H_M_MAN});

class PromotionMarker {
  PromotionMarker({
    this.code,
    this.text,
  });

  String? code;
  String? text;

  factory PromotionMarker.fromJson(Map<dynamic, dynamic> json) =>
      PromotionMarker(
        code: json["code"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "text": text,
      };
}

class Stock {
  Stock({
    this.stockLevel,
  });

  int? stockLevel;

  factory Stock.fromJson(Map<dynamic, dynamic> json) => Stock(
        stockLevel: json["stockLevel"],
      );

  Map<String, dynamic> toJson() => {
        "stockLevel": stockLevel,
      };
}

class VariantSize {
  VariantSize({
    this.orderFilter,
    this.filterCode,
  });

  int? orderFilter;
  String? filterCode;

  factory VariantSize.fromJson(Map<dynamic, dynamic> json) => VariantSize(
        orderFilter: json["orderFilter"],
        filterCode: json["filterCode"],
      );

  Map<String, dynamic> toJson() => {
        "orderFilter": orderFilter,
        "filterCode": filterCode,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
