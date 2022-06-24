//
//  LBCUIFailureStepperTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureStepperTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithStepper

    func test_GetStepperElement_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getStepper(with: "wrongIdentifier")
        }
    }

    func test_Stepper_Wrong_Value() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getStepper(with: "stepperIdentifier")
                .validate(value: 120.0, throughLabel: "stepperLabelidentifier")
        }
    }

    func test_Stepper_Wrong_WrongLabelIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getStepper(with: "stepperIdentifier")
                .validate(value: 80.0, throughLabel: "wrongStepperLabelIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
