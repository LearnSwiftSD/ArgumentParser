import XCTest

import colorPrintTests

var tests = [XCTestCaseEntry]()
tests += colorPrintTests.allTests()
XCTMain(tests)
