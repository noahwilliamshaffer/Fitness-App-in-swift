//
//  SessionService.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/5/22.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum SessionState{
    case loggedIn
    case loggedOut
}

protocol SessionService{
    var state: SessionState {get}
    var userDetails: SessionDetails? {get}
    init()
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] result, user in
                guard let self = self else { return}
                self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid{
                    Database
                        .database()
                        .reference()
                        .child("users")
                        .child(uid)
                        .observe(.value) { [weak self] snapshot in
                            
                            guard let self = self,
                                  let value = snapshot.value as? NSDictionary,
                                  let firstName = value[dbKeys.firstName.rawValue] as? String,
                                  let lastName = value[dbKeys.lastName.rawValue] as? String,
                                  let gender = value[dbKeys.gender.rawValue] as? String,
                                  let age = value[dbKeys.age.rawValue] as? String,
                                  let height = value[dbKeys.height.rawValue] as? String,
                                  let weight = value[dbKeys.weight.rawValue] as? String,
                                  let bmi = value[dbKeys.bmi.rawValue] as? String
                            else{
                                return
                            }
                            
                                  DispatchQueue.main.async{
                                      self.userDetails = SessionDetails(firstName: firstName,
                                                                        lastName: lastName,
                                                                        gender: gender,
                                                                        age: age,
                                                                        height: height,
                                                                        weight: weight,
                                                                        bmi: bmi)
                                    }
                        }
                }
            }
    }
    
    func logout(){
        try? Auth.auth().signOut()
    }
    

}
