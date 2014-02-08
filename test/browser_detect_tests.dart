library browser_detect_tests;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'browser_version_tests.dart';

void main() {
  useHtmlEnhancedConfiguration();

  testBrowserVersion();
}