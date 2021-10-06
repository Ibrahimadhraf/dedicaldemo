import 'package:dedicaldemo/view/helpers/application_utils/language_utils/ar.dart';
import 'package:dedicaldemo/view/helpers/application_utils/language_utils/en.dart';
import 'package:get/get.dart';


class ApplicationTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
