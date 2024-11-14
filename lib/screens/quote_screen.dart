import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mindfull_app_2/screens/setting_screen.dart';
import 'dart:convert';

import '../data/quote.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  static const address = 'https://zenquotes.io/api/random';

  Quote quote = Quote(text: '', author: '');

  @override
  void initState() {
    super.initState();
    _fetchQuote().then((value){
      quote = value;
      setState(() {});
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Mindful Quote'),
      actions: [
        IconButton(
          onPressed: _goToSettings, 
        icon: const Icon(Icons.settings)),

         IconButton(
          onPressed: () {
            _fetchQuote().then((value){
            setState(() {
              quote = value;
            });
          }); 
          },
        icon: const Icon(Icons.refresh))
      ], ) ,
      
      body: Center(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quote.text,
            style: const TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic
            )
            ),
          Text(quote.author,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
            ),

            
          ],
        ),
      ),),
    );
  }

  Future _fetchQuote() async{
    final Uri url = Uri.parse(address);
    final response = await http.get(url);
    print("Fetching quote from API..");
    print("Status code: ${response.statusCode}");

    if(response.statusCode ==200){
       final List quoteJson = json.decode(response.body);
       print("Quote data: ${quoteJson[0]}"); 
    Quote quote = Quote.fromJSON(quoteJson[0]);
    return quote;

    }else{
       print("Error: ${response.body}");
      return Quote(text: 'Error retreiving quote', author: '');
    }
   
  }

  void _goToSettings(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen(),));
  }
}