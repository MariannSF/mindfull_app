import 'package:flutter/material.dart';
import 'package:mindfull_app_2/data/sp_helper.dart';
import 'package:mindfull_app_2/screens/quote_screen.dart';
import 'package:mindfull_app_2/screens/setting_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  String name ='';
  String image = '';

  @override
  void initState() {
    
    super.initState();
    _loadSettings();
    //final helper = SpHelper();
    //helper.getSettings().then((settings) {
    //  name = settings['name'] ??  '';
    //  image = settings['image'] ?? 'Lake';
     // if(image =='') image = 'Lake';
     // setState(() {
        
     // });

   // });
  }
  void _loadSettings() {
  final helper = SpHelper();
  helper.getSettings().then((settings) {
    setState(() {
      name = settings['name'] ?? '';
      image = settings['image'] ?? 'Lake';
      if (image == '') image = 'Lake';
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/$image.jpg',
            fit: BoxFit.cover,
          )),
          Align(
            alignment: const Alignment(0, -0.5),
              child: Text(
            "Welcome $name",
            style:  const TextStyle(
              color: Colors.white,
              shadows: [Shadow(
                blurRadius: 10, 
                color: Colors.black,
                offset: Offset(5, 5))],
              fontSize: 24),
          )),
          Align(
            alignment: const Alignment(0, 0.5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings') .then((_){
                  _loadSettings();

                });
              },
               child: const Text('Settings Page'),
               ),
          ),
          


          Align(alignment: Alignment(0, 0.7),
            child: ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/quote');
            }, 
            child: Text("Quotes Page"
            )),
          )
        ],
      ),
    );
  }
}
