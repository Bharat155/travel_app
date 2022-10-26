import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/views/details_page/details_page.dart';
import 'package:travel_app/views/popular_packages/widget/single_popular_package.dart';

class PopularPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular Package',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0x25000000)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SinglePopularPackage(
                  destination: destinations[0],
                  onTap: (){
                    Get.to(
                      DetailsPage(
                        destination: destinations[0],
                      ),
                    );
                  },
                ),
                SinglePopularPackage(
                  destination: destinations[1],
                  onTap: (){
                    Get.to(
                      DetailsPage(
                        destination: destinations[1],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

