//
//  SignUpViewModel.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/3/22.
//

import Foundation
import Combine

enum SignUpState{
    case successful
    case failed(error: Error)
    case na
}

protocol SignUpViewModel {
    func signup()
    var service: SignUpService {get}
    var state: SignUpState {get}
    var details: SignUpDetails {get}
    var hasError: Bool {get}
    init(service: SignUpService)
}

final class SignUpViewModelImpl: ObservableObject, SignUpViewModel{
    
    let service: SignUpService
    
    @Published var state: SignUpState = .na
    
    @Published var hasError: Bool = false
    
    @Published var details: SignUpDetails = SignUpDetails(email: "",
                                                          password: "",
                                                          firstName: "",
                                                          lastName: "",
                                                          gender: "",
                                                          age: "",
                                                          height: "",
                                                          weight: "",
                                                          bmi: 0.00)
    init(service: SignUpService){
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
    
    func signup() {
        
        service
            .signup(with: details)
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
