//
//  LoginViewModel.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/5/22.
//

import Foundation
import Combine

enum LoginState{
    case successful
    case failed(error: Error)
    case na
}

protocol LoginViewModel {
    func login()
    var service: LoginService {get}
    var state: LoginState {get}
    var details: LoginDetails {get}
    var hasError: Bool {get}
    init(service: LoginService)
}

final class LoginViewModelImpl: ObservableObject, LoginViewModel{
    
    @Published var state: LoginState = .na
    @Published var hasError: Bool = false
    @Published var details: LoginDetails = LoginDetails(email: "", password: "")
    
    let service: LoginService
    
    init(service: LoginService){
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
    
    func login(){
        service
            .login(with: details)
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
