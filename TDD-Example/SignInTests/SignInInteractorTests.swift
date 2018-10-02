import XCTest

class SigninInteractorTests: XCTestCase {
    
    let interactorOutput = SignInInteractorOutputMock()
    let interactor: SignInInteractor!
    
    override func setUp() {
        interactor = SignInInteractor(output: interactorOutput)
    }
    
    func testSignInWithSuccessScenario() {
        interactorOutput.callStatus = false
        interactor.signin(email: "EMAIL", parameters: "CORRECT_PASSWORD")
        XCTAssertEqual(interactorOutput.callStatus, true)
    }
    
    func testSignInWithFailScenario() {
        interactorOutput.callStatus = false
        interactor.signin(email: "EMAIL", parameters: "WRONG_PASSWORD")
        XCTAssertEqual(interactorOutput.callStatus, false)
    }
    
    func testValidatingCorrectEmail() {
        interactorOutput.validated = false
        interactorOutput.emailValidated = false
        interactor.validate(email: "VALID_EMAIL")
        XCTAssertEqual(interactorOutput.validated, true)
        XCTAssertEqual(interactorOutput.emailValidated, true)
    }
    
    func testValidatingWrongEmail() {
        interactorOutput.validated = false
        interactorOutput.emailValidated = false
        interactor.validate(email: "INVALID_EMAIL")
        XCTAssertEqual(interactorOutput.validated, false)
        XCTAssertEqual(interactorOutput.emailValidated, false)
    }
    
    func testValidatingCorrectPassword() {
        interactorOutput.validated = false
        interactorOutput.passwordValidated = false
        interactor.validate(email: "VALID_PASSWORD")
        XCTAssertEqual(interactorOutput.validated, true)
        XCTAssertEqual(interactorOutput.passwordValidated, true)
    }
    
    func testValidatingWrongPassword() {
        interactorOutput.validated = false
        interactorOutput.passwordValidated = false
        interactor.validate(email: "INVALID_PASSWORD")
        XCTAssertEqual(interactorOutput.validated, false)
        XCTAssertEqual(interactorOutput.passwordValidated, false)
    }
}

class SignInInteractorOutputMock: SignInInteractorOutput {
    
    var callStatus: Bool = false
    var validated: Bool = false
    var passwordValidated: Bool = false
    var emailValidated: Bool = false

    func signinSuccess(user: User) {
        callStatus = true
    }
    
    func signinFail(error: APIError) {
        callStatus = false
    }
    
    func emailValidationSuccess() {
        validated = true
        emailValidated = true
    }
    
    func passwordValidationSuccess() {
        validated = true
        passwordValidated = true
    }
    
    func validationFailed(error: String) {
        validated = false
    }
}
