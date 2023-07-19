//
//  UserDataService.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/25/22.
//

//
//  UserDataViewModel.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//



import Foundation
import Combine
import FirebaseDatabase
import Firebase

enum UserKeys: String{
    case firstName
    case lastName
}

protocol UserDataService {
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>
}

final class UserDataImpl: UserDataService{
    
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>{
        Deferred{
            
            Future { promise in
                Auth.auth().createUser(withEmail: details.gender,
                                       password: details.height) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        
                        if let uid = result?.user.uid{
                            
                            let values = [dbKeys.firstName.rawValue: details.weight,
                                          dbKeys.lastName.rawValue: details.age] as [String : Any]
                            
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
/*

import Foundation
import Combine

enum UserDataState{
    case successful
    case failed(error: Error)
    case na
}

protocol UserDataViewModel {
    func UserData()
    var service: UserDataService {get}
    var state: UserDataState {get}
    var details: UserDataDetails {get}
    var hasError: Bool {get}
    init(service: UserDataService)
}

final class UserDataViewModelImpl: ObservableObject, UserDataViewModel{
    
    let service: UserDataService
    
    @Published var state: UserDataState = .na
    
    @Published var hasError: Bool = false
    
    @Published var details: UserDataDetails = UserDataDetails(gender: "",
                                               age: "",
                                               height: "",
                                               weight: "",
                                               activity: "", goal: "")
    init(service: UserDataService){
        self.service = service
        
        $state
            .map{ state -> Bool in
                switch state {
                case .successful, .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func UserData() {
        
        service
            .UserData(with: details)
            .sink { res in
                
                switch res{
                case .failure(let error):
                    self.state = .failed(error: error)
                default: break
                }
                
            } receiveValue: {  [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
    }
}



import Foundation
import Combine
import FirebaseDatabase
import Firebase

enum UserKeys: String{
    case firstName
    case lastName
}

protocol UserDataService {
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>
}

final class UserDataImpl: UserDataService{
    
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>{
        Deferred{
            
            Future { promise in
                Auth.auth().createUser(withEmail: details.gender,
                                       password: details.height) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        
                        if let uid = result?.user.uid{
                            
                            let values = [dbKeys.firstName.rawValue: details.weight,
                                          dbKeys.lastName.rawValue: details.age] as [String : Any]
                            
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




import Foundation
import Combine
import FirebaseAuth

protocol UserDataService{
    func UserData(with details:  UserDataDetails) -> AnyPublisher<Void,Error>
}
final class UserDataServiceImpl: UserDataService {
    func UserData(with details:  UserDataDetails) -> AnyPublisher<Void,Error> {
        Deferred{
            
           
            Future { promise in
                //Change to the database name here
                Auth.auth().signIn(withEmail: details.gender,
                                       password: details.goal) { result, error in
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
*/


