import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random() ;
    return new MaterialApp(
      title: 'Welcome to Flutter',
        home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter  demo 初体验'),
        ),
        body: new Center(
          //child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[] ;
  final _biggerFont = const TextStyle(fontSize: 18.0) ;
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }


  Widget _buildSuggestions(){

    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i ){
        // 在每一列之前，添加一个1像素高的分隔线widget
          if(i.isOdd) return new Divider() ;
          final index = i ~/2 ;

          // 如果是建议列表中的最后一个单词对
          if(index >= _suggestions.length){
            // 接着在添加10个单词对添加到返回列表

            _suggestions.addAll(generateWordPairs().take(10)) ;
          }
          return null ;
//        return _bu
      },
      );
  }


  Widget _buildRow(WordPair pair){

      return new ListTile(
        title: new Text(
            pair.asPascalCase,
            style:_biggerFont),
      );

  }

}