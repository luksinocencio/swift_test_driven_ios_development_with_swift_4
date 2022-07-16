import XCTest

@testable import ToDo

import CoreLocation

class ToDoItemTests: XCTestCase {
    func test_Init_WhenGivenTitle_SetsTitle() {
      let item = ToDoItem(title: "Foo")
      XCTAssertEqual(item.title, "Foo", "should set title")
    }

    func test_Init_WhenGivenDescription_SetsDescripiton() {
      let item = ToDoItem(title: "", itemDescription: "Bar")
      XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
    }

    func test_Init_TakesTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertNotNil(item, "item should not be nil")
    }
    
    func test_Init_TakesTitleAndDescription() {
        _ = ToDoItem(title: "Foo",
                     itemDescription: "Bar")
    }

    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
    }

    func test_Init_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }

    func test_Init_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)

        XCTAssertEqual(item.location?.name, location.name, "should set location")
    }

    func test_Init_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
}
