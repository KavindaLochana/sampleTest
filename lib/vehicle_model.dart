// // To parse this JSON data, do
// //
// //     final vehiclesModel = vehiclesModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// VehiclesModel vehiclesModelFromJson(String str) =>
//     VehiclesModel.fromJson(json.decode(str));

// class VehiclesModel {
//   VehiclesModel({
//     required this.features,
//     required this.crs,
//     required this.type,
//   });

//   List<Feature> features;
//   Crs crs;
//   String type;

//   factory VehiclesModel.fromJson(Map<String, dynamic> json) => VehiclesModel(
//         features: List<Feature>.from(
//             json["features"].map((x) => Feature.fromJson(x))),
//         crs: Crs.fromJson(json["crs"]),
//         type: json["type"],
//       );
// }

// class Crs {
//   Crs({
//     required this.type,
//     required this.properties,
//   });

//   String type;
//   CrsProperties properties;

//   factory Crs.fromJson(Map<String, dynamic> json) => Crs(
//         type: json["type"],
//         properties: CrsProperties.fromJson(json["properties"]),
//       );
// }

// class CrsProperties {
//   CrsProperties({
//     required this.code,
//   });

//   String code;

//   factory CrsProperties.fromJson(Map<String, dynamic> json) => CrsProperties(
//         code: json["code"],
//       );
// }

// class Feature {
//   Feature({
//     required this.geometry,
//     required this.id,
//     required this.type,
//     required this.properties,
//   });

//   Geometry geometry;
//   String id;
//   FeatureType type;
//   FeatureProperties properties;

//   factory Feature.fromJson(Map<String, dynamic> json) => Feature(
//         geometry: Geometry.fromJson(json["geometry"]),
//         id: json["id"],
//         type: featureTypeValues.map[json["type"]]!,
//         properties: FeatureProperties.fromJson(json["properties"]),
//       );
// }

// class Geometry {
//   Geometry({
//     required this.coordinates,
//     required this.type,
//   });

//   List<double> coordinates;
//   GeometryType type;

//   factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
//         coordinates:
//             List<double>.from(json["coordinates"].map((x) => x.toDouble())),
//         type: geometryTypeValues.map[json["type"]]!,
//       );
// }

// enum GeometryType { POINT }

// final geometryTypeValues = EnumValues({"Point": GeometryType.POINT});

// class FeatureProperties {
//   FeatureProperties({
//     required this.freeRacks,
//     required this.bikes,
//     required this.label,
//     required this.bikeRacks,
//     required this.updated,
//   });

//   String freeRacks;
//   String bikes;
//   String label;
//   String bikeRacks;
//   Updated updated;

//   factory FeatureProperties.fromJson(Map<String, dynamic> json) =>
//       FeatureProperties(
//         freeRacks: json["free_racks"],
//         bikes: json["bikes"],
//         label: json["label"],
//         bikeRacks: json["bike_racks"],
//         updated: updatedValues.map[json["updated"]]!,
//       );
// }

// enum Updated { THE_202212010008 }

// final updatedValues =
//     EnumValues({"2022-12-01 00:08": Updated.THE_202212010008});

// enum FeatureType { FEATURE }

// final featureTypeValues = EnumValues({"Feature": FeatureType.FEATURE});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
