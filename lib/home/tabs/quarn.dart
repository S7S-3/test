import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/sura_model.dart';

import '../../sura_details.dart';

class QuarnTab extends StatelessWidget {
   QuarnTab({super.key});
  List<String> suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/moshaf.png",
          height: 227,
        ),
        Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Text(
          "اسم السوره",
          textAlign: TextAlign.center,
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Divider(
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.star_border,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    flex: 3,
                    child: Divider(
                      color: Color(0xFFB7935F),
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.star_border,),
                  )),
                  SizedBox(
                    width: 12,
                  ),
                ],
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context,SuraDetailsScreen.routeName,
                  arguments: SuraModel(suraNames[index],index));
                },
                child: Text(
                  suraNames[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inder(
                    fontSize: 25,
                  ),
                ),
              );
            },
            itemCount: suraNames.length,
          ),
        )
      ],
    );
  }
}
