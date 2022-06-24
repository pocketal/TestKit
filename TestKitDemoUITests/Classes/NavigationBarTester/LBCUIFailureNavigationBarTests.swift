//
//  LBCUIFailureNavigationBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureNavigationBarTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithNavigationBar

    func testGetWrongNavigationBar() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "wrongIdentifier")
        }
    }

    func testGetWrongNavigationBarTitle() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "navigationBarIdentifier").validate(title: "XXX")
        }
    }

    func testGetNavigationBar_ChildContentWrongButton() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester
                .getNavigationBar(with: "navigationBarIdentifier")
                .content
                .getNavigationBarButton(with: "navigationBarButtonBadIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
