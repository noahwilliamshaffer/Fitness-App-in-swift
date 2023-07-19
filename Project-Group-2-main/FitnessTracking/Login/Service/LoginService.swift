//
//  LoginService.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/5/22.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoginService{
    func login(with details:  LoginDetails) -> AnyPublisher<Void,Error>
}

final class LoginServiceImpl: LoginService {
    func login(with details:  LoginDetails) -> AnyPublisher<Void,Error> {
        Deferred{
            
            Future { promise in
                Auth.auth().signIn(withEmail: details.email,
                                       password: details.password) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        promise(.success(()))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
