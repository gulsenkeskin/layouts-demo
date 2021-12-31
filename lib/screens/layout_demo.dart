import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MaterialApp(
    title: 'Travel',
    home: Travel(),
  ));
}

//uygulamanın çalışma zamanında json dosyası gibi bir varlığı dolaylı olarak yüklemek için kullanılır
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: "Travel");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      "Traverten bir çeşit kaya türüdür. Çeşitli nedenlere ve ortamlara bağlı, kimyasal reaksiyon sonucu çökelme ile oluşmaktadır. Bu reaksiyonlar sırasında kalsiyum hidro karbonat ile aşırı doymuş su yüze ulaşır, karbondioksit gazlanır ve geri kalanı karbondioksit yapıları olarak çöker. Termal sudaki karbondioksit ve atmosferdeki karbondioksit ile dengeye ulaşana kadar reaksiyon devam eder. Aynı zamanda bu reaksiyon; ortam sıcaklığı, hava koşulları ve suyun akış sürecinden de etkilenmektedir.",
      //softwraptrue olarak ayarlandığında , metin satırları bir sözcük sınırına kaydırmadan önce sütun genişliğini dolduracaktır.
      softWrap: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, "CALL"),
        _buildButtonColumn(color, Icons.near_me, "ROUTE"),
        _buildButtonColumn(color, Icons.share, "SHARE"),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            //const Image(image: AssetImage('images/pamukkale.jpg')),
            Image.asset(
              'images/pamukkale.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection(_favoriteCount, _isFavorited),
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  titleSection(int favoriteCount, bool isFavorited) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: const Text(
                        "Pamukkale Travertenleri",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Denizli Pamukkale",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(0),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                alignment: Alignment.centerRight,
                                icon: (_isFavorited
                                    ? const Icon(Icons.star)
                                    : const Icon(Icons.star_border)),
                                color: Colors.red[500],
                                onPressed: _toggleFavorite,
                              ),
                            ),
                            SizedBox(
                              width: 18,
                              child: SizedBox(
                                child: Text('$_favoriteCount'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}
