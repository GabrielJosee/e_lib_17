/// status : 200
/// message : "success"
/// data : [{"id":7,"kategori_id":1,"judul":"Anak Senja","penulis":"romli kusnadi","penerbit":"PT Damai Sejahtera","tahun_terbit":2023,"created_at":"2024-02-11T14:30:22.000000Z","updated_at":"2024-02-11T14:30:22.000000Z","kategori":{"id":1,"nama":"umum"}}]

class ResoponseBook {
  ResoponseBook({
      this.status, 
      this.message, 
      this.data,});

  ResoponseBook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBook.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBook>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// kategori_id : 1
/// judul : "Anak Senja"
/// penulis : "romli kusnadi"
/// penerbit : "PT Damai Sejahtera"
/// tahun_terbit : 2023
/// created_at : "2024-02-11T14:30:22.000000Z"
/// updated_at : "2024-02-11T14:30:22.000000Z"
/// kategori : {"id":1,"nama":"umum"}

class DataBook {
  DataBook({
      this.id, 
      this.kategoriId, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.createdAt, 
      this.updatedAt, 
      this.kategori,});

  DataBook.fromJson(dynamic json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }
  int? id;
  int? kategoriId;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "umum"

class Kategori {
  Kategori({
      this.id, 
      this.nama,});

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
  }
  int? id;
  String? nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }

}