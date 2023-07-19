//
//  DietDataEntry.swift
//  FitnessTracking
//
//  Created by randy on 12/1/22.
//

import Foundation
import SwiftUI
import Firebase

struct DietDataEntry: View{
    var dietD: Diet_entry
    @State var showBreakfast = false
    @State var showLunch = false
    @State var showDinner = false
    var body: some View{
        VStack {
            Text(dietD.day)

            
            ButtonView(title: dietD.breakfast){
                showBreakfast.toggle()
            }
            .sheet(isPresented: $showBreakfast
                   , content: {
                individualFoods(dietc: dietD.dietsBreakfast)
            })
            
            ButtonView(title: dietD.lunch){
                showLunch.toggle()
            }
            .sheet(isPresented: $showLunch
                   , content: {
                individualFoods(dietc: dietD.dietsLunch)
            })
            ButtonView(title: dietD.dinner){
                showDinner.toggle()
            }
            .sheet(isPresented: $showDinner
                   , content: {
                individualFoods(dietc: dietD.dietsDinner)
            })




                }
           }
            
        }
        



struct DietDataEntry_preview: PreviewProvider {
    static var previews: some View {
        DietDataEntry(dietD: Diet_entry(day: "Monday", calorieCount: "0", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Hi", dietsLunch: "hi", dietsDinner: "hi"))
    }
}
