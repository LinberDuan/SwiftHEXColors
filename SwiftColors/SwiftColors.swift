//  SwiftColors.swift
//
// Copyright (c) 2014 SwiftHEXColors contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

extension UIColor {
  convenience init(hexString: String, alpha: Float) {
    var hex = hexString

    // Check for hash and remove the hash
    if hex.hasPrefix("#") {
      hex = hex.substringFromIndex(advance(hex.startIndex, 1))
    }
    
    // Check for string length
    assert(countElements(hex) == 6 || countElements(hex) == 3)

    var redHex = hex.substringToIndex(advance(hex.startIndex, 2))
    var greenHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 2), end: advance(hex.startIndex, 4)))
    var blueHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 4), end: advance(hex.startIndex, 6)))
    
    var redInt:   CUnsignedInt = 0
    var greenInt: CUnsignedInt = 0
    var blueInt:  CUnsignedInt = 0

    NSScanner.scannerWithString(redHex).scanHexInt(&redInt)
    NSScanner.scannerWithString(greenHex).scanHexInt(&greenInt)
    NSScanner.scannerWithString(blueHex).scanHexInt(&blueInt)

    self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
  }
}