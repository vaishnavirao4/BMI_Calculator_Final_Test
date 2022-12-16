/**App Name: BMI Calculator
Version: 1.0
Created on: 16-12-2022
 
Created by:
 
Vaishnavi Santhapuri 301307031
 
 Description:
 This is a BMI Calcluator App.
 The BMI Calculator takes the input as weight and height in two different metrics
 The two different metrics are Inches/lbs and cm/kgs
 I have used slider for the two inputs
 Once clicking on Add button, the values will be stored into the core data.
 We can delete the records using the swipe functionality from right to left.

*/
import XCTest

class BMIAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
