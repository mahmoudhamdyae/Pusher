class CustomResponse {
  String? status;
  String? message;
  List<Data>? data;

  CustomResponse({this.status, this.message, this.data});

  CustomResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? message;
  String? contentType;
  String? type;
  String? status;
  String? createdAt;

  Data(
      {this.id,
        this.message,
        this.contentType,
        this.type,
        this.status,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    contentType = json['content_type'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['content_type'] = this.contentType;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}