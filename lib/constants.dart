import 'package:intl/intl.dart';

const String profilePic = 'assets/profile_pic.png';
const String baga = 'assets/baga.png';
const String beach = 'assets/beach.png';
const String kuta = 'assets/kuta.png';
const String lamp = 'assets/lamp.png';
const String mountain = 'assets/mountain.png';
const String locationImage = 'assets/location.png';
const String food = 'assets/food.png';
const String hotel = 'assets/hotel.png';
const String car = 'assets/car.png';

String toINR(int price){
  return NumberFormat.currency(
    symbol: '₹ ',
    locale: 'HI',
    name: 'INR',
    decimalDigits: 0,
  ).format(price);
}
