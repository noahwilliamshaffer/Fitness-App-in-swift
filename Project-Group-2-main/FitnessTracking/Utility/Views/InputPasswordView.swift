//
//  InputPasswordView.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/2/22.
//

import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    let holder: String
    
    var body: some View {
        SecureField(holder, text: $password)
            .padding()
            .frame(width: 300, height: 50)
            .cornerRadius(10)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    
    static var previews: some View {
        InputPasswordView(password: .constant(""), holder: "Password")
    }
}
