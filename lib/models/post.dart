import 'dart:convert';

List<WpPost> wpPostFromJson(String str) => List<WpPost>.from(json.decode(str).map((x) => WpPost.fromJson(x)));

String wpPostToJson(List<WpPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WpPost {
  WpPost({
   required this.id,
   required this.date,
   required this.dateGmt,
   required this.link,
   required this.title,
   required this.yoastHeadJson,
   required this.postMetaFields,
  });

  int id;
  DateTime date;
  DateTime dateGmt;
  String link;
  Title title;
  YoastHeadJson yoastHeadJson;
  PostMetaFields postMetaFields;

  factory WpPost.fromJson(Map<String, dynamic> json) => WpPost(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    dateGmt: DateTime.parse(json["date_gmt"]),
    link: json["link"],
    title: Title.fromJson(json["title"]),
    yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
    postMetaFields: PostMetaFields.fromJson(json["post-meta-fields"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "date_gmt": dateGmt.toIso8601String(),
    "link": link,
    "title": title.toJson(),
    "yoast_head_json": yoastHeadJson.toJson(),
    "post-meta-fields": postMetaFields.toJson(),
  };
}

class PostMetaFields {
  PostMetaFields({
   required this.views,
  });

  List<String> views;

  factory PostMetaFields.fromJson(Map<String, dynamic> json) => PostMetaFields(
    views: List<String>.from(json["views"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "views": List<dynamic>.from(views.map((x) => x)),
  };
}

class Title {
  Title({
   required this.rendered,
  });

  String rendered;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class YoastHeadJson {
  YoastHeadJson({
   required this.ogImage,
   required this.author,
  });

  List<OgImage> ogImage;
  String author;

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
    "author": author,
  };
}

class OgImage {
  OgImage({
   required this.width,
   required this.height,
   required this.url,
   required this.type,
  });

  int width;
  int height;
  String url;
  String type;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
    width: json["width"],
    height: json["height"],
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "url": url,
    "type": type,
  };
}
