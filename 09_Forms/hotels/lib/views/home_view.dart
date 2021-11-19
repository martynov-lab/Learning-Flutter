import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hotels/models/hotel.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  bool hasError = false;
  bool viewList = true;
  bool viewGrid = false;
  String errorMessage;
  List<HotelPreview> hotels;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataPreview();
  }

  getDataPreview() async {
    setState(() {
      isLoading = true;
    });
    try {
      final respons = await _dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var data = respons.data;
      hotels = data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList();
    } catch (e) {
      setState(() {
        errorMessage = 'Не найдена страница';
        isLoading = false;
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                viewList = true;
                viewGrid = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              setState(() {
                viewList = false;
                viewGrid = true;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          if (!isLoading && hasError) Text(errorMessage),
          if (!isLoading && hasError == false)
            if (viewList)
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ...hotels.map(
                      (hotel) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15.0)),
                                  child: Image.asset(
                                      'assets/images/${hotel.poster}',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(hotel.name),
                                    ElevatedButton(
                                      child: Text("Подробнее"),
                                      onPressed: () {
                                        print(hotel.name);
                                        Navigator.of(context).pushNamed(
                                            '/hotel',
                                            arguments: {'uuid': hotel.uuid});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
          if (viewGrid)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  ...hotels.map(
                    (hotel) => Container(
                      margin: const EdgeInsets.all(5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0)),
                                child: Image.asset(
                                    'assets/images/${hotel.poster}',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        hotel.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text("Подробнее"),
                                      onPressed: () {
                                        print(hotel.name);
                                        Navigator.of(context).pushNamed(
                                            '/hotel',
                                            arguments: {'uuid': hotel.uuid});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

