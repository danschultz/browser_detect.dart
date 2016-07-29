library browser_detect.example;

import 'package:browser_detect/browser_detect.dart';
import 'dart:html';

void main() {
  document.querySelector("#browser").innerHtml = browser.toString();
  document.querySelector("#platform").innerHtml = platform.toString();
}