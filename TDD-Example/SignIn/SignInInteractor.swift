import Foundation

class SignInInteractor: SignInInteractorInput {
    
    private let output: SignInInteractorOutput!
    
    init(output: SignInInteractorOutput) {
        self.output = output
    }
    
    func signin(email: String, password: String) {}
    func validate(email: Stringg) {}
    func validate(password: Stringg) {}
}
