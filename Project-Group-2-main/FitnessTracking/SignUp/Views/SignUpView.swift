//
//  SignUpView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/23/22.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @StateObject private var signupVM = SignUpViewModelImpl(service: SignUpImpl())
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                VStack{
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    InputTextView(text: $signupVM.details.email, holder: "Email",
                                  keyboard: .emailAddress)
                    
                    InputPasswordView(password: $signupVM.details.password, holder: "Password")
                    
                    Divider()
                    
                }
                VStack{
                    Text("User Details")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    InputTextView(text: $signupVM.details.firstName, holder: "First Name", keyboard: .default)
                    
                    InputTextView(text: $signupVM.details.lastName, holder: "Last Name", keyboard: .default)
                    
                    InputTextView(text: $signupVM.details.age, holder: "Age", keyboard: .default)
                    
                    InputTextView(text: $signupVM.details.gender, holder: "Gender",
                                  keyboard: .emailAddress)
                    
                    Divider()
                    
                    InputTextView(text: $signupVM.details.height, holder: "Height (in)" , keyboard: .default)
                    
                    
                    InputTextView(text: $signupVM.details.weight, holder: "Weight (lbs)" , keyboard: .default)
                }
                
                ButtonView(title: "Sign Up"){
                    signupVM.signup()
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
            .alert(isPresented: $signupVM.hasError,
                   content: {
                if case .failed(let error) = signupVM.state{
                    return Alert(title: Text("Error"), message: Text(error.localizedDescription))
                }
                else{
                    return Alert(title: Text("ERROR 505"), message: Text("unresolved issue on Sign Up"))
                }
            })

        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
