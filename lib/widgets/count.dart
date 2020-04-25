import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom show Element, Document;

Future<String> getCount(String uri, String path) async {
  http.Response response = await http.get(uri);
  dom.Document document = parser.parse(response.body);
  await for (dom.Element element in tagStream(document, 'strong', path)) {
    return element.text;
  }
  return "Placeholder";
}

Stream tagStream(dom.Document document, String tag, String path) async* {
  List elements = document.querySelectorAll(path);
  //dom.Element element = document.querySelector(path);
  yield elements[0];
}
