import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/main_bg.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.name,
          ),
        ),
        body: Card(
          margin: EdgeInsets.all(12),
          color: Color(0x80B7935F),
          elevation: 4 ,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.transparent,
            )
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                "${verses[index]}(${index+1})",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: GoogleFonts.inder(fontSize: 25,color: Colors.white),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    print(suraLines);
    verses = suraLines;
    setState(() {});
  }
}
