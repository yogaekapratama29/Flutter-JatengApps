import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:like_button/like_button.dart';

import 'package:project1/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project1/pages/navbar.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
//   //buat sebuah GlobalKey untuk NavigationBar
//   GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();
  List<Product> product = [
    Product(name: "Tegal,Jawa Tengah"),
    Product(name: "Purbalingga,Jawa Tengah"),
    Product(name: "Purwokerto,Jawa Tengah"),
    Product(name: "Brebes,Jawa Tengah"),
    Product(name: "Pemalang,Jawa Tengah"),
  ];
  Product? selectedProduct;
  //Controller
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blue,
          color: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            print(index);
          },
          items: [
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
            Icon(
              Icons.home,
              color: const Color.fromARGB(255, 3, 100, 148),
              size: 35,
            ),
            Icon(
              Icons.settings,
              color: Colors.grey.shade700,
              size: 30,
            ),
          ]),
      drawer: NavBar(),
      appBar: AppBar(
          title: Text(
            "Eksplore Jawa Tengah",
            style: GoogleFonts.notoSansHatran(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white),
      body: Stack(
        children: [
          //   PageView(
          //     controller: pageController,
          //     children: [
          Column(children: [
            //Page ke-0
            // Container(),
          ]),
          Container(
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.only(left: 15, top: 10),
                      height: 50,
                      width: 350,
                      child: DropdownButton<Product>(
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        iconSize: 30,
                        items: product
                            .map(
                              (product) => DropdownMenuItem<Product>(
                                value: product,
                                child: Text(product.name),
                              ),
                            )
                            .toList(),
                        value: selectedProduct,
                        onChanged: (value) {
                          setState(() {
                            selectedProduct = value;
                          });
                        },
                        //Untuk Dropdown memenuhi Layar
                        isExpanded: true,
                        hint: Text(
                          "Kota mana yang ingin di kunjungi?",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      margin: EdgeInsets.only(top: 10),
                      child: Icon(
                        MdiIcons.bell,
                        color: Colors.yellow.shade900,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: const Color.fromARGB(151, 158, 158, 158),
                      ),
                      labelText: "Search",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(186, 158, 158, 158)),
                      hintText: "Kuliner Enak Ditegal....",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(78, 178, 174, 174),
                            width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  height: 30,
                  width: 100,
                  child: Text(
                    "Rekomendasi Kuliner",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://lawupos.com/wp-content/uploads/2023/08/WhatsApp-Image-2023-08-08-at-00.28.55-1.jpeg"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.lightBlue.shade700,
                              ),
                              child: Text(
                                "Sate Kambing Batibul",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://radartegal.disway.id/upload/893168b37f72caa3928bd317d8bb2958.png"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.lightBlue.shade700,
                              ),
                              width: 200,
                              height: 58,
                              child: Text(
                                "Soto Tauco Tegal",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://cdn.idntimes.com/content-images/post/20210514/127310880-844434079651950-1929915730567283605-n-d464d67b0011d3b11592a2a7773c0c61_600x400.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              width: 200,
                              height: 58,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.lightBlue.shade700,
                              ),
                              child: Text(
                                "Tahu Aci",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://1.bp.blogspot.com/-9IbpcHCRKaE/X5kjIlLlYeI/AAAAAAAAAH4/mRJvRrX0-wgTCuZBSv9PLkoeFMiX0ciWwCLcBGAsYHQ/s16000/Minuman%2BSeger%2BKhas%2BTegal%2B-%2BSlawi%2BEs%2BLontrong%2BNamanya.png"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.lightBlue.shade700),
                              width: 200,
                              height: 58,
                              child: Text(
                                "Es Lontrong",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://imgx.sonora.id/crop/0x0:0x0/700x465/photo/2021/07/21/rujak-teplakjpg-20210721085229.jpg"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.lightBlue.shade700),
                              width: 200,
                              height: 58,
                              child: Text(
                                "Rujak Teplak",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://liputanbangsa.com/wp-content/uploads/2024/01/Cuplikan-layar-2024-01-04-175920.png"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.lightBlue.shade700),
                              width: 200,
                              height: 58,
                              child: Text(
                                "Olos Jatirawa",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, -1),
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2021/11/15/3140839357.jpg"),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(right: 5),
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: LikeButton(
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 96,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.lightBlue.shade700),
                              width: 200,
                              height: 58,
                              child: Text(
                                "Kupat Glabed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  height: 40,
                  width: 100,
                  child: Text(
                    "Destinasi yang sering di kunjungi",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 5),
                      height: 200,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://asset.kompas.com/crops/sEQmTDubi-feqexBNMbtMeZq3Sw=/0x531:1200x1331/750x500/data/photo/2023/05/09/6459ca8aa350c.jpeg"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 8, bottom: 5),
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.lightBlue.shade700,
                              ),
                              width: 500,
                              height: 50,
                              child: Text(
                                "The Onsen Guci",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 5),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.goodnewsfromindonesia.id/uploads/images/2022/11/1610402022-pai1.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.lightBlue.shade700),
                          width: 500,
                          height: 50,
                          child: Text(
                            "Pantai Alam Indah Tegal",
                            style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 5),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/panturapost/2022/12/IMG-20221210-WA0065.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.lightBlue.shade700),
                          width: 500,
                          height: 50,
                          child: Text(
                            "Waduk Cacaban",
                            style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 5),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/akurat/gallery/2022/10/big/gal_633ea149f20a92-80127105-59982666.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.lightBlue.shade700),
                          width: 500,
                          height: 50,
                          child: Text(
                            "Alun-Alun Kota Tegal",
                            style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 5),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://jateng.disway.id/upload/81a30e33ba9fd0c9f68cee7aba62ee84.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.lightBlue.shade700),
                          width: 500,
                          height: 50,
                          child: Text(
                            "Wisata Alam Prabalintang",
                            style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                )
              ],
            ),
          ),
          //   Center(
          //     child: Container(
          //       child: Text("Page 3"),
          //     ),
          //   ),
        ],
      ),
      //   Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Container(
      //       height: 100,
      //       width: double.infinity,
      //       color: Color.fromARGB(255, 242, 242, 242),
      //       child: Center(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             //Untuk membuat efek after on press (no works)!
      //             // Material(
      //             //   color: Colors.transparent,
      //             //   borderRadius: BorderRadius.circular(2),
      //             //   child: InkWell(
      //             //     hoverColor: Colors.red,
      //             //     splashColor: const Color.fromARGB(255, 7, 69, 255),
      //             //     borderRadius: BorderRadius.circular(0),
      //             Container(
      //               child: ElevatedButton(
      //                 onPressed: () {
      //                   pageController.jumpToPage(1);
      //                 },
      //                 child: Icon(
      //                     size: 30,
      //                     Icons.home,
      //                     color: const Color.fromARGB(255, 146, 26, 232)),
      //               ),
      //             ),

      //             ElevatedButton(
      //               onPressed: () {
      //                 // if ((pageController.page ?? 0) >= 1) {
      //                 //   pageController.previousPage(
      //                 //       duration: Duration(milliseconds: 500),
      //                 //       curve: Curves.easeIn);
      //               },
      //               child: Icon(
      //                 size: 30,
      //                 MdiIcons.mapMarker,
      //                 color: Colors.amber.shade800,
      //               ),
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 if ((pageController.page ?? 0) <= 1) {
      //                   pageController.nextPage(
      //                       duration: Duration(milliseconds: 500),
      //                       curve: Curves.easeIn);
      //                 }
      //               },
      //               child: Icon(
      //                 size: 30,
      //                 MdiIcons.heart,
      //                 color: Colors.pink,
      //               ),
      //             ),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   pageController.jumpToPage(1);
      //                 },
      //                 child: Icon(
      //                   size: 30,
      //                   Icons.people_alt,
      //                   color: Colors.blue,
      //                 )),
      //           ],
      //         ),
      //       ),
      //     ),
      //   )
      //     ],
      //   ),
    );
  }

//   List<Widget> createContainers() => List.generate(
//         10,
//         (index) => Builder(
//           builder: (context) {
//             log("Rendering Containers ${index}");
//             return Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15), color: Colors.red),
//               margin: EdgeInsets.all(10),
//               height: 100,
//               width: 150,
//               child: Center(
//                 child: Text(
//                   index.toString(),
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
}
