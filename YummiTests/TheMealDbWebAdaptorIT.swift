//
//  TheMealDbWebAdaptorIT.swift
//  YummiTests
//
//  Created by Cormell, David - DPC on 27/09/2024.
//

import XCTest
@testable import Yummi

final class TheMealDbWebAdaptorIT: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Unit test Networking Code: https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way
    func testGetRandomMealReturnsNotNilMealName() throws {
        //arrange
        let adaptor = TheMealDbWebAdaptor()
        let expectation = XCTestExpectation(description: "Call to Random Meal Web API")
        
        //act
        adaptor.getRandomMeal(completion: { meal in
            //assert
            XCTAssertNotNil(meal.strMeal)
            print(meal.strMeal) //Go to reports -> log, editor -> expand selected transcripts to see console output for test
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5.0)
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
