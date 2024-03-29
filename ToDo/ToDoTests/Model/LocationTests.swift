import XCTest

@testable import ToDo
import CoreLocation

final class LocationTests: XCTestCase {
    func test_Init_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)

        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)

        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }

    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))

        XCTAssertNotEqual(first, second)
    }

    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")

        XCTAssertEqual(first, second)
    }

    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        assertLocationNotEqualWith(
            firstName: "Foo",
            firstLongLat: (1.0, 0.0),
            secondName: "Foo",
            secondLongLat: (0.0, 0.0)
        )
    }

    func test_Locations_WhenOnlyOneHasCoordinate_AreNotEqual() {
        assertLocationNotEqualWith(
            firstName: "Foo",
            firstLongLat: (0.0, 0.0),
            secondName: "Foo",
            secondLongLat: nil
        )
    }

    func test_Locations_WhenNamesDiffer_AreNotEqual() {
        assertLocationNotEqualWith(
            firstName: "Foo",
            firstLongLat: nil,
            secondName: "Bar",
            secondLongLat: nil
        )
    }

    func assertLocationNotEqualWith(firstName: String,
                                    firstLongLat: (Double, Double)?,
                                    secondName: String,
                                    secondLongLat: (Double, Double)?,
                                    line: UInt = #line) {
        var firstCoord: CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)

        var secondCoord: CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)

        XCTAssertNotEqual(firstLocation, secondLocation, line: line)
    }
}
