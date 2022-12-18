// ignore_for_file: must_be_immutable

import 'package:car_charging_station_app/view/home_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewModel model = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    model.getUserData().then((value) => model.getStationMarkers());

    Size size;
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => model.getData == false
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Header(model: model),
                      ),
                      const SizedBox(height: 27),
                      SearchBar(size: size),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: model.lastSessions.length,
                          itemBuilder: (context, index) {
                            return LastSessions(
                                times: model.lastSessions[index].times!,
                                title: model.lastSessions[index].title!);
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DottedLine(
                          lineThickness: 0.5,
                          dashColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 13),
                      SavedAdresses(model: model),
                      const SizedBox(height: 25),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          lastChargeContainer(size),
                          QrContainer(size: size),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: const PoppinsText(
                          text: "Yakınlarınızdakiler",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Map(size: size, model: model),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Container lastChargeContainer(Size size) {
    return Container(
      width: (size.width - 55) / 2,
      height: 185,
      decoration: BoxDecoration(
        color: const Color(0xff27AE60),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 20, 38, 0),
            child: PoppinsText(
              text: "Son Şarj İşleminiz",
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 0, 0),
                child: PoppinsText(
                  text: model.lastSessions.last.usage.toString(),
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(3, 20, 0, 0),
                child: PoppinsText(
                  text: "kWh",
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 5, 0, 0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/clock.svg",
                  height: 15,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                  child: PoppinsText(
                    text: model.lastSessions.last.duration!,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 18, 16, 23),
            child: SvgPicture.asset(
              "assets/car.svg",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class QrContainer extends StatelessWidget {
  const QrContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size.width - 55) / 2,
      height: 185,
      decoration: BoxDecoration(
        color: const Color(0xff443656),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: PoppinsText(
              text: "QR Kod İle Başlat",
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              "QR kodu okutarak\nşarj işlemine\nbaşlayın",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(103, 15, 19, 23),
            child: SvgPicture.asset("assets/qr.svg"),
          ),
        ],
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({
    Key? key,
    required this.size,
    required this.model,
  }) : super(key: key);

  final Size size;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: size.width - 40,
        height: 190,
        child: FlutterMap(
          options: MapOptions(
            zoom: 14,
            center: LatLng(
              model.nearby.first.lat!.toDouble(),
              model.nearby.first.lng!.toDouble(),
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: "https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
            ),
            MarkerLayer(
              markers: model.stationMarker,
            ),
          ],
        ),
      ),
    );
  }
}

class SavedAdresses extends StatelessWidget {
  const SavedAdresses({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(33, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SvgPicture.asset("assets/bookmark.svg", height: 18),
              ),
              const SizedBox(width: 20),
              const PoppinsText(
                text: "Kayıtlı Adreslerim",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ],
          ),
          PoppinsText(
            text: "${model.user.adresses!.length.toString()} İstasyon",
            color: const Color(0xff6FCF97),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 32,
            color: Colors.black.withOpacity(0.12),
          ),
        ],
      ),
      width: size.width - 40,
      height: 59,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Şarj İstasyonu arayın",
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          prefix: const SizedBox(width: 20),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: CircleAvatar(
                  backgroundColor: const Color(0xff27AE60),
                  child: SvgPicture.asset("assets/person.svg", height: 20),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PoppinsText(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    text: 'Merhaba',
                  ),
                  Observer(builder: (_) {
                    return PoppinsText(
                      text: model.displayName,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 120),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const PoppinsText(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              text: 'Bakiyeniz',
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset("assets/card.svg"),
                ),
                const SizedBox(width: 8),
                Observer(builder: (_) {
                  return PoppinsText(
                    text: "${model.user.balance}₺",
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  );
                }),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PoppinsText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const PoppinsText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        height: 1,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class LastSessions extends StatelessWidget {
  final String title;
  final int times;
  const LastSessions({
    Key? key,
    required this.title,
    required this.times,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 20, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SvgPicture.asset("assets/clock.svg"),
              ),
              const SizedBox(width: 15),
              PoppinsText(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                text: title,
              ),
            ],
          ),
          PoppinsText(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            text: "$times defa",
          ),
        ],
      ),
    );
  }
}
