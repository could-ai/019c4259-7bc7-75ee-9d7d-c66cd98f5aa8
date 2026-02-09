import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Bus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HorrorPosterScreen(),
      },
    );
  }
}

class HorrorPosterScreen extends StatelessWidget {
  const HorrorPosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Image (Foggy Road representation)
          Image.network(
            'https://images.unsplash.com/photo-1475727946784-2890c8fdb9c8?q=80&w=1920&auto=format&fit=crop',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator(color: Colors.red));
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(color: Colors.grey[900]);
            },
          ),

          // 2. Cinematic Lighting / Vignette Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6), // Dark top
                  Colors.transparent,            // Clear middle
                  Colors.black.withOpacity(0.9), // Dark bottom
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // 3. Fog Overlay (Simulated with gradient)
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),

          // 4. Content Layer
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Cinematic" Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'HORROR • THRILLER',
                      style: GoogleFonts.oswald(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Main Title "LAST BUS"
                  Text(
                    'LAST BUS',
                    style: GoogleFonts.creepster(
                      fontSize: 80,
                      height: 0.9,
                      color: const Color(0xFFD32F2F), // Blood red
                      shadows: [
                        const Shadow(
                          blurRadius: 20.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                        const Shadow(
                          blurRadius: 50.0,
                          color: Color(0xFF8B0000), // Dark red glow
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Tagline / Description
                  Text(
                    'The ride home never ends.',
                    style: GoogleFonts.crimsonText(
                      fontSize: 24,
                      color: Colors.white.withOpacity(0.9),
                      fontStyle: FontStyle.italic,
                      shadows: [
                        const Shadow(
                          blurRadius: 4.0,
                          color: Colors.black,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // "Watch" Button
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD32F2F),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.play_arrow, size: 28),
                        label: Text(
                          'WATCH TRAILER',
                          style: GoogleFonts.oswald(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white, size: 32),
                        tooltip: 'Add to Watchlist',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
