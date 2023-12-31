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
        XCTAssertEqual(app.staticTexts.firstMatch.label, "600.0 g of Minced Beef (meat) which expires on December 12, 2023")
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Next Ingredient"]/*[[".cells.buttons[\"Next Ingredient\"]",".buttons[\"Next Ingredient\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(app.staticTexts.firstMatch.label, "500.0 L of Whole Milk (dairy) which expires on December 11, 2023")

    }
    
    func testNextIngredientChangesDisplayToSomethingDifferent() throws {
        let app = XCUIApplication()
        app.launch()
        
        //assuming no identical ingredients in data set
        for _ in 1...10 {
            let ingredientDisplay = app.staticTexts.firstMatch.label
            app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Next Ingredient"]/*[[".cells.buttons[\"Next Ingredient\"]",".buttons[\"Next Ingredient\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
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
