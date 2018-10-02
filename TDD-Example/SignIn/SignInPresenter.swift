import Foundation

class SignInPresenter: SignInPresenterInput {
    
    private var output: SignInPresenterOutput!
    
    init(output: SignInPresenterOutput) {
        self.output = output
    }
    
    func signinSuccess(user: User) {}
    func signinFail(error: APIError) {}
    func emailValidationSuccess() {}
    func passwordValidationSuccess() {}
    func validationFailed(error: String) {}
}
