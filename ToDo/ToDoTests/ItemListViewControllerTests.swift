import XCTest

@testable import ToDo

class ItemListViewControllerTests: XCTestCase {
    var sut: ItemListViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController

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
}
