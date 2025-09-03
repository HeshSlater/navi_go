class AppTranslations {
  static String currentLanguage = 'english'; // Default language

  // Method to get translated text
  static String getText(String key) {
    return _translations[currentLanguage]?[key] ?? key;
  }

  // Method to change language
  static void setLanguage(String language) {
    currentLanguage = language.toLowerCase();
  }

  // Translation maps
  static final Map<String, Map<String, String>> _translations = {
    'english': {
      // Welcome pages
      'Welcome to \n': 'Welcome to \n',
      'Find your bus anytime anywhere': 'Find your bus anytime anywhere',
      'Track your bus in real time with live \nGPS updates, so you always \nknow where it is.': 'Track your bus in real time with live \nGPS updates, so you always \nknow where it is.',
      'Get Started': 'Get Started',

      // Language selection
      'choose_language': 'Choose your language',
      'english': 'English',
      'sinhala': 'Sinhala',
      'tamil': 'Tamil',

      // Area selection
      'select_areas': 'Select your areas',
      'next': 'Next',

      // Registration
      'registration': 'Registration',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'phone_number': 'Phone Number',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'register': 'Register',
      'back': 'Back',

      // Login
      'sign_in': 'Sign in',
      'email_phone': 'Email/Phone number',
      'remember_me': 'Remember me',
      'forgot_password': 'Forgot Password?',
      'not_registered': 'Are you new here?',
      'register_link': 'Register',

      // Area names
      'colombo': 'Colombo',
      'gampaha': 'Gampaha',
      'negombo': 'Negombo',
      'kaluthara': 'Kaluthara',
      'wattala': 'Wattala',
      'dehiwala': 'Dehiwala',
      'maharagama': 'Maharagama',
      'katunayake': 'Katunayake',
      'panadura': 'Panadura',
      'mirigama': 'Mirigama',
      'horana': 'Horana',
      'yakkala': 'Yakkala',
      'kaduwela': 'Kaduwela',
      'divulapitiya': 'Divulapitiya',
      'bambalapitiya': 'Bambalapitiya',
      'battaramulla': 'Battaramulla',
      'kelaniya': 'Kelaniya',
      'homagama': 'Homagama',
      'aluthgama': 'Aluthgama',
      'moratuwa': 'Moratuwa',
      'borella': 'Borella',
      'malabe': 'Malabe',
      'dodangoda': 'Dodangoda',
      'biyagama': 'Biyagama',
      'ja_ela': 'Ja-Ela',
      'minuwangoda': 'Minuwangoda',
    },

    'sinhala': {
      // Welcome pages
      'Welcome to \n': 'සාදරයෙන් පිළිගනිමු \n',
      'Find your bus anytime anywhere': 'ඕනෑම වේලාවක ඕනෑම තැනක ඔබේ බස් රථය සොයා ගන්න',
      'Track your bus in real time with live \nGPS updates, so you always \nknow where it is.': 'සජීවී GPS යාවත්කාලීන කිරීම් සමඟ \nඔබේ බස් රථය සත්‍ය කාලීනව \nනිරීක්ෂණය කරන්න.',
      'Get Started': 'ආරම්භ කරන්න',

      // Language selection
      'choose_language': 'ඔබේ භාෂාව තෝරන්න',
      'english': 'ඉංග්‍රීසි',
      'sinhala': 'සිංහල',
      'tamil': 'තමිල්',

      // Area selection
      'select_areas': 'ඔබේ ප්‍රදේශ තෝරන්න',
      'next': 'ඊළඟ',

      // Registration
      'registration': 'ලියාපදිංචි කිරීම',
      'first_name': 'මුල් නම',
      'last_name': 'අවසාන නම',
      'phone_number': 'දුරකථන අංකය',
      'password': 'මුර පදය',
      'confirm_password': 'මුර පදය තහවුරු කරන්න',
      'register': 'ලියාපදිංචි වන්න',
      'back': 'ආපසු',

      // Login
      'sign_in': 'පුරනය වන්න',
      'email_phone': 'ඊමේල්/දුරකථන අංකය',
      'remember_me': 'මට මතක තබාගන්න',
      'forgot_password': 'මුර පදය අමතකද?',
      'not_registered': 'ඔබ අලුත්ද?',
      'register_link': 'ලියාපදිංචි වන්න',

      // Area names in Sinhala
      'colombo': 'කොළඹ',
      'gampaha': 'ගම්පහ',
      'negombo': 'නෙගොම්බෝ',
      'kaluthara': 'කළුතර',
      'wattala': 'වත්තල',
      'dehiwala': 'දෙහිවල',
      'maharagama': 'මහරගම',
      'katunayake': 'කටුනායක',
      'panadura': 'පානදුර',
      'mirigama': 'මීරිගම',
      'horana': 'හොරණ',
      'yakkala': 'යක්කල',
      'kaduwela': 'කඩුවෙල',
      'divulapitiya': 'දිවුලපිටිය',
      'bambalapitiya': 'බම්බලපිටිය',
      'battaramulla': 'බත්තරමුල්ල',
      'kelaniya': 'කැළණිය',
      'homagama': 'හෝමාගම',
      'aluthgama': 'අලුත්ගම',
      'moratuwa': 'මොරටුව',
      'borella': 'බොරැල්ල',
      'malabe': 'මාලබේ',
      'dodangoda': 'දොඩන්ගොඩ',
      'biyagama': 'බියගම',
      'ja_ela': 'ජා-ඇල',
      'minuwangoda': 'මිනුවන්ගොඩ',
    },

    'tamil': {
      // Welcome pages
      'Welcome to \n': 'வரவேற்கிறோம் \n',
      'Find your bus anytime anywhere': 'எந்த நேரத்திலும் எங்கிருந்தும் உங்கள் பேருந்தைக் கண்டுபிடிக்கவும்',
      'Track your bus in real time with live \nGPS updates, so you always \nknow where it is.': 'உடனடி GPS புதுப்பிப்புகளுடன் \nஉங்கள் பேருந்தை நிகழ்நேரத்தில் \nகண்காணிக்கவும்.',
      'Get Started': 'தொடங்குங்கள்',

      // Language selection
      'choose_language': 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்',
      'english': 'ஆங்கிலம்',
      'sinhala': 'சிங்களம்',
      'tamil': 'தமிழ்',

      // Area selection
      'select_areas': 'உங்கள் பகுதிகளைத் தேர்ந்தெடுக்கவும்',
      'next': 'அடுத்து',

      // Registration
      'registration': 'பதிவு',
      'first_name': 'முதல் பெயர்',
      'last_name': 'கடைசி பெயர்',
      'phone_number': 'தொலைபேசி எண்',
      'password': 'கடவுச்சொல்',
      'confirm_password': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
      'register': 'பதிவு செய்க',
      'back': 'பின்செல்',

      // Login
      'sign_in': 'உள்நுழைக',
      'email_phone': 'மின்னஞ்சல்/தொலைபேசி எண்',
      'remember_me': 'என்னை நினைவில் வைத்துக் கொள்ளுங்கள்',
      'forgot_password': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
      'not_registered': 'நீங்கள் புதியவரா?',
      'register_link': 'பதிவு செய்க',

      // Area names in Tamil
      'colombo': 'கொழும்பு',
      'gampaha': 'கம்பஹா',
      'negombo': 'நெகொம்போ',
      'kaluthara': 'களுதறை',
      'wattala': 'வத்தலை',
      'dehiwala': 'தெஹிவளை',
      'maharagama': 'மஹரகமை',
      'katunayake': 'கட்டுநாயக்கே',
      'panadura': 'பனதுறை',
      'mirigama': 'மிரிகமை',
      'horana': 'ஹோரணை',
      'yakkala': 'யக்களை',
      'kaduwela': 'கடுவேளை',
      'divulapitiya': 'திவுலப்பிட்டியை',
      'bambalapitiya': 'பம்பலப்பிட்டியை',
      'battaramulla': 'பத்தரமுல்லை',
      'kelaniya': 'கேளணியை',
      'homagama': 'ஹோமகமை',
      'aluthgama': 'அலுத்கமை',
      'moratuwa': 'மொறட்டுவை',
      'borella': 'போரெல்லை',
      'malabe': 'மாலபே',
      'dodangoda': 'தொடங்கோடை',
      'biyagama': 'பியகமை',
      'ja_ela': 'ஜா-ஏலை',
      'minuwangoda': 'மினுவங்கோடை',
    },
  };
}

// Helper function for shorter syntax
String tr(String key) => AppTranslations.getText(key);