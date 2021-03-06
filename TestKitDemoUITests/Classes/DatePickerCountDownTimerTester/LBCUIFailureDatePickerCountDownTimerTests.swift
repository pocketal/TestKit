//
//  LBCUIFailureDatePickerCountDownTimerTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureDatePickerCountDownTimerTests: LBCUITestCase {
    override func setUp() {
        self.homePageType = .homePageWithDatePicker
        super.setUp()
        self.startApp()
    }

    func testGetDatePicker_WrongIdentifier() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "wrongIdentifier")
        }
    }

    func testGetDatePicker_WrongHour() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.hour(value: 2))
        }
    }

    func testGetDatePicker_WrongMinutes() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.minutes(value: 5))
        }
    }

    func testGetDatePicker_UpdateHour_Failure() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.hour(value: 15))
                .move(.hour(value: 20))
                .validate(.hour(value: 10))
        }
    }

    func testGetDatePicker_UpdateMinutes_Failure() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.minutes(value: 30))
                .move(.minutes(value: 15))
                .validate(.minutes(value: 4))
        }
    }
}
