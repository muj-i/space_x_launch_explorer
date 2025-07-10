// To parse this JSON data, do
//
//     final launchesResModel = launchesResModelFromJson(jsonString);

import 'dart:convert';

List<LaunchesResModel> launchesResModelFromJson(String str) => List<LaunchesResModel>.from(json.decode(str).map((x) => LaunchesResModel.fromJson(x)));

String launchesResModelToJson(List<LaunchesResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaunchesResModel {
    Fairings? fairings;
    Links? links;
    DateTime? staticFireDateUtc;
    int? staticFireDateUnix;
    bool? net;
    int? window;
    // Rocket? rocket;
    bool? success;
    List<Failure>? failures;
    String? details;
    List<String>? crew;
    List<String>? ships;
    List<String>? capsules;
    List<String>? payloads;
    // Launchpad? launchpad;
    int? flightNumber;
    String? name;
    DateTime? dateUtc;
    int? dateUnix;
    DateTime? dateLocal;
    bool? upcoming;
    List<Core>? cores;
    bool? autoUpdate;
    bool? tbd;
    String? launchLibraryId;
    String? id;

    LaunchesResModel({
        this.fairings,
        this.links,
        this.staticFireDateUtc,
        this.staticFireDateUnix,
        this.net,
        this.window,
        // this.rocket,
        this.success,
        this.failures,
        this.details,
        this.crew,
        this.ships,
        this.capsules,
        this.payloads,
        // this.launchpad,
        this.flightNumber,
        this.name,
        this.dateUtc,
        this.dateUnix,
        this.dateLocal,
        this.upcoming,
        this.cores,
        this.autoUpdate,
        this.tbd,
        this.launchLibraryId,
        this.id,
    });

    factory LaunchesResModel.fromJson(Map<String, dynamic> json) => LaunchesResModel(
        fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        // rocket: rocketValues.map[json["rocket"]]!,
        success: json["success"],
        failures: json["failures"] == null ? [] : List<Failure>.from(json["failures"]!.map((x) => Failure.fromJson(x))),
        details: json["details"],
        crew: json["crew"] == null ? [] : List<String>.from(json["crew"]!.map((x) => x)),
        ships: json["ships"] == null ? [] : List<String>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null ? [] : List<String>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null ? [] : List<String>.from(json["payloads"]!.map((x) => x)),
        // launchpad: launchpadValues.map[json["launchpad"]]!,
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null ? null : DateTime.parse(json["date_local"]),
        upcoming: json["upcoming"],
        cores: json["cores"] == null ? [] : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fairings": fairings?.toJson(),
        "links": links?.toJson(),
        "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        // "rocket": rocketValues.reverse[rocket],
        "success": success,
        "failures": failures == null ? [] : List<dynamic>.from(failures!.map((x) => x.toJson())),
        "details": details,
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x)),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules": capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads": payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        // "launchpad": launchpadValues.reverse[launchpad],
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "upcoming": upcoming,
        "cores": cores == null ? [] : List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
    };
}

class Core {
    String? core;
    int? flight;
    bool? gridfins;
    bool? legs;
    bool? reused;
    bool? landingAttempt;
    bool? landingSuccess;
    // LandingType? landingType;
    // Landpad? landpad;

    Core({
        this.core,
        this.flight,
        this.gridfins,
        this.legs,
        this.reused,
        this.landingAttempt,
        this.landingSuccess,
        // this.landingType,
        // this.landpad,
    });

    factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        // landingType: landingTypeValues.map[json["landing_type"]]!,
        // landpad: landpadValues.map[json["landpad"]]!,
    );

    Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        // "landing_type": landingTypeValues.reverse[landingType],
        // "landpad": landpadValues.reverse[landpad],
    };
}

// enum LandingType {
//     ASDS,
//     OCEAN,
//     RTLS
// }

// final landingTypeValues = EnumValues({
//     "ASDS": LandingType.ASDS,
//     "Ocean": LandingType.OCEAN,
//     "RTLS": LandingType.RTLS
// });

// enum Landpad {
//     THE_5_E9_E3032383_ECB267_A34_E7_C7,
//     THE_5_E9_E3032383_ECB554034_E7_C9,
//     THE_5_E9_E3032383_ECB6_BB234_E7_CA,
//     THE_5_E9_E3032383_ECB761634_E7_CB,
//     THE_5_E9_E3032383_ECB90_A834_E7_C8,
//     THE_5_E9_E3033383_ECB075134_E7_CD,
//     THE_5_E9_E3033383_ECBB9_E534_E7_CC
// }

