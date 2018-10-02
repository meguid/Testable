import Foundation

class SignInInteractor: SignInInteractorInput {
    
    private let output: SignInInteractorOutput!
    
    init(output: SignInInteractorOutput) {
        self.output = output
    }
    
    func signin(email: String, password: String) {}
    func validate(email: String) {}
    func validate(password: String) {}
}
