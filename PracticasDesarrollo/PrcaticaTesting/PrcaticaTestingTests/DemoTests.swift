//
//  DemoTests.swift
//  PrcaticaTestingTests
//
//  Created by MacBook on 22/12/22.
//

import XCTest
@testable import PrcaticaTesting

final class DemoTests: XCTestCase {
    // [1]
    var contador: Contador?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // [2]
        contador = Contador()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // [3]
        contador = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // [4] Realizar prueba unitario
        // Si el ocntador no es cero, dara error y la prueba fallara
        
        XCTAssert(contador?.conteo == 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
