TBRCircularProgressView
=======================

Circular progress view similar to App Store download one


Screenshot
--------------------
![TBRCircularProgressView](https://raw.githubusercontent.com/techbrewers/TBRCircularProgressView/master/screenshot.gif)


Installation
-------------

* Add the classes inside TBRCircularProgressView folder to your project
	*	TBRCircularActivityLayer
	*	TBRCircularProgressLayer
	*	TBRCircularProgressView


Example
-----------------------
```objc
CGRect frame = CGRectMake(0, 0, 25, 25);
TBRCircularProgressView *circularProgressView = [[TBRCircularProgressView alloc] initWithFrame:frame];
[view addSubview:circularProgressView];

//Start spinning animation
[circularProgressView startLoadingAnimation];

//Stop spinning animation
[circularProgressView stopLoadingAnimation];

//Set the progress fraction (A value 0 to 1)
circularProgressView.progressFraction = 0.3;
```

License
==================

The MIT License (MIT)

Copyright (c) 2014 TechBrewers LTD.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.