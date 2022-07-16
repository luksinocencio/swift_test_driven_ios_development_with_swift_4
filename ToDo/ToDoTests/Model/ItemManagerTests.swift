import XCTest

@testable import ToDo

import CoreLocation

final class ItemManagerTests: XCTestCase {

    var sut: ItemManager!

    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_ToDoCount_Initially_IsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }

    func test_DoneCount_Initially_IsZero() {
        XCTAssertEqual(sut.doneCount, 0)
    }

    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: ""))
        XCTAssertEqual(sut.toDoCount, 1)
    }

    func test_ItemAt_ReturnsAddedItem() {
        let item = ToDoItem(title: "")
        sut.add(item)

        let returnedItem = sut.item(at: 0)

        XCTAssertEqual(returnedItem.title, item.title)
    }

    func test_CheckItemAt_ChangesCounts() {
        sut.add(ToDoItem(title: ""))
        sut.checkItem(at: 0)

        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }

    func test_CheckItemAt_RemovesItFromToDoItems() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")

        sut.add(first)
        sut.add(second)
        sut.checkItem(at: 0)

        XCTAssertEqual(sut.item(at: 0).title, "Second")
    }

    func test_DoneItemAt_ReturnsCheckedItem() {
        let item = ToDoItem(title: "Foo")

        sut.add(item)
        sut.checkItem(at: 0)

        let returnedItem = sut.doneItem(at: 0)

        XCTAssertEqual(returnedItem.title, item.title)
    }

    func test_Items_WhenOneLocationIsNil_AreNotEqual()  {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: nil)
        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenTimestampsDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", timestamp: 1.0)
        let second = ToDoItem(title: "Foo", timestamp: 0.0)

        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenDescriptionDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")

        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenTitleDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Bar")

        XCTAssertNotEqual(first, second)
    }

    func test_RemoveAll_ResultsInCountsBeZero() {
        sut.add(ToDoItem(title: "Foo"))
        sut.add(ToDoItem(title: "Bar"))
        sut.checkItem(at: 0)

        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)

        sut.removeAll()
    }

    func test_Add_WhenItemIsAlreadyAdded_DoesNotIncreaseCount() {
        sut.add(ToDoItem(title: "Foo"))
        sut.add(ToDoItem(title: "Foo"))

        XCTAssertEqual(sut.toDoCount, 1)
    }
}
