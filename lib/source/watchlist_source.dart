import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/watchlist.dart';

class WatchListSource {
    Future<List<Watchlist>> fetchWatchlist() async {
        var url = Uri.parse('https://tugas-carissa.herokuapp.com/mywatchlist/json/');
        var response = await http.get(url,);
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        print(data);
        List<WatchList> listWatch = [];
        for (var d in data) {
            if (d != null) listWatch.add(WatchList.fromJson(d));
        }
        return listWatch;
    }
}