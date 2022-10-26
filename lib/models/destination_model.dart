class Destination {
  final String name, location, imageSrc, img;
  final int price;
  final double rating;
  Destination({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageSrc,
    required this.price,
    required this.img
  });
}

List<Destination> destinations = [
  Destination(name: 'Kuta Beach', location: 'Bali, Indonesia', rating: 4.2, imageSrc: 'assets/kuta.png', price: 20000, img: 'kuta'),
  Destination(name: 'Baga Beach', location: 'Goa, India', rating: 4.8, imageSrc: 'assets/baga.png', price: 15000, img: 'baga')
];

