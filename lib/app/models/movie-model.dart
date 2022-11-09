// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

List<MovieModel> movieModelFromMap(String str) => List<MovieModel>.from(
      json.decode(str).map((x) => MovieModel.fromMap(x)),
    );

String movieModelToMap(List<MovieModel> data) => json.encode(
      List<dynamic>.from(
        data.map((x) => x.toMap()),
      ),
    );

class MovieModel {
  MovieModel({
    required this.id  ,
    required this.judul,
    required this.sinopsis,
    required this.background,
    required this.cover,
    required this.durasi,
    required this.tahunRilis,
    required this.genreFilm,
  });

  var id;
  var judul;
  var sinopsis;
  var background;
  var cover;
  var durasi;
  var tahunRilis;
  var genreFilm;

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        id: json["id"] == null ? null : json["id"],
        judul: json["judul"] == null ? null : json["judul"],
        sinopsis: json["sinopsis"] == null ? null : json["sinopsis"],
        background: json["background"] == null ? null : json["background"],
        cover: json["cover"] == null ? null : json["cover"],
        durasi: json["durasi"] == null ? null : json["durasi"],
        tahunRilis: json["tahunRilis"] == null ? null : json["tahunRilis"],
        genreFilm: json["genreFilm"] == null ? null : json["genreFilm"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "judul": judul == null ? null : judul,
        "sinopsis": sinopsis == null ? null : sinopsis,
        "background": background == null ? null : background,
        "cover": cover == null ? null : cover,
        "durasi": durasi == null ? null : durasi,
        "tahunRilis": tahunRilis == null ? null : tahunRilis,
        "genreFilm": genreFilm == null ? null : genreFilm,
      };
}