// final landpadValues = EnumValues({
//     "5e9e3032383ecb267a34e7c7": Landpad.THE_5_E9_E3032383_ECB267_A34_E7_C7,
//     "5e9e3032383ecb554034e7c9": Landpad.THE_5_E9_E3032383_ECB554034_E7_C9,
//     "5e9e3032383ecb6bb234e7ca": Landpad.THE_5_E9_E3032383_ECB6_BB234_E7_CA,
//     "5e9e3032383ecb761634e7cb": Landpad.THE_5_E9_E3032383_ECB761634_E7_CB,
//     "5e9e3032383ecb90a834e7c8": Landpad.THE_5_E9_E3032383_ECB90_A834_E7_C8,
//     "5e9e3033383ecb075134e7cd": Landpad.THE_5_E9_E3033383_ECB075134_E7_CD,
//     "5e9e3033383ecbb9e534e7cc": Landpad.THE_5_E9_E3033383_ECBB9_E534_E7_CC
// });
class Failure {
    int? time;
    int? altitude;
    String? reason;

    Failure({
        this.time,
        this.altitude,
        this.reason,
    });

    factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "altitude": altitude,
        "reason": reason,
    };
}

class Fairings {
    bool? reused;
    bool? recoveryAttempt;
    bool? recovered;
    List<String>? ships;

    Fairings({
        this.reused,
        this.recoveryAttempt,
        this.recovered,
        this.ships,
    });

    factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: json["ships"] == null ? [] : List<String>.from(json["ships"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt,
        "recovered": recovered,
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
    };
}

// enum Launchpad {
//     THE_5_E9_E4501_F509094_BA4566_F84,
//     THE_5_E9_E4502_F509092_B78566_F87,
//     THE_5_E9_E4502_F509094188566_F88,
//     THE_5_E9_E4502_F5090995_DE566_F86
// }

// final launchpadValues = EnumValues({
//     "5e9e4501f509094ba4566f84": Launchpad.THE_5_E9_E4501_F509094_BA4566_F84,
//     "5e9e4502f509092b78566f87": Launchpad.THE_5_E9_E4502_F509092_B78566_F87,
//     "5e9e4502f509094188566f88": Launchpad.THE_5_E9_E4502_F509094188566_F88,
//     "5e9e4502f5090995de566f86": Launchpad.THE_5_E9_E4502_F5090995_DE566_F86
// });

class Links {
    Patch? patch;
    Reddit? reddit;
    Flickr? flickr;
    String? presskit;
    String? webcast;
    String? youtubeId;
    String? article;
    String? wikipedia;

    Links({
        this.patch,
        this.reddit,
        this.flickr,
        this.presskit,
        this.webcast,
        this.youtubeId,
        this.article,
        this.wikipedia,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
    );

    Map<String, dynamic> toJson() => {
        "patch": patch?.toJson(),
        "reddit": reddit?.toJson(),
        "flickr": flickr?.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
    };
}

class Flickr {
    List<dynamic>? small;
    List<String>? original;

    Flickr({
        this.small,
        this.original,
    });

    factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null ? [] : List<dynamic>.from(json["small"]!.map((x) => x)),
        original: json["original"] == null ? [] : List<String>.from(json["original"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "small": small == null ? [] : List<dynamic>.from(small!.map((x) => x)),
        "original": original == null ? [] : List<dynamic>.from(original!.map((x) => x)),
    };
}

class Patch {
    String? small;
    String? large;

    Patch({
        this.small,
        this.large,
    });

    factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
    };
}

class Reddit {
    String? campaign;
    String? launch;
    String? media;
    String? recovery;

    Reddit({
        this.campaign,
        this.launch,
        this.media,
        this.recovery,
    });

    factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
    );

    Map<String, dynamic> toJson() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
    };
}

// enum Rocket {
//     THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
//     THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
//     THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
// }

// final rocketValues = EnumValues({
//     "5e9d0d95eda69955f709d1eb": Rocket.THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
//     "5e9d0d95eda69973a809d1ec": Rocket.THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
//     "5e9d0d95eda69974db09d1ed": Rocket.THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
