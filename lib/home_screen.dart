import 'package:flutter/material.dart';
import 'detail.dart';
import 'my_content.dart';
import 'content_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Popular",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All"),
              _buildProductCategory(index: 1, name: "Anime"),
              _buildProductCategory(index: 2, name: "Manga"),
              _buildProductCategory(index: 3, name: "Webtoon"),
            ],
          ),
          const SizedBox( height: 20,),
          Expanded(
            child: isSelected ==0
                ?  _buildAllContent()
                : isSelected ==1
                ? _buildAnimeCategory()
                : isSelected ==2
                ?_buildMangaCategory()
                : _buildWebtoonCategory(),
          ),
        ],
      ),
    ) ;
  }

  _buildProductCategory({required int index , required String name})=>
      GestureDetector(
          onTap: () => setState(() => isSelected = index),
          child: Container(
            width: 100,
            height: 40,
            margin: const EdgeInsets.only(top: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isSelected== index ? Colors.black : Colors.white54,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text(
              name,
              style: const TextStyle(color: Colors.white70),
            ),
          )
      );



  _buildAllContent()=>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyContent.allContent.length,
    itemBuilder: (context, index){
      final allContent = MyContent.allContent[index];
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(content: allContent)
          ),
        ),
        child : ContentCard(content:allContent),
      );
    },
  );



  _buildAnimeCategory() =>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyContent.anime.length,
    itemBuilder: (context, index) {
      final anime = MyContent.anime[index];
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(content: anime)
          ),
        ),
        child : ContentCard(content:anime),
      );
    },
  );

  _buildMangaCategory() =>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyContent.manga.length,
    itemBuilder: (context, index) {
      final manga = MyContent.manga[index];
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(content: manga)
          ),
        ),
        child : ContentCard(content:manga),
      );
    },
  );

  _buildWebtoonCategory() =>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyContent.webtoon.length,
    itemBuilder: (context, index) {
      final webtoon = MyContent.webtoon[index];
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(content: webtoon)
          ),
        ),
        child : ContentCard(content:webtoon),
      );
    },
  );

}