import XCTest

@testable import ToDo

class StoryboardTests: XCTestCase {
    func test_InitialViewController_IsItemListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is ItemListViewController)
    }
}
