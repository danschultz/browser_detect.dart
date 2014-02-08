library version_tests;

import 'package:unittest/unittest.dart';
import 'package:browser_detect/browser_detect.dart';

void testBrowserVersion() {
  group("BrowserVersion", () {
    group("#compareTo", () {
      test("should be 0 if value is same", () {
        var version = new BrowserVersion("1.0");
        expect(version.compareTo(new BrowserVersion("1.0")), equals(0));
      });

      test("should be 0 if value is same with padding", () {
        var version = new BrowserVersion("1");
        expect(version.compareTo(new BrowserVersion("1.0")), equals(0));
      });

      test("should be 1 if major is higher", () {
        var version = new BrowserVersion("2.0");
        expect(version.compareTo(new BrowserVersion("1.0")), equals(1));
      });

      test("should be -1 if major is lower", () {
        var version = new BrowserVersion("1.0");
        expect(version.compareTo(new BrowserVersion("2.0")), equals(-1));
      });

      test("should be 1 if minor is higher", () {
        var version = new BrowserVersion("1.1");
        expect(version.compareTo(new BrowserVersion("1.0")), equals(1));
      });

      test("should be -1 if major is lower", () {
        var version = new BrowserVersion("1.0");
        expect(version.compareTo(new BrowserVersion("1.1")), equals(-1));
      });
    });

    group(">", () {
      test("should handle strings", () {
        expect(new BrowserVersion("2.0") > "1", isTrue);
      });

      test("should be true if left is greater", () {
        expect(new BrowserVersion("2.0") > "1", isTrue);
      });

      test("should be false if left is lower", () {
        expect(new BrowserVersion("1") > "2", isFalse);
      });

      test("should be false if equal", () {
        expect(new BrowserVersion("1") > "1", isFalse);
      });
    });

    group(">=", () {
      test("should handle strings", () {
        expect(new BrowserVersion("2.0") >= "1", isTrue);
      });

      test("should be true if left is greater", () {
        expect(new BrowserVersion("2.0") >= "1", isTrue);
      });

      test("should be false if left is lower", () {
        expect(new BrowserVersion("1") >= "2", isFalse);
      });

      test("should be true if left is equal", () {
        expect(new BrowserVersion("1") >= "1", isTrue);
      });
    });

    group("<", () {
      test("should handle strings", () {
        expect(new BrowserVersion("2.0") < "1", isFalse);
      });

      test("should be false if left is greater", () {
        expect(new BrowserVersion("2.0") < "1", isFalse);
      });

      test("should be true if left is lower", () {
        expect(new BrowserVersion("1") < "2", isTrue);
      });

      test("should be false if equal", () {
        expect(new BrowserVersion("1") < "1", isFalse);
      });
    });

    group("<=", () {
      test("should handle strings", () {
        expect(new BrowserVersion("2.0") <= "1", isFalse);
      });

      test("should be false if left is greater", () {
        expect(new BrowserVersion("2.0") <= "1", isFalse);
      });

      test("should be true if left is lower", () {
        expect(new BrowserVersion("1") <= "2", isTrue);
      });

      test("should be true if equal", () {
        expect(new BrowserVersion("1") <= "1", isTrue);
      });
    });

    group("==", () {
      test("should handle strings", () {
        expect(new BrowserVersion("2.0") == "1", isFalse);
      });

      test("should be false if left is greater", () {
        expect(new BrowserVersion("2.0") == "1", isFalse);
      });

      test("should be false if left is lower", () {
        expect(new BrowserVersion("1") == "2", isFalse);
      });

      test("should be true if equal", () {
        expect(new BrowserVersion("1") == "1", isTrue);
      });
    });
  });
}