import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel_info.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelView extends StatefulWidget {
  static const routeName = '/hotel';
  HotelView({Key key, this.uuid}) : super(key: key);
  final String uuid;

  @override
  _HotelViewState createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  bool isLoading = false;
  bool hasError = false;
  String errorMessage;
  HotelInfo hotelInfo;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataDetail();
  }

  getDataDetail() async {
    setState(() {
      isLoading = true;
    });
    try {
      final respons = await _dio.get('https://run.mocky.io/v3/${widget.uuid}');
      hotelInfo = HotelInfo.fromJson(respons.data as Map<String, dynamic>);
      if (respons.statusCode == 404) {
        return throw respons;
      }

      print(
          'respons.data: ${respons.data}'); //выводит json деталиной информации отеля
      print('hotelInfo.name: ${hotelInfo.name}'); //выводит name
      print(
          'hotelInfo.adress.country: ${hotelInfo.services.free}'); //А тут выводит null
    } on DioError catch (e) {
      setState(() {
        errorMessage = e.response.data['message'];
        isLoading = false;
        hasError = true;
        print(e);
        print('errorMessage: $errorMessage');
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
        title: isLoading && hasError == false
            ? Center(child: CircularProgressIndicator())
            : hasError == true
                ? Text("")
                : Text(hotelInfo.name),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!isLoading && hasError) Center(child: Text(errorMessage)),
          if (!isLoading && hasError == false)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          scrollDirection: Axis.horizontal,
                          initialPage: 0,
                        ),
                        items: hotelInfo.photos
                            .map(
                              (item) => Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                  child: Image.asset("assets/images/$item",
                                      fit: BoxFit.cover, width: 1000),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Страна: "),
                              Text(
                                hotelInfo.address.country,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Грод: "),
                              Text(
                                hotelInfo.address.city,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Улица: "),
                              Text(
                                hotelInfo.address.street,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Рейтинг: "),
                              Text(
                                '${hotelInfo.rating}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Сервисы',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Платные',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ...hotelInfo.services.paid.map(
                                        (item) => Text(item),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Безплатные',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ...hotelInfo.services.free.map(
                                        (item) => Text(item),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
