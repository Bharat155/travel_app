import 'package:flutter/material.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/views/details_page/details_page.dart';
import 'package:travel_app/views/packages/widget/single_package.dart';
import 'package:get/route_manager.dart';

class Packages extends StatelessWidget {
  const Packages({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SinglePackage(destination: destinations[0], onTap: () {
                Get.to(
                  DetailsPage(
                    destination: destinations[0],
                  ),
                );
              }),
              SinglePackage(destination: destinations[1], onTap: () {
                Get.to(
                  DetailsPage(
                    destination: destinations[1],
                  ),
                );
              }),
            ],
          ),
        ),
      );
  }
}

