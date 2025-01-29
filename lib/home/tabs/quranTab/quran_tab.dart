import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islame_c13_sunday/home/tabs/quranTab/sura_item_horizontal.dart';
import 'package:islame_c13_sunday/home/tabs/quranTab/sura_name_item.dart';
import 'package:islame_c13_sunday/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(onSearch);
  }

  onSearch() {
    SuraModel.searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.suraNameEn) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/Logo.png'),
          _searchItem(),
          Text(
            "Most Recently",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          SuraModel.searchResult.isNotEmpty
              ? SizedBox()
              : SizedBox(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SuraItemHorizontal(
                          model: SuraModel.getSuraModel(index));
                    },
                    itemCount: SuraModel.ListCounts,
                  ),
                  height: 150,
                ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Suras List",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                endIndent: 40,
                indent: 40,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SuraNameItem(model:
                SuraModel.searchResult.isNotEmpty?
                   SuraModel.getSelectedSuraModel(index) :
                SuraModel.getSuraModel(index));
              },
              itemCount: SuraModel.searchResult.isNotEmpty
                  ? SuraModel.searchResult.length
                  : SuraModel.ListCounts,
            ),
          )
        ],
      ),
    );
  }

  Widget _searchItem() {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.elMessiri(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          controller: searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText: "Sura Name",
              prefixIcon: ImageIcon(
                AssetImage("assets/images/ic_pre_search.png"),
                color: Color(0xFFE2BE7F),
              ),
              hintStyle: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color(0xFFE2BE7F),
                    width: 3,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F), width: 3))),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
