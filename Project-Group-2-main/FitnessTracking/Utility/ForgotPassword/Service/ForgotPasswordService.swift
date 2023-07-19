//
//  ForgotPasswordService .swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 12/9/22.
//
import Foundation
import Combine
import FirebaseAuth

protocol ForgotPasswordService {
    func PasswordReset(to email: String) -> AnyPublisher<Void,Error>
}
final class ForgotPasswordServiceImpl: ForgotPasswordService{

    func PasswordReset(to email: String) -> AnyPublisher<Void, Error> {

        Deferred{
            Future{ promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email){ error in

                        if let err = error{
                            promise( .failure(err))
                        }
                        else{
                            promise( .success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
