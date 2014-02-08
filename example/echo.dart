library browser_detect.example.echo;

import 'package:browser_detect/browser_detect.dart';
import 'dart:html';

void main() {
  document.querySelector("#browser").innerHtml = browser.toString();
}