//
//  ForgotPasswordViewModel.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 12/9/22.
//
import Foundation
import Combine

protocol ForgotPasswordViewModel{
    func PasswordReset()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init (service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel{
    @Published var email: String = ""

    let service: ForgotPasswordService

    private var subscriptions = Set<AnyCancellable>()

    init(service: ForgotPasswordService) {
        self.service = service
    }

    func PasswordReset(){

        service
            .PasswordReset(to: email)
            .sink{ res in

                switch res{
                case .failure (let err):
                    print("Failure: \(err)")
                default: break
                }
            } receiveValue: {
                print("Password Request Sent")
            }
            .store(in: &subscriptions)

    }
}
