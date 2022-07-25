import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  int _current = 0;
  dynamic _selectedIndex = {};
  CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Retro Black Coffee Maker',
      'image': 'https://uk.russellhobbs.com/media/catalog/product/cache/076929b24a73f30ab5d0439fbf3c30c3/r/h/rh_main_image_21701.png',
      'description': 'The stunning Russell Hobbs Retro Classic Noir is a kitchen essential for the coffee connoisseur.'
    },
    {
      'title': 'Retro Espresso Coffee Maker',
      'image': 'https://uk.russellhobbs.com/media/catalog/product/cache/076929b24a73f30ab5d0439fbf3c30c3/r/h/rh_main_image_28251.png',
      'description': 'The stunning Russell Hobbs Retro Classic Noir is a kitchen essential for the coffee connoisseur.'
    },
    {
      'title': 'Chester Grind and Brew',
      'image': 'https://uk.russellhobbs.com/media/catalog/product/cache/076929b24a73f30ab5d0439fbf3c30c3/r/h/rh_main_image_21701.png',
      'description': 'If you love the aromatic, rich flavour of freshly ground.'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex.length > 0 ? FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_rounded),
      ) : null,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF333333),
        title: Text("Russel Hobbs",

          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: CarouselSlider(

          carouselController: _carouselController,

          options: CarouselOptions(
              height: 480.0,
              aspectRatio: 16/9,
              viewportFraction: 0.70,
              enlargeCenterPage: true,
              pageSnapping: true,
              onPageChanged: (index, reason){
                setState((){
                  _current = index;
                });
              }
          ),

          items: _products.map((product) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndex == product) {
                        _selectedIndex = {};
                      } else {
                        _selectedIndex = product;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: _selectedIndex == product ? Border.all(color: Colors.blue.shade500, width: 3) : null,
                        boxShadow: _selectedIndex == product ? [
                          BoxShadow(
                              color: Colors.blue.shade100,
                              blurRadius: 30,
                              offset: Offset(0, 10)
                          )
                        ] : [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 20,
                              offset: Offset(0, 5)
                          )
                        ]
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              height: 320,
                              margin: const EdgeInsets.only(top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(product['image'], fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 20,),
                            Text(product['title'].toString().toUpperCase(), style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),),
                            const SizedBox(height: 10,),
                            Text(product['description'], style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList()
        ),
      ),
    );
  }
}