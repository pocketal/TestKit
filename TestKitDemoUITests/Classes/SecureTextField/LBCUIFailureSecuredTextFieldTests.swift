//
//  LBCUIFailureSecuredTextFieldTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Pierre A on 11/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureSecuredTextFieldTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSecuredTextField
        super.setUp()
    }

    func test_SecuredTextField_wrongIdentifier() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSecuredTextField(with: "wrongIdentifier")
        }
    }

    func test_SecuredTextField_wrongGetter() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
        }
    }
}
