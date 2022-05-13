class FirstAidData {
  List<Data>? data;
  bool? success;
  int? code;
  String? message;

  FirstAidData({this.data, this.success, this.code, this.message});

  FirstAidData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    code = json['code'];
    message = json['message'];
  }
}

class Data {
  String? sId;
  String? title;
  String? icon;
  String? banner;
  List<Procedures>? procedures;
  List<Faqs>? faqs;
  int? rank;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.title,
      this.icon,
      this.banner,
      this.procedures,
      this.faqs,
      this.rank,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    icon = json['icon'];
    banner = json['banner'];
    if (json['procedures'] != null) {
      procedures = <Procedures>[];
      json['procedures'].forEach((v) {
        procedures!.add(new Procedures.fromJson(v));
      });
    }
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    rank = json['rank'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Procedures {
  String? title;
  String? description;
  int? rank;
  String? sId;

  Procedures({this.title, this.description, this.rank, this.sId});

  Procedures.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    rank = json['rank'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['rank'] = this.rank;
    data['_id'] = this.sId;
    return data;
  }
}

class Faqs {
  String? question;
  String? answer;
  int? rank;
  String? sId;
  Faqs({this.question, this.answer, this.rank, this.sId});
  Faqs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    rank = json['rank'];
    sId = json['_id'];
  }
}
