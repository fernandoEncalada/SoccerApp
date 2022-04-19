import 'dart:convert';

Leagues leaguesFromJson(String str) => Leagues.fromJson(json.decode(str));

String leaguesToJson(Leagues data) => json.encode(data.toJson());

class Leagues {
    Leagues({
        required this.data,
        required this.meta,
    });

    List<League> data;
    Meta meta;

    factory Leagues.fromJson(Map<String, dynamic> json) => Leagues(
        data: List<League>.from(json["data"].map((x) => League.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class League {
    League({
        required this.id,
        required this.active,
        required this.type,
        required this.legacyId,
        required this.countryId,
        required this.logoPath,
        required this.name,
        required this.isCup,
        required this.isFriendly,
        this.currentSeasonId,
        this.currentRoundId,
        this.currentStageId,
        required this.liveStandings,
        required this.coverage,
    });

    int id;
    bool active;
    String type;
    int? legacyId;
    int countryId;
    String logoPath;
    String name;
    bool isCup;
    bool isFriendly;
    int? currentSeasonId;
    int? currentRoundId;
    int? currentStageId;
    bool liveStandings;
    Coverage coverage;

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        active: json["active"],
        type: json["type"],
        legacyId: json["legacy_id"] == null ? null : json["legacy_id"],
        countryId: json["country_id"],
        logoPath: json["logo_path"],
        name: json["name"],
        isCup: json["is_cup"],
        isFriendly: json["is_friendly"],
        currentSeasonId: json["current_season_id"],
        currentRoundId: json["current_round_id"] == null ? null : json["current_round_id"],
        currentStageId: json["current_stage_id"] == null ? null : json["current_stage_id"],
        liveStandings: json["live_standings"],
        coverage: Coverage.fromJson(json["coverage"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "type": type,
        "legacy_id": legacyId == null ? null : legacyId,
        "country_id": countryId,
        "logo_path": logoPath,
        "name": name,
        "is_cup": isCup,
        "is_friendly": isFriendly,
        "current_season_id": currentSeasonId,
        "current_round_id": currentRoundId == null ? null : currentRoundId,
        "current_stage_id": currentStageId == null ? null : currentStageId,
        "live_standings": liveStandings,
        "coverage": coverage.toJson(),
    };
}

class Coverage {
    Coverage({
        required this.predictions,
        required this.topscorerGoals,
        required this.topscorerAssists,
        required this.topscorerCards,
    });

    bool predictions;
    bool topscorerGoals;
    bool topscorerAssists;
    bool topscorerCards;

    factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        predictions: json["predictions"],
        topscorerGoals: json["topscorer_goals"],
        topscorerAssists: json["topscorer_assists"],
        topscorerCards: json["topscorer_cards"],
    );

    Map<String, dynamic> toJson() => {
        "predictions": predictions,
        "topscorer_goals": topscorerGoals,
        "topscorer_assists": topscorerAssists,
        "topscorer_cards": topscorerCards,
    };
}

class Meta {
    Meta({
        required this.plans,
        required this.sports,
        required this.pagination,
    });

    List<Plan> plans;
    List<Sport> sports;
    Pagination pagination;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
        sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    Pagination({
        required this.total,
        required this.count,
        required this.perPage,
        required this.currentPage,
        required this.totalPages,
        required this.links,
    });

    int total;
    int count;
    int perPage;
    int currentPage;
    int totalPages;
    Links links;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        links: Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "links": links.toJson(),
    };
}

class Links {
    Links();

    factory Links.fromJson(Map<String, dynamic> json) => Links(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Plan {
    Plan({
        required this.name,
        required this.features,
        required this.requestLimit,
        required this.sport,
    });

    String name;
    String features;
    String requestLimit;
    String sport;

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        name: json["name"],
        features: json["features"],
        requestLimit: json["request_limit"],
        sport: json["sport"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "features": features,
        "request_limit": requestLimit,
        "sport": sport,
    };
}

class Sport {
    Sport({
        required this.id,
        required this.name,
        required this.current,
    });

    int id;
    String name;
    bool current;

    factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        id: json["id"],
        name: json["name"],
        current: json["current"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "current": current,
    };
}
