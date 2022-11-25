import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/page/watchlist_detail.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../drawer.dart';
import '../model/watchlist.dart';
import '../source/watchlist_source.dart';

class WatchListPage extends StatefulWidget {
    const WatchListPage({Key? key}) : super(key: key);

    @override
    State<WatchListPage> createState() => _WatchListPage();
}

class WatchListPageState extends State<WatchListPage> {
    late WatchListSource _watchlistSource;
    late Future<List<WatchList>> _futureWatchlist;

    @override
    void initState() {
        Future<List<WatchList>> fetchWatchlist() async {
            var url = Uri.parse('https://tugas-carissa.herokuapp.com/mywatchlist/json/');
            var response = await http.get(url,);
            var data = jsonDecode(utf8.decode(response.bodyBytes));
            print(data);

            List<WatchList> listWatch = [];
            for (var d in data) {
                if (d!=null) listWatch.add(WatchList.fromJson(d));
            }
            return listWatch;
        }
        super.initState();
        _watchlistSource = WatchListSource();
        print(_watchlistSource);
        _futureWatchlist = _watchlistSource.fetchWatchlist();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watchlist'),
                elevation: 0,
                centerTitle: true,
            ),
            drawer: buildDrawer(context),
            body: FutureBuilder(
                future: _futureWatchlist,
                builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                            return Column(
                                children: const [
                                    Text("No Movies Available",
                                        style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                    ),
                                    SizedBox(height: 8),
                                ]
                            );
                        } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        boxShadow: const [
                                            BoxShadow(color: Colors.black, blurRadius: 2.0)
                                        ],
                                    ),
                                    child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => WatchListDetail(
                                                    watchList: snapshot.data[index],
                                                ),
                                            ),
                                        ),
                                        child: Text(
                                            "${snapshot.data![index].fields.title}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),
                                ),
                            );
                        }
                    }
                },
            ),
        );
    }
}
 