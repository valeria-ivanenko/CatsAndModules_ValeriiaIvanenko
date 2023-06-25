//
//  CatsAndModules_ValeriiaIvanenkoUITests.swift
//  CatsAndModules_ValeriiaIvanenkoUITests
//
//  Created by лерк ка on 25.06.2023.
//

import XCTest

final class CatsAndModules_ValeriiaIvanenkoUITests: XCTestCase {

    func testScreenshots() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        sleep(3)
//        let list = app.groups.element(boundBy: 0)
//        XCTAssertTrue(list.exists)
//
//        let element = list.buttons.element(boundBy: 0)
//        XCTAssertTrue(element.exists)
        
        let element = app.buttons.element(boundBy: 1)
        XCTAssertTrue(element.exists)
        
        snapshot("ValeriiaIvanenko_MainScreen")
        
        element.tap()
        
        sleep(1)
//        let detailsScreen = app.groups.element(boundBy: 0)
//        XCTAssertTrue(detailsScreen.exists)
//
        let detailsImage = app.images.element(boundBy: 0)
        XCTAssertTrue(detailsImage.exists)
        sleep(3)
        snapshot("ValeriiaIvanenko_DetailsScreen")
    }
}
