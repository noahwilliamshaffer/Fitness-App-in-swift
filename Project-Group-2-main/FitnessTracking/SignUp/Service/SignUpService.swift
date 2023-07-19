//
//  SignUpService.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/3/22.
//

import Foundation
import Combine
import FirebaseDatabase
import Firebase

enum dbKeys: String{
    case firstName
    case lastName
    case gender
    case age
    case height
    case weight
    case bmi
}

protocol SignUpService {
    func signup(with details: SignUpDetails) -> AnyPublisher<Void, Error>
}

final class SignUpImpl: SignUpService{
    
    func signup(with details: SignUpDetails) -> AnyPublisher<Void, Error>{
        Deferred{
            
            Future { promise in
                Auth.auth().createUser(withEmail: details.email,
                                       password: details.password) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        
                        if let uid = result?.user.uid{
                            
                            let fWeight = Float(details.weight) ?? 0.00
                            let fHeight = Float(details.height) ?? 0.00
                            let bmi = (fWeight / ((fHeight) * (fHeight))) * 703.0
                            
                            let values = [dbKeys.firstName.rawValue: details.firstName,
                                          dbKeys.lastName.rawValue: details.lastName,
                                          dbKeys.gender.rawValue: details.gender,
                                          dbKeys.age.rawValue: details.age,
                                          dbKeys.height.rawValue: details.height,
                                          dbKeys.weight.rawValue: details.weight,
                                          dbKeys.bmi.rawValue: String(bmi)] as [String : Any]
                            
                            Database.database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values)  { error, ref in
                                    
                                    if let err = error {
                                        print(error!.localizedDescription)
                                        promise(.failure(err))
                                    }
                                    else {
                                        promise(.success(()))
                                    }
                                }
                            
                        }
                        else{
                            promise(.failure(NSError(domain: "Invalid", code: 0)))
                        }
                        
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
