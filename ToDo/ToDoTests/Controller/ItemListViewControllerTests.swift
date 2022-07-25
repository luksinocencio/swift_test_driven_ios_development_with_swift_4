import XCTest

@testable import ToDo

class ItemListViewControllerTests: XCTestCase {
    var sut: ItemListViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController

        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }

    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }

    func test_LoadingView_DataSourceEqualDelegate() {
        XCTAssertEqual(
          sut.tableView.dataSource as? ItemListDataProvider,
          sut.tableView.delegate as? ItemListDataProvider
        )
    }
    
    func test_ItemListViewController_HasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? UIViewController, sut)
    }
    
    func test_AddItem_PresentsAddItemViewController() {
        XCTAssertNil(sut.presentedViewController)
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        guard let addButton = sut.navigationItem.rightBarButtonItem else { XCTFail(); return }
        guard let action = addButton.action else { XCTFail(); return }
        
        sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
        
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is InputViewController)
        
        let inputViewController = sut.presentedViewController as! InputViewController
        XCTAssertNotNil(inputViewController.titleTextField)
    }
}
