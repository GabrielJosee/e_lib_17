/// status : 200
/// message : "success"
/// data : [{"id":1,"user_id":3,"book_id":42,"ulasan":"Bagus dan Menarik","rating":4,"created_at":"2024-03-05T02:53:21.000000Z","updated_at":"2024-03-05T02:53:24.000000Z","user":{"id":3,"username":"felik","nama":"felik","telp":"085751514","alamat":"Sugih Waras","role":"PEMINJAM","created_at":"2024-02-11T13:30:54.000000Z","updated_at":"2024-02-11T13:30:54.000000Z"},"book":{"id":42,"kategori_id":1,"judul":"Keep With Us!","image":"http://192.168.6.207:8000/images/61305680.jpg","penulis":"G. Dani ","penerbit":"PT Good Reads","tahun_terbit":2022,"deskripsi":"Menjadi anak tengah itu tandanya harus mau mengalah seumur hidup. Entah mengalah sama si Bungsu, atau bersabar kalau dibanding-bandingkan sama si Sulung yang superior. Namun, apa iya harus mengalah juga soal jodoh?\n\nAcara buka puasa bersama di rumah mendadak canggung, saat si Tengah mengenalkan sang pacar pada keluarganya. Gilang si Tengah, kesal saat mengetahui bahwa Gita ternyata sudah kenal duluan dengan si Sulung, Gara. Yang bikin gawat, orangtua Gita sangat berharap agar Gara menjadi menantu mereka. Nggak heran juga, karena si Tengah sadar kalau si Sulung akan selalu dianggap lebih baik dari dirinya.\n\nIronisnya, sejak malam itu pula, Gara justru lebih terbuka pada Gita dibanding keluarganya sendiri. Dan sekarang, satu-satunya orang yang tahu rahasia Gara adalah Gita.\n\nApakah hubungan si Tengah dan gadisnya akan baik-baik saja? Kapan si Tengah akan berhenti merasa rendah diri? Mungkinkah si sulung akan menyimpan rahasia dari keluarganya selamanya?","created_at":"2024-03-05T02:38:25.000000Z","updated_at":"2024-03-05T02:38:25.000000Z"}}]

class ResponseRatings {
  ResponseRatings({
      this.status, 
      this.message, 
      this.data,});

  ResponseRatings.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataRating.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataRating>? data;

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

/// id : 1
/// user_id : 3
/// book_id : 42
/// ulasan : "Bagus dan Menarik"
/// rating : 4
/// created_at : "2024-03-05T02:53:21.000000Z"
/// updated_at : "2024-03-05T02:53:24.000000Z"
/// user : {"id":3,"username":"felik","nama":"felik","telp":"085751514","alamat":"Sugih Waras","role":"PEMINJAM","created_at":"2024-02-11T13:30:54.000000Z","updated_at":"2024-02-11T13:30:54.000000Z"}
/// book : {"id":42,"kategori_id":1,"judul":"Keep With Us!","image":"http://192.168.6.207:8000/images/61305680.jpg","penulis":"G. Dani ","penerbit":"PT Good Reads","tahun_terbit":2022,"deskripsi":"Menjadi anak tengah itu tandanya harus mau mengalah seumur hidup. Entah mengalah sama si Bungsu, atau bersabar kalau dibanding-bandingkan sama si Sulung yang superior. Namun, apa iya harus mengalah juga soal jodoh?\n\nAcara buka puasa bersama di rumah mendadak canggung, saat si Tengah mengenalkan sang pacar pada keluarganya. Gilang si Tengah, kesal saat mengetahui bahwa Gita ternyata sudah kenal duluan dengan si Sulung, Gara. Yang bikin gawat, orangtua Gita sangat berharap agar Gara menjadi menantu mereka. Nggak heran juga, karena si Tengah sadar kalau si Sulung akan selalu dianggap lebih baik dari dirinya.\n\nIronisnya, sejak malam itu pula, Gara justru lebih terbuka pada Gita dibanding keluarganya sendiri. Dan sekarang, satu-satunya orang yang tahu rahasia Gara adalah Gita.\n\nApakah hubungan si Tengah dan gadisnya akan baik-baik saja? Kapan si Tengah akan berhenti merasa rendah diri? Mungkinkah si sulung akan menyimpan rahasia dari keluarganya selamanya?","created_at":"2024-03-05T02:38:25.000000Z","updated_at":"2024-03-05T02:38:25.000000Z"}

class DataRating {
  DataRating({
      this.id, 
      this.userId, 
      this.bookId, 
      this.ulasan, 
      this.rating, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      this.book,});

  DataRating.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    ulasan = json['ulasan'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  int? id;
  int? userId;
  int? bookId;
  String? ulasan;
  int? rating;
  String? createdAt;
  String? updatedAt;
  User? user;
  Book? book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['ulasan'] = ulasan;
    map['rating'] = rating;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (book != null) {
      map['book'] = book?.toJson();
    }
    return map;
  }

}

/// id : 42
/// kategori_id : 1
/// judul : "Keep With Us!"
/// image : "http://192.168.6.207:8000/images/61305680.jpg"
/// penulis : "G. Dani "
/// penerbit : "PT Good Reads"
/// tahun_terbit : 2022
/// deskripsi : "Menjadi anak tengah itu tandanya harus mau mengalah seumur hidup. Entah mengalah sama si Bungsu, atau bersabar kalau dibanding-bandingkan sama si Sulung yang superior. Namun, apa iya harus mengalah juga soal jodoh?\n\nAcara buka puasa bersama di rumah mendadak canggung, saat si Tengah mengenalkan sang pacar pada keluarganya. Gilang si Tengah, kesal saat mengetahui bahwa Gita ternyata sudah kenal duluan dengan si Sulung, Gara. Yang bikin gawat, orangtua Gita sangat berharap agar Gara menjadi menantu mereka. Nggak heran juga, karena si Tengah sadar kalau si Sulung akan selalu dianggap lebih baik dari dirinya.\n\nIronisnya, sejak malam itu pula, Gara justru lebih terbuka pada Gita dibanding keluarganya sendiri. Dan sekarang, satu-satunya orang yang tahu rahasia Gara adalah Gita.\n\nApakah hubungan si Tengah dan gadisnya akan baik-baik saja? Kapan si Tengah akan berhenti merasa rendah diri? Mungkinkah si sulung akan menyimpan rahasia dari keluarganya selamanya?"
/// created_at : "2024-03-05T02:38:25.000000Z"
/// updated_at : "2024-03-05T02:38:25.000000Z"

class Book {
  Book({
      this.id, 
      this.kategoriId, 
      this.judul, 
      this.image, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.deskripsi, 
      this.createdAt, 
      this.updatedAt,});

  Book.fromJson(dynamic json) {
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

class User {
  User({
      this.id, 
      this.username, 
      this.nama, 
      this.telp, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
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