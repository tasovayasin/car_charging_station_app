import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StationMarker extends StatelessWidget {
  const StationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        "assets/station-pointer.svg",
      ),
    );
  }
}

class StationMarkerBusy extends StatelessWidget {
  const StationMarkerBusy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        "assets/station-pointer-busy.svg",
      ),
    );
  }
}
