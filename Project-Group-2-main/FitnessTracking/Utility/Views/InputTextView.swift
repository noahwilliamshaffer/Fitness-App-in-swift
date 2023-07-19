//
//  InputTextView.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/2/22.
//

import SwiftUI

struct InputTextView: View {
    @Binding var text: String
    let holder: String
    let keyboard: UIKeyboardType
    
    var body: some View {
        TextField(holder , text: $text)
            .padding()
            .frame(width: 300, height: 50)
            .cornerRadius(10)
            .keyboardType(keyboard)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

struct InputTextView_Previews: PreviewProvider {
    static var previews: some View {
        
        InputTextView(text: .constant(""), holder: "Email",
                      keyboard: .emailAddress)
    }
}
