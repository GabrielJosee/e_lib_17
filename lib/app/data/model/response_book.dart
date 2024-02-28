/// status : 200
/// message : "success"
/// data : [{"id":40,"kategori_id":1,"judul":"Damai","image":"http://192.168.6.210:8000/images/Register.png","penulis":"Bambang sumintarto","penerbit":"PT Damai Sejahtera","tahun_terbit":1999,"deskripsi":"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laboriosam non eos totam earum! Unde veniam possimus voluptas perferendis itaque maxime deserunt tenetur ut quo, adipisci ipsum culpa dolores reprehenderit assumenda vel aut tempore! Vero eius corr","created_at":"2024-02-27T16:08:56.000000Z","updated_at":"2024-02-27T16:08:56.000000Z","kategori":{"id":1,"nama":"umum"}}]

class ResponseBook {
  ResponseBook({
      this.status, 
      this.message, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
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

/// id : 40
/// kategori_id : 1
/// judul : "Damai"
/// image : "http://192.168.6.210:8000/images/Register.png"
/// penulis : "Bambang sumintarto"
/// penerbit : "PT Damai Sejahtera"
/// tahun_terbit : 1999
/// deskripsi : "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laboriosam non eos totam earum! Unde veniam possimus voluptas perferendis itaque maxime deserunt tenetur ut quo, adipisci ipsum culpa dolores reprehenderit assumenda vel aut tempore! Vero eius corr"
/// created_at : "2024-02-27T16:08:56.000000Z"
/// updated_at : "2024-02-27T16:08:56.000000Z"
/// kategori : {"id":1,"nama":"umum"}

class DataBook {
  DataBook({
      this.id, 
      this.kategoriId, 
      this.judul, 
      this.image, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.deskripsi, 
      this.createdAt, 
      this.updatedAt, 
      this.kategori,});

  DataBook.fromJson(dynamic json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    image = json['image'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }
  int? id;
  int? kategoriId;
  String? judul;
  String? image;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['image'] = image;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['deskripsi'] = deskripsi;
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