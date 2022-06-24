//
//  LBCUISuccessDatePickerTimeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessDatePickerTimeTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithDatePicker

    func testGetDatePicker() {
        self.startApp()
        self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
            .validate(.hour(value: 3))
            .validate(.minutes(value: 30))
            .validate(.meridiem(type: .pm))
            .move(.hour(value: 8))
            .move(.minutes(value: 5))
            .move(.meridiem(type: .am))
            .validate(.hour(value: 8))
            .validate(.minutes(value: 5))
            .validate(.meridiem(type: .am))
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
