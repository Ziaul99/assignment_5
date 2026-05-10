import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterProfileApp());
}

// ─────────────────────────────────────────────
// Root App Widget — handles Dark Mode toggle
// ─────────────────────────────────────────────
class FlutterProfileApp extends StatefulWidget {
  const FlutterProfileApp({super.key});

  @override
  State<FlutterProfileApp> createState() => _FlutterProfileAppState();
}

class _FlutterProfileAppState extends State<FlutterProfileApp> {
  // This bool controls whether dark mode is ON or OFF.
  // When it changes, the whole app rebuilds with the new theme.
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ThemeMode.dark uses darkTheme, ThemeMode.light uses theme
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // We pass the toggle function down to ProfilePage so the FAB can use it
      home: ProfilePage(
        isDarkMode: _isDarkMode,
        onToggleDarkMode: () {
          // setState() tells Flutter: "something changed, rebuild the UI"
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Main Profile Page
// ─────────────────────────────────────────────
class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleDarkMode;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery gives us the actual screen size at runtime.
    // We store it in 'size' and use it for all paddings/sizes below.
    // This is what makes the app responsive — no hardcoded pixel values.
    final Size size = MediaQuery.of(context).size;

    // size.width * 0.04 = 4% of screen width for padding
    // This scales automatically on small phones and large tablets
    final double horizontalPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        // Dark mode toggle icon in the AppBar action area
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: onToggleDarkMode,
            tooltip: 'Toggle Dark Mode',
          ),
        ],
      ),

      // ── BONUS: Floating Action Button ──
      // FAB is a Material Design button that floats above the content.
      // It's declared here at the Scaffold level, not inside the body.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: onToggleDarkMode,
        tooltip: 'Toggle Dark Mode',
        child: Icon(
          isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        // EdgeInsets.symmetric applies the same value on left+right (horizontal)
        // and a fixed value top+bottom (vertical)
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              // ── PROFILE IMAGE ──
              // CircleAvatar renders a circular widget.
              // radius = half the diameter. radius:60 = 120px circle.
              CircleAvatar(
                radius: size.width * 0.18, // 18% of screen width — responsive!
                backgroundColor: Colors.deepPurple.shade100,
                backgroundImage: const NetworkImage(
                  'https://yt3.googleusercontent.com/ytc/AIdro_m3lPIkLiVX-cEWKuqMnFgHy0yBiNCGs8eaMUniwnxqWPw=s160-c-k-c0x00ffffff-no-rj',
                ),
              ),

              SizedBox(height: size.height * 0.02), // 2% of screen height

              // ── NAME ──
              Text(
                'Mohammad Ziaul Karim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // clamp() keeps fontSize between 20 and 28px
                  // regardless of screen size
                  fontSize: (size.width * 0.065).clamp(20.0, 28.0),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              // ── SHORT BIO / TITLE ──
              Text(
                'Flutter Beginner & Future App Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: (size.width * 0.035).clamp(11.0, 14.0),
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurpleAccent,
                ),
              ),

              const SizedBox(height: 8),

              // ── DESCRIPTION LINES ──
              Text(
                'I love building mobile apps with Flutter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: (size.width * 0.033).clamp(11.0, 13.0)),
              ),
              Text(
                'Learning new things every day and enjoying the journey! 🚀',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: (size.width * 0.033).clamp(11.0, 13.0)),
              ),

              SizedBox(height: size.height * 0.025),

              // ── INFO CARDS ──
              // Each DetailCard gets its own SizedBox gap below it
              DetailCard(
                title: 'Location',
                subTitle: 'Dhaka, Bangladesh',
                cardColor: const Color(0xFFEDE7F6), // light purple
                iconBgColor: Colors.deepPurple,
                icon: Icons.location_on,
              ),

              const SizedBox(height: 12),

              DetailCard(
                title: 'Education',
                subTitle: 'MSS in Politics',
                optionalSubTitle: 'University of Chittagong',
                cardColor: const Color(0xFFE8F5E9), // light green
                iconBgColor: Colors.green,
                icon: Icons.school,
              ),

              const SizedBox(height: 12),

              DetailCard(
                title: 'Skills',
                subTitle: 'Flutter, Dart, Firebase, Git,',
                optionalSubTitle: 'REST API, HTML, CSS',
                cardColor: const Color(0xFFE3F2FD), // light blue
                iconBgColor: Colors.blue,
                icon: Icons.code,
              ),

              SizedBox(height: size.height * 0.03),

              // ── CONNECT WITH ME SECTION ──
              const Text(
                'Connect With Me',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 14),

              // Row lays out its children horizontally.
              // MainAxisAlignment.spaceEvenly puts equal space around each child.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    label: 'Facebook',
                    backgroundColor: const Color(0xFF1877F2), // Facebook blue
                  ),
                  SizedBox(width: size.width * 0.07),
                  SocialButton(
                    // Flutter has no GitHub icon built-in.
                    // We use alternate_email or api as a stand-in.
                    // For a real GitHub icon, add font_awesome_flutter package.
                    icon: Icons.hub,
                    label: 'GitHub',
                    backgroundColor: Colors.black87,
                  ),
                  SizedBox(width: size.width * 0.07),
                  SocialButton(
                    icon: Icons.email,
                    label: 'Email',
                    backgroundColor: Colors.redAccent,
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Reusable Detail Card Widget
// ─────────────────────────────────────────────
class DetailCard extends StatelessWidget {
  // 'required' means the caller MUST pass this value
  // '?' after String means the field is nullable (optional)
  final String title;
  final String subTitle;
  final String? optionalSubTitle; // nullable — not always needed
  final Color cardColor;
  final Color iconBgColor;
  final IconData icon;

  const DetailCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.cardColor,
    required this.iconBgColor,
    required this.icon,
    this.optionalSubTitle, // optional — no 'required' keyword
  });

  @override
  Widget build(BuildContext context) {
    // We read screen width here too, for responsive icon size
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // Use full width of parent — no horizontal padding constraint
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // BoxDecoration lets us style a Container's background, border, etc.
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        // BoxShadow adds a drop shadow under the card
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3), // shadow goes 3px down
          ),
        ],
      ),

      child: Row(
        children: [
          // ── ICON BOX ──
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            // Icon size scales with screen width, clamped between 28 and 40px
            child: Icon(
              icon,
              size: (screenWidth * 0.07).clamp(28.0, 40.0),
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 14),

          // ── TEXT COLUMN ──
          // Expanded fills the remaining horizontal space in the Row.
          // Without Expanded, long text would overflow out of the screen.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // align text to left
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // ✅ correct — class prefix required
                    fontSize: (screenWidth * 0.038).clamp(13.0, 16.0),
                    color: iconBgColor, // title uses icon color for visual match
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: (screenWidth * 0.033).clamp(11.0, 13.0),
                  ),
                ),
                // 'if' inside a list — only adds this widget when not null
                if (optionalSubTitle != null)
                  Text(
                    optionalSubTitle!,
                    // '!' asserts: "I'm sure this is not null here"
                    style: TextStyle(
                      fontSize: (screenWidth * 0.033).clamp(11.0, 13.0),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Reusable Social Media Button Widget
// ─────────────────────────────────────────────
class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Column stacks the circle icon above the text label
    return Column(
      children: [
        // This Container becomes a circle because of BoxShape.circle
        Container(
          width: (screenWidth * 0.14).clamp(50.0, 64.0),
          height: (screenWidth * 0.14).clamp(50.0, 64.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle, // makes it a perfect circle
            // Subtle shadow under each social button
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: (screenWidth * 0.065).clamp(22.0, 30.0),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: (screenWidth * 0.03).clamp(10.0, 13.0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}