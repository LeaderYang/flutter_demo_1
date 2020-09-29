import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _images = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.black);
  final _biggerFont2 = const TextStyle(fontSize: 20.0, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
      // 在每一列之前，添加一个1像素高的分隔线widget
      if (i.isOdd) return new Divider();

      // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
      // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
      final index = i ~/ 2;
      // 如果是建议列表中最后一个单词对
      if (index >= _suggestions.length) {
        // ...接着再生成10个单词对，然后添加到建议列表
        _suggestions.addAll(generateWordPairs().take(7));
        _images.add("assets/images/dart.jpg");
        _images.add("assets/images/icon_head.png");
        _images.add("assets/images/java.jpeg");
        _images.add("assets/images/kotlin.jpg");
        _images.add("assets/images/leaf.png");
        _images.add("assets/images/left_chat.png");
        _images.add("assets/images/pica.gif");
      }
      return _buildRow(_suggestions[index], index, _images[index]);
    });
  }

//  Widget _buildGrid() => GridView.extent(
//      maxCrossAxisExtent: 150,
//      padding: const EdgeInsets.all(4),
//      mainAxisSpacing: 4,
//      crossAxisSpacing: 4,
//      children: _buildGridTileList());

// The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
// The List.generate() constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
//  List<Widget> _buildGridTileList() {
//    var photos = _getPhotos();
//    return List.generate(100, (i) =>  Container(child: _getImage(photos, i)));
//  }

  Future<List<AlbumModelEntity>> _getPhotos() async {
    return await PhotoAlbumManager.getDescAlbumImg(maxCount: 1);
  }

  Widget _getImage(List<AlbumModelEntity> photos, int i) {
    return new Image(
        image: new FileImage(File.fromUri(Uri.parse(photos[i].thumbPath))));
  }

  Widget _buildRow(WordPair pair, int index, String img) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: alreadySaved ? _biggerFont2 : _biggerFont,
      ),
      subtitle: new Text(pair.asPascalCase,
          style: new TextStyle(fontSize: 12.0, color: Colors.pink)),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      leading: new Image(image: AssetImage(img)),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
