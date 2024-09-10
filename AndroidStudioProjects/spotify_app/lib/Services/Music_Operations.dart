import 'package:spotify_app/Models/Music.dart';

class MusicOperations {
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          'Jaat Jaatni',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHhhD0PXHt3lI3j4viCvUAjKS9elsSuvrU8g&s',
          'By Ajay Hooda'),
      Music(
          'JAAT DA MUQABALA',
          'https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/0c/a2/53/0ca25374-100d-1362-9a8c-d3f253423982/8903431696588_cover.jpg/256x256bb.jpg',
          'By Sidhu Moose Wala'),
      Music(
          'Chora Jaat Ka',
          'https://cdn.iconscout.com/icon/premium/png-256-thumb/chora-jaat-ka-2123230-1788521.png',
          'By Amanraj Gill'),
      Music(
          'Choudhar Jaat ki',
          'https://c.saavncdn.com/306/Choudhar-Jaat-Ki-Slowed-Reverb-Hindi-2023-20230914185226-250x250.jpg',
          'By Raju Punjabi'),
    ];
  }
}
