import XCTest
@testable import FirstDemo

class FirstDemoTests: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        viewController = ViewController()
    }

    func test_NumberOfVowels_WhenPassedDominik_ReturnsThree() {
        let string = "Dominik"
        let numberOfVowels = viewController.numberOfVowels(in: string)

        XCTAssertEqual(numberOfVowels, 3, "Should find 3 vowels in Dominik")
    }

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital() {
        let input = "this is A test headline"
        let expectedOut = "This Is A Test Headline"

        let headline = viewController.makeHeadline(from: input)

        XCTAssertEqual(headline, expectedOut)
    }

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital2() {
        let input = "Here is another Example"
        let expectedOut = "Here Is Another Example"

        let headline = viewController.makeHeadline(from: input)

        XCTAssertEqual(headline, expectedOut)
    }
}
