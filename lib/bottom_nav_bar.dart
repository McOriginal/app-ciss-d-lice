import 'package:cisse_delice/cart/cart_list.dart';
import 'package:cisse_delice/home.dart';
import 'package:cisse_delice/product/product_home.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        elevation: 3,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.orangeAccent,
          unselectedLabelColor: Colors.black,
          indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
          onTap: (value) {},
          tabs: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Icon(
                Icons.home_outlined,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductHome(),
                  ),
                );
              },
              child: const Icon(
                Icons.format_list_bulleted_rounded,
                size: 30,
              ),
            ),
            const Icon(
              Icons.favorite_outline,
              size: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartList(),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_basket_outlined,
                size: 30,
              ),
            ),
            const Icon(
              Icons.person_outline,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
