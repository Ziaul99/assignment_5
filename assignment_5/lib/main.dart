import 'package:flutter/material.dart';

void main() {
  runApp(FlutterProfileApp());
}

class FlutterProfileApp extends StatelessWidget {
  const FlutterProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Profile', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: CircleAvatar(
                        maxRadius: 100,
                        minRadius: 100,
                        backgroundColor: const Color.fromARGB(255, 33, 4, 4),
                        backgroundImage: NetworkImage(
                          'https://yt3.googleusercontent.com/ytc/AIdro_m3lPIkLiVX-cEWKuqMnFgHy0yBiNCGs8eaMUniwnxqWPw=s160-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                    ),

                    Text(
                      'Mohammad Ziaul Karim',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      'Flutter Biginner & Future App Developer',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'I love building mobile apps with Flutter.',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Learning new things every day and enjoying the journey!🚀',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  spacing: 10,
                  children: [
                    DetailCard(
                      title: 'Location',
                      subTitle: 'Dhaka, Bangladesh',
                      color: const Color.fromARGB(174, 217, 184, 222),
                      subColor: Colors.deepPurple,
                      icon: Icons.location_on,
                    ),
                    DetailCard(
                      title: 'Education',
                      subTitle: 'MSS in Politics, University of Chittagong',
                      color: const Color.fromARGB(173, 88, 186, 129),
                      subColor: const Color.fromARGB(255, 97, 230, 110),
                      icon: Icons.school,
                    ),
                    DetailCard(
                      title: 'Skills',
                      subTitle: 'Flutter, Dart, Firebase, Git,',
                      color: const Color.fromARGB(172, 119, 188, 225),
                      subColor: const Color.fromARGB(255, 4, 30, 232),
                      icon: Icons.cast_for_education,
                      optionalSubTitle: 'Rest API, HTML, CSS',
                    ),

                    Column(
                      children: [
                        Text('Connect With Me'),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.facebook),
                                Text('Facebook'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.one_x_mobiledata),
                                Text('Facebook'),
                              ],
                            ),
                            Column(
                              children: [Icon(Icons.email), Text('Facebook')],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Detail Card

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.subColor,
    required this.icon,
    this.optionalSubTitle,
  });

  final String title;
  final String subTitle;
  final Color color;
  final Color subColor;
  final IconData icon;
  final String? optionalSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: subColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(icon, size: 40, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              spacing: 2,
              crossAxisAlignment: .start,
              children: [
                Text(title, style: TextStyle(fontWeight: .bold)),
                Text(subTitle),
                if (optionalSubTitle != null) Text(optionalSubTitle!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

