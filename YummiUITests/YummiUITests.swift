//
//  YummiUITests.swift
//  YummiUITests
//
//  Created by Cormell, David - DPC on 11/12/2023.
//

import XCTest

final class YummiUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCyclingThroughFirstTwoRecipesUpdatesDisplayCorrectly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertEqual(app.staticTexts.firstMatch.label, "1Kg of Minced Beef (Meat) which expires on 21st February 2024")
        app.collectionViews.buttons["Next"].tap()
        XCTAssertEqual(app.staticTexts.firstMatch.label, "1Kg of Minced Pork (Meat) which expires on 21st February 2024")

    }
    
    func testNextIngredientChangesDisplayToSomethingDifferent() throws {
        let app = XCUIApplication()
        app.launch()
        
        //assuming no identical ingredients in data set
        for _ in 1...10 {
            let ingredientDisplay = app.staticTexts.firstMatch.label
            app.collectionViews.buttons["Next"].tap()
            let ingredientDisplayAfterNext = app.staticTexts.firstMatch.label
            XCTAssertNotEqual(ingredientDisplay, ingredientDisplayAfterNext)
        }

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
