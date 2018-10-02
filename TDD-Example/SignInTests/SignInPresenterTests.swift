import XCTest
@testable import TestableCodeExample

class SigninPresenterTests: XCTestCase {
    
    let presenterOutput = SignInPresenterOutputMock()
    var presenter: SignInPresenter!
    
    override func setUp() {
        presenter = SignInPresenter(output: presenterOutput)
    }
    
    func testSigninSuccess() {
        Global.user = nil
        presenterOutput.navigatedTo = ""
        presenter.signinSuccess(user: User())
        XCTAssertEqual(presenterOutput.navigatedTo, "Home")
        XCTAssertNotNil(Global.user)
        XCTAssertEqual(Global.user!.id, User().id)
    }
    
    func testSigninFail() {
        Global.user = nil
        presenterOutput.alertToShow = ""
        presenter.signinFail(error: APIError(error: "Failed to Connect to Network"))
        XCTAssertEqual(presenterOutput.alertToShow, "Failed to Connect to Network")
        XCTAssertNil(Global.user)
    }

    func testEmailValidationSuccess() {
        presenterOutput.greenMarkAddedToEmail = false
        presenter.emailValidationSuccess()
        XCTAssertEqual(presenterOutput.greenMarkAddedToEmail, true)
    }
    
    func testValidationFailed() {
        presenterOutput.alertToShow = ""
        presenter.validationFailed(error: "Invalid Email")
        XCTAssertEqual(presenterOutput.alertToShow, "Invalid Email")
        presenter.validationFailed(error: "Invalid Password")
        XCTAssertEqual(presenterOutput.alertToShow, "Invalid Password")
    }
    
    func testPasswordValidationSuccess() {
        presenterOutput.greenMarkAddedToPassword = false
        presenter.passwordValidationSuccess()
        XCTAssertEqual(presenterOutput.greenMarkAddedToPassword, true)
    }
}

class SignInPresenterOutputMock: SignInPresenterOutput {
    
    var navigatedTo: String = ""
    var alertToShow: String = ""
    var greenMarkAddedToEmail: Bool = false
    var greenMarkAddedToPassword: Bool = false

    func navigateToHome() {
        navigatedTo = "Home"
    }
    
    func showAlertError(error: String) {
        alertToShow = error
    }
    
    func addGreenMarkToEmail() {
        greenMarkAddedToEmail = false
    }
    
    func addGreenMarkToPassword() {
        greenMarkAddedToPassword = false
    }
}
