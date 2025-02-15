import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'hello': '1square',
          'message': 'Welcome to Proto Coders Point',
          'title': 'Flutter Language - Localization',
          'sub': 'Subscribe Now',
          'changelang': 'Change Language'
        },
        //HINDI LANGUAGE
        'hi_IN': {
          'hello': 'नमस्ते दुनिया',
          'message': 'प्रोटो कोडर प्वाइंट में आपका स्वागत है',
          'title': 'स्पंदन भाषा - स्थानीयकरण',
          'subscribe': 'सब्सक्राइब',
          'changelang': 'भाषा बदलो'
        },
        //KANNADA LANGUAGE
        'kn_IN': {
          'hello': 'ಹಲೋ ವರ್ಲ್ಡ್',
          'message': 'ಪ್ರೋಟೋ ಕೋಡರ್ ಪಾಯಿಂಟ್‌ಗೆ ಸುಸ್ವಾಗತ',
          'title': 'ಬೀಸು ಭಾಷೆ - ಸ್ಥಳೀಕರಣ',
          'subscribe': 'ವಂತಿಗೆ ಕೊಡು',
          'changelang': 'ಭಾಷೆ ಬದಲಿಸಿ'
        }
      };
}
