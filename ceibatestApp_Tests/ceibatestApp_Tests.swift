//
//  ceibatestApp_Tests.swift
//  ceibatestApp_Tests
//
//  Created by inicial on 23/9/22.
//

import XCTest
@testable import ceibatestApp
import Combine

final class ceibatestApp_Tests: XCTestCase {
    
    var viewModel: HomeViewModel?
    var dataService: UserDataService?
    var coreDataService: CoreDataUserService?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
  
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData() {
        // Given
        let cr = coreDataService

        // When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            cr?.saveData()
        }
        
        // Then
        do {
            try cr?.saveData()
        } catch let error {
            let returnedError = error as? CoreDataUserService.DataError
            XCTAssertEqual(returnedError, CoreDataUserService.DataError.noData)
        }
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldSaveItem() {
        // Given
        let cr = coreDataService

        // When
        let loopCount: Int = Int.random(in: 1..<10)
        var itemsArray: [UserModel] = []
        
        for _ in 0..<loopCount {
            let newItem = MockUser.userModel
            cr?.addUser(userData: newItem)
            itemsArray.append(newItem)
        }
        
        
        // Then
        XCTAssertNoThrow(try cr?.addUser(userData: MockUser.userModel))
        
        do {
            try cr?.addUser(userData: MockUser.userModel)
        } catch {
            XCTFail()
        }
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombineUSER_shouldReturnError() {
        // Given
        let vm = HomeViewModel()

        // When
        let expectation = XCTestExpectation(description: "Should not return items after 3 seconds.")
        
        vm.$allUser
            
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        
                
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(vm.allUser.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombinePOST_shouldReturnError() {
        // Given
        let vm = HomeViewModel()

        // When
        let expectation = XCTestExpectation(description: "Should not return items after 3 seconds.")
        
        vm.$allPost
            
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        
                
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(vm.allUser.count, 0)
       
    }
    
    
    
    
     

}
