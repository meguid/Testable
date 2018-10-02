import Foundation

func configure(output: SignInOutput) -> SignInInput {
    let presenter = SignInPresenter(output: output)
    let interactor = SignInInteractor(output: presenter)
    return interactor
}

protocol SignInInput {
    func signin(email: String, password: String)
    func validate(email: String)
    func validate(password: String)
}

protocol SignInInteractorInput: SignInInput {}

protocol SignInInteractorOutput {
    func signinSuccess(user: User)
    func signinFail(error: APIError)
    func emailValidationSuccess()
    func passwordValidationSuccess()
    func validationFailed(error: String)
}

protocol SignInPresenterInput: SignInInteractorOutput {}

protocol SignInPresenterOutput {
    func navigateToHome()
    func showAlertError(error: String)
    func addGreenMarkToEmail()
    func addGreenMarkToPassword()
}

protocol SignInOutput: SignInPresenterOutput {}

