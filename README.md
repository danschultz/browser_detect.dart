## Browser Detect
A package that detects the browser being used to view a web page. Useful for blanket browser detection. If possible, try to use [feature detection](http://www.html5rocks.com/en/tutorials/detection/#feature-detection) over this approach.

### Usage
Import the Browser Detect package.

	import 'package:browser_detect/browser_detect.dart';
	
Use the library's `browser` field to query for information about the detected browser. This field contains properties for checking the browser type and version.

	if (browser.isIe && browser.version <= "9") {
	  // Do something.
	}