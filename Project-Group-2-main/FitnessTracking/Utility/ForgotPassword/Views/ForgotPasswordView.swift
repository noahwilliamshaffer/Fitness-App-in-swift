//
//  PasswordResetView.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 12/9/22.
//
import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {

    @StateObject private var forgotPasswordVM = ForgotPasswordViewModelImpl(service: ForgotPasswordServiceImpl())

    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        NavigationView{

            VStack{

                VStack{
                    Text("Reset Password")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    InputTextView(text: $forgotPasswordVM.email, holder: "Email",
                                  keyboard: .emailAddress)

                    ButtonView(title: "Password Reset Request"){
                        forgotPasswordVM.PasswordReset()
                        presentationMode.wrappedValue.dismiss()
                    }

                    Divider()

                }

            }
            .padding()
            .toolbar{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
    }

}
