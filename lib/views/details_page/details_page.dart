import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/views/details_page/widget/amenity_box.dart';

class DetailsPage extends StatefulWidget {

  final Destination destination;

  const DetailsPage({super.key,
    required this.destination
});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _heightAnimation;
  bool isCollapsing = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
        setState(() {});
      });

    _heightAnimation = Tween().animate(_controller);
    super.initState();
  }

  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isCollapsing ? Colors.white :Colors.black,
        body: Stack(
          children: [
            isCollapsing ? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 320, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What\'s Included',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          AmenityBox(
                            name: 'Food',
                            image: food,
                          ),
                          AmenityBox(
                            name: 'Hotel',
                            image: hotel,
                          ),
                          AmenityBox(
                            name: 'Car',
                            image: car,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const Text(
                      'About Trip',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${widget.destination.img}/${widget.destination.img}${index + 1}.jpg'
                                      ),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ) : Container(),
            GestureDetector(
              onPanUpdate: (details) {
                // if (details.delta.dx > 0) {
                //   print("Dragging in +X direction");
                // } else {
                //   print("Dragging in -X direction");
                // }
                if (details.delta.dy < 0) {
                  setState(() {
                  _heightAnimation = Tween(
                      begin: MediaQuery.of(context).size.height, end: 200)
                      .animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.linear,
                  ));
                  _controller.forward();
                  isCollapsing = true;
                });
                  // print("Dragging in -Y direction");
                }else {
                  setState(() {
                    _heightAnimation = Tween(
                        begin: 200, end: MediaQuery.of(context).size.height)
                        .animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.linear,
                    ));
                    _controller.forward();
                    isCollapsing = false;
                  });
                  // print("Dragging in +Y direction");
                }
              },
              child: Padding(
                padding: isCollapsing ? const EdgeInsets.only(top: 100.0, left: 20, right: 20) : const EdgeInsets.all(0.0),
                child: Container(
                  height: double.tryParse(_heightAnimation.value.toString()),
                  decoration:  BoxDecoration(
                    borderRadius: isCollapsing ? BorderRadius.circular(20.0) : BorderRadius.circular(0.0),
                    image: DecorationImage(
                        image:  AssetImage(
                          widget.destination.imageSrc,
                        ),
                        fit: isCollapsing ? BoxFit.fitWidth : BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: isCollapsing ? const EdgeInsets.symmetric(horizontal: 10.0) : const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      widget.destination.name,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(locationImage),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                         Text(
                                          widget.destination.location,
                                          style: const TextStyle(
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                isCollapsing
                                    ? Container()
                                    : const SizedBox(
                                  height: 20,
                                ),
                                isCollapsing
                                    ? const Text('')
                                    : const Text(
                                        'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.',
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          isCollapsing
                              ? Container()
                              : const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius :isCollapsing ? BorderRadius.circular(20.0) : BorderRadius.circular(0.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black])),
                            child: Padding(
                              padding:
                              isCollapsing ? const EdgeInsets.symmetric(horizontal: 10.0) :  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: widget.destination.rating,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        unratedColor: Colors.white,
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
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  isCollapsing
                                      ? Container()
                                      : const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${toINR(widget.destination.price)}/person',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.amber),
                                            elevation:
                                                MaterialStateProperty.all(0.0),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    isCollapsing ? const Size(95, 40): const Size(105, 45))),
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(
                                            fontFamily: 'Urbanist',
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  isCollapsing
                                      ? const SizedBox(
                                    height: 10,
                                  )
                                      : const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-0.5, -0.1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children:  [
                          Align(
                              alignment: const AlignmentDirectional(0, -0.92),
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: isCollapsing ? Colors.black :Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 20, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 30,
                        height: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:  IconButton(
                          icon : liked ? const Icon(Icons.favorite_outlined) :const Icon(Icons.favorite_outline_rounded),
                          onPressed:  () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                          color: isCollapsing ? liked ? Colors.red :Colors.black : liked ? Colors.red :Colors.white,
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


