import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/models/destination_model.dart';


class SinglePopularPackage extends StatefulWidget {
  final Destination destination;
  final Function() onTap;

  const SinglePopularPackage(
      {super.key, required this.destination,
        required this.onTap});

  @override
  State<SinglePopularPackage> createState() => _SinglePopularPackageState();
}

class _SinglePopularPackageState extends State<SinglePopularPackage> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey.shade300)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                    height: 150,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            widget.destination.imageSrc,
                          ),
                          fit: BoxFit.fitWidth,
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.destination.name,
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                            child:  liked ?  const Icon(Icons.favorite_outlined, color: Colors.red,) : const Icon(Icons.favorite_outline_rounded, color: Color(0xffbdbdbdff),),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // '₹ ${indianFormat.format(price)}',
                        toINR(widget.destination.price),
                        style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFD5B1F)),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: widget.destination.rating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            unratedColor: Colors.grey.shade300,
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.destination.rating.toString(),
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'A resort is a place used for vacation, relaxation or as a day. A resort is a place used for vacation, relaxation or as a day. A resort is a place used for vacation, relaxation or as a day.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 12,
                          wordSpacing: 1.2,
                          height: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
