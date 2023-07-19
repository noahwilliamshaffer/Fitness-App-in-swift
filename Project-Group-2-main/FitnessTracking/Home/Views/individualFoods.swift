//
//  individualFoods.swift
//  FitnessTracking
//
//  Created by randy on 12/9/22.
//

import SwiftUI

struct individualFoods: View {
    @Environment(\.presentationMode) var presentationMode
    var dietc: String

    var body: some View {
        VStack{
            
            Text(dietc)
            
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

struct individualFoods_Previews: PreviewProvider {
    static var previews: some View {
        individualFoods(dietc: "diet")
    }
}
