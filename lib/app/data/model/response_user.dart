/// status : 200
/// message : "Success"
/// data : {"id":3,"username":"felik","nama":"felik","telp":"085751514","alamat":"Sugih Waras","role":"PEMINJAM","created_at":"2024-02-11T13:30:54.000000Z","updated_at":"2024-02-11T13:30:54.000000Z"}

class ResponseUser {
  ResponseUser({
      this.status, 
      this.message, 
      this.data,});

  ResponseUser.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataUser? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 3
/// username : "felik"
/// nama : "felik"
/// telp : "085751514"
/// alamat : "Sugih Waras"
/// role : "PEMINJAM"
/// created_at : "2024-02-11T13:30:54.000000Z"
/// updated_at : "2024-02-11T13:30:54.000000Z"

class DataUser {
  DataUser({
      this.id, 
      this.username, 
      this.nama, 
      this.telp, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataUser.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? username;
  String? nama;
  String? telp;
  String? alamat;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['nama'] = nama;
    map['telp'] = telp;
    map['alamat'] = alamat;
    map['role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}