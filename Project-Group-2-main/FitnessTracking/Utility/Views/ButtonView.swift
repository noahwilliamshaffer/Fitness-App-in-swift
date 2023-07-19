//
//  ButtonView.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/2/22.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let handler: ActionHandler
    
    internal init(title: String, background: Color = .black, foreground: Color = .white, handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(width: 300, height: 50)
        })
        .frame(width: 300, height: 50)
        .foregroundColor(foreground)
        .background(background)
        .cornerRadius(10)
        .font(.system(size: 16 ,weight: .bold))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Login"){ }
    }
}
