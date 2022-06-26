//
//  LBCUIFailureProgressIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureProgressIndicatorTests: LBCUITestCase{
    override func setUp() {
        self.homePageType = .homePageWithProgessView
        super.setUp()
        self.startApp(true)
    }

    func testGetWrongProgessView() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getProgressIndicator(with: "wrongIdentifier")
        }
    }

    func testCheckWrongProgessViewValue() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getProgressIndicator(with: "progressViewIdentifier")
                .validate(progressValue: 0.2)
        }
    }
}
