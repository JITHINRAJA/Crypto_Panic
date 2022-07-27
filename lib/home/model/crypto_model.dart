// To parse this JSON data, do
//
//     final crypto = cryptoFromJson(jsonString);

import 'dart:convert';

Crypto cryptoFromJson(String str) => Crypto.fromJson(json.decode(str));

String cryptoToJson(Crypto data) => json.encode(data.toJson());

class Crypto {
  Crypto({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result> results;

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.kind,
    this.domain,
    this.source,
    this.title,
    this.publishedAt,
    this.slug,
    this.currencies,
    this.id,
    this.url,
    this.createdAt,
    this.votes,
  });

  Kind? kind;
  String? domain;
  Source? source;
  String? title;
  DateTime? publishedAt;
  String? slug;
  List<Currency>? currencies;
  int? id;
  String? url;
  DateTime? createdAt;
  Votes? votes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        kind: kindValues.map[json["kind"]],
        domain: json["domain"],
        source: Source.fromJson(json["source"]),
        title: json["title"],
        publishedAt: DateTime.parse(json["published_at"]),
        slug: json["slug"],
        currencies: json["currencies"] == null
            ? null
            : List<Currency>.from(
                json["currencies"].map((x) => Currency.fromJson(x))),
        id: json["id"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
        votes: Votes.fromJson(json["votes"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse![kind],
        "domain": domain,
        "source": source?.toJson(),
        "title": title,
        "published_at": publishedAt?.toIso8601String(),
        "slug": slug,
        "currencies": currencies == null
            ? null
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "created_at": createdAt?.toIso8601String(),
        "votes": votes?.toJson(),
      };
}

class Currency {
  Currency({
    this.code,
    this.title,
    this.slug,
    this.url,
  });

  String? code;
  String? title;
  String? slug;
  String? url;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        title: json["title"],
        slug: json["slug"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "slug": slug,
        "url": url,
      };
}

enum Kind { NEWS, MEDIA }

final kindValues = EnumValues({"media": Kind.MEDIA, "news": Kind.NEWS});

class Source {
  Source({
    this.title,
    this.region,
    this.domain,
    this.path,
  });

  String? title;
  Region? region;
  String? domain;
  dynamic path;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json["title"],
        region: regionValues.map[json["region"]],
        domain: json["domain"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "region": regionValues.reverse![region],
        "domain": domain,
        "path": path,
      };
}

enum Region { EN }

final regionValues = EnumValues({"en": Region.EN});

class Votes {
  Votes({
    this.negative,
    this.positive,
    this.important,
    this.liked,
    this.disliked,
    this.lol,
    this.toxic,
    this.saved,
    this.comments,
  });

  int? negative;
  int? positive;
  int? important;
  int? liked;
  int? disliked;
  int? lol;
  int? toxic;
  int? saved;
  int? comments;

  factory Votes.fromJson(Map<String, dynamic> json) => Votes(
        negative: json["negative"],
        positive: json["positive"],
        important: json["important"],
        liked: json["liked"],
        disliked: json["disliked"],
        lol: json["lol"],
        toxic: json["toxic"],
        saved: json["saved"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "negative": negative,
        "positive": positive,
        "important": important,
        "liked": liked,
        "disliked": disliked,
        "lol": lol,
        "toxic": toxic,
        "saved": saved,
        "comments": comments,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
