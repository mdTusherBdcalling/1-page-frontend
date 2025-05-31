import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the expiry date here (year, month, day)
    final expiryDate = DateTime(2025, 6, 5);
    final now = DateTime.now();

    if (now.isAfter(expiryDate)) {
      // If current date is after expiry, show expiry screen
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DemoExpiredApp(),
      );
    }

    // Otherwise, show the normal app
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class DemoExpiredApp extends StatelessWidget {
  const DemoExpiredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Demo expired.\nPlease contact the developer.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }
}

// COMMON TEXT WIDGET with TikTok font
Widget commonText(
  String text, {
  double size = 14,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  bool isBold = false,
  TextAlign textAlign = TextAlign.center,
  int? maxLines,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      fontFamily: 'TikTokDisplay', // Make sure to register this in pubspec.yaml
      fontSize: size,
      color: color,
      fontWeight: isBold ? FontWeight.bold : fontWeight,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  String gmv = "1200";
  String estCommission = "340";
  String productViews = "2500";
  bool isSilver = true;
  String name = "Hey, Tracy!";

  final List<String> tabs = ['Today', 'Last 7 Days'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,

        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/close.png"),
            Spacer(),
            Image.asset("assets/actions.png"),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap:
                                  () => _showEditDialog(
                                    "Name",
                                    name,
                                    (value) =>
                                        setState(() => name = value.toString()),
                                  ),
                              child: commonText(
                                name,
                                size: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 8),
                            (isSilver)
                                ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSilver = !isSilver;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image 5.png",

                                        width: 140,
                                      ),
                                      commonText(
                                        "  4 benefits",

                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 12,
                                        color: Colors.black38,
                                      ),
                                    ],
                                  ),
                                )
                                : InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSilver = !isSilver;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image 9.png",
                                        width: 140,
                                      ),
                                      commonText(
                                        "  11 benefits",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 12,
                                        color: Colors.black38,
                                      ),
                                    ],
                                  ),
                                ),

                            const SizedBox(height: 20),

                            Row(
                              children: [
                                Container(
                                  height: 38,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = 0;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 4,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                selectedIndex == 0
                                                    ? Colors.white
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: commonText(
                                            tabs[0],

                                            size: 12,

                                            color:
                                                selectedIndex == 0
                                                    ? Colors.black
                                                    : Color(0XFF5D5D5D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = 1;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 4,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                selectedIndex == 1
                                                    ? Colors.white
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: commonText(
                                            tabs[1],

                                            size: 12,

                                            color:
                                                selectedIndex == 1
                                                    ? Colors.black
                                                    : Color(0XFF5D5D5D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset("assets/back_icon.png"),
                              ],
                            ),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                // GMV
                                Expanded(
                                  flex: 11,
                                  child: GestureDetector(
                                    onTap:
                                        () => _showEditDialog(
                                          "GMV",
                                          gmv,
                                          (value) => setState(
                                            () => gmv = value.toString(),
                                          ),
                                        ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonText(
                                          "GMV",
                                          size: 14,
                                          color: const Color(0XFF5D5D5D),
                                        ),
                                        commonText(
                                          "\$$gmv",
                                          size: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Est. commission
                                Expanded(
                                  flex: 10,
                                  child: GestureDetector(
                                    onTap:
                                        () => _showEditDialog(
                                          "Est. commission",
                                          estCommission,
                                          (value) => setState(
                                            () =>
                                                estCommission =
                                                    value.toString(),
                                          ),
                                        ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonText(
                                          "Est. commission",
                                          size: 14,
                                          color: const Color(0XFF5D5D5D),
                                        ),
                                        commonText(
                                          "\$$estCommission",
                                          size: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // Product views
                                Expanded(
                                  flex: 9,
                                  child: GestureDetector(
                                    onTap:
                                        () => _showEditDialog(
                                          "Product views",
                                          productViews,
                                          (value) => setState(
                                            () => productViews = value,
                                          ),
                                        ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonText(
                                          "Product views",
                                          size: 14,
                                          color: const Color(0XFF5D5D5D),
                                        ),
                                        commonText(
                                          productViews,
                                          size: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 8,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F3),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            commonText(
                              "TikTok Shop toolkit",
                              size: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            const Spacer(),
                            Image.asset("assets/back_icon.png"),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                      Image.asset("assets/image 4.png"),
                      Container(
                        height: 8,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F3),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            commonText(
                              "Grow your audience and earnings",
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            Image.asset("assets/back_icon.png"),
                          ],
                        ),
                      ),

                      // Column(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(horizontal: 16),
                      //       padding: EdgeInsets.only(
                      //         left: 16,
                      //         right: 16,
                      //         top: 40,
                      //         bottom: 24,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: Color(0xFFF1F1F3),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child:
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           commonText(
                      //             "Post 3 shoppable videos",
                      //             textAlign: TextAlign.start,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //           Spacer(),
                      //           Container(
                      //             padding: EdgeInsets.symmetric(
                      //               horizontal: 16,
                      //               vertical: 4,
                      //             ),
                      //             decoration: BoxDecoration(
                      //               color: Color(0xFFFE2B54),
                      //               borderRadius: BorderRadius.circular(8),
                      //             ),
                      //             child: commonText(
                      //               "Start",
                      //               size: 16,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //           SizedBox(width: 32),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Image.asset("assets/image 6.png"),

                      Container(
                        height: 8,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F3),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                commonText(
                                  "Creator opportunities",
                                  size: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xFFF1F1F3),
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        commonText(
                                          "Collaborate with Top Live agencies",
                                          size: 18,
                                          isBold: true,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 16,
                                      color: Color(0xFFF1F1F3),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/fire.png",
                                          width: 24,
                                        ),
                                        SizedBox(width: 8),
                                        commonText(
                                          "Boost your live performance\nnow!",
                                          textAlign: TextAlign.start,
                                          isBold: true,
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3F3F3),
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                          ),
                                          child: commonText(
                                            "View",
                                            size: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset("assets/image 10.png"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset("assets/bottombar.png"),
            ],
          ),
          // Positioned(bottom: 65, child: Image.asset("assets/button.png")),
          Positioned(
            bottom: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Image.asset("assets/facetime-button.png", width: 20),
                  commonText(
                    "  Create Now",
                    fontWeight: FontWeight.w500,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
    String title,
    String currentValue,
    Function(String) onSave,
  ) {
    final controller = TextEditingController(text: currentValue.toString());

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: commonText(
            'Edit $title',
            fontWeight: FontWeight.w700,
            size: 16,
            textAlign: TextAlign.left,
          ),
          content: TextField(
            controller: controller,

            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              labelText: 'Enter new value',
              labelStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                final newValue = controller.text;
                if (newValue.isNotEmpty) {
                  onSave(newValue);
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
