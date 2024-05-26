import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/pages/mainpage.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Mainpage())),
              child: Text(
                "Skip",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              createPage(
                image: "assets/on_1.jpg",
                title: "Welcome Traveller,Already Fix Your Backpack?",
                desription:
                    "Mari jelajahi keindahan alam nusantara,serta mencicipi makanan khas bumi pertiwi.",
              ),
              createPage(
                image: "assets/on_2.jpg",
                title: "Siapkan Destinasi Wisata yang Ingin Dikunjungi",
                desription:
                    "Ambil map mu dan mulai lah berkeliling mencari keberagaman budaya Indonesia",
              ),
              createPage(
                image: "assets/on_3.jpg",
                title: "Mari Mulai Perjalanan Ini",
                desription:
                    "Kencangkan sabukmu perjalanan ini akan menjadi perjalanan yang luar biasa",
              ),
            ],
          ),
          //Untuk membuat (dot)
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: [
                ..._buildIndicator(),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2 ) {
                      currentIndex++;
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => Mainpage()));
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueGrey.shade700),
            ),
          )
        ],
      ),
    );
  }

//animasi(Dot)
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String desription;
  const createPage({
    super.key,
    required this.image,
    required this.title,
    required this.desription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            desription,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
