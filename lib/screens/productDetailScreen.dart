import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductdetailscreenState();
}

class _ProductdetailscreenState extends State<ProductDetailScreen> {
  int selectedIndex = 0;
  List<String> sizes = ["5.4Y", "5.5Y", "5.6Y"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "Product Details",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5), // EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey),
                    ),
                    child: Text(sizes[index],
                        style: TextStyle(
                            fontSize: 16,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.grey)),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              widget.product.category,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              widget.product.title,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              widget.product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0F5FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          " ${widget.product.rating.toString()}/5",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.layers,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Comfort",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.security,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Durable",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.autorenew,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Adaptive",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Show More",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 30)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 20), // Padding
          ),
          child: Row(
            children: [
              const Text(
                "Add to Cart",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "\$${widget.product.price}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
