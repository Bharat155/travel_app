import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/models/destination_model.dart';

class SinglePackage extends StatefulWidget {

  final Destination destination;
  final Function()? onTap;

  const SinglePackage({super.key, required this.destination, required this.onTap});

  @override
  State<SinglePackage> createState() => _SinglePackageState();
}

class _SinglePackageState extends State<SinglePackage> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(widget.destination.imageSrc),
                  fit: BoxFit.fitWidth
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      liked = !liked;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: liked ? const Icon(Icons.favorite_rounded, color: Colors.red,size: 18,) : const Icon(Icons.favorite_outline_rounded, color: Colors.black,size: 18,),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.destination.name,
                        style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 20,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(locationImage,),
                        const SizedBox(width: 5,),
                        Text(
                          widget.destination.location,
                          style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 12,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: widget.destination.rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.white,
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          widget.destination.rating.toString(),
                          style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 12,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

