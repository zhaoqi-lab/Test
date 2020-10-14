import 'package:dio/dio.dart';

class HttpRequest {
  // 1.创建实例对象
  static BaseOptions baseOptions = BaseOptions(connectTimeout: 5000);
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {String method = "get",Map<String, dynamic> params}) async {
    // 1.单独相关的设置
    Options options = Options();
    options.method = method;

    // 2.发送网络请求
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}


class HomeRequest {
  Future<List<MovieItem>> getMovieTopList(String title) async {
    // 1.拼接URL
    final url = "http://v.juhe.cn/movie/index?title=$title&smode=0&pagesize=&offset=&dtype=&key=856df42732c9ea4b782077efe4d192d3";

    // 2.发送请求
    final result = await HttpRequest.request(url);

    // 3.转成模型对象
    final subjects = result["result"];
    List<MovieItem> movies = [];
    counter=1;
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;
  }
}

class HomeRequest_today {
  Future<List<MovieItem>> getMovieTopList(String title) async {
    // 1.拼接URL
    final url = "http://v.juhe.cn/movie/movies.today?cityid=1&dtype=&key=856df42732c9ea4b782077efe4d192d3";
    // 2.发送请求
    final result = await HttpRequest.request(url);

    // 3.转成模型对象
    final subjects = result["result"];
    List<MovieItem> movies = [];
    counter=1;
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap_today(sub));
    }

    return movies;
  }
}

int counter = 1;

class MovieItem {
  int rank;
  String imageURL;
  String title;
  String rating;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["poster"];
    this.title = json["title"];
    this.rating = json["rating"];
  }
  MovieItem.fromMap_today(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["pic_url"];
    this.title = json["movieName"];
    this.rating = "0";
  }
}