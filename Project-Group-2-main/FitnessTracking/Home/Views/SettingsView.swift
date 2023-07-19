//
//  SettingsView.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/28/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Gender: \(sessionService.userDetails?.gender ?? "N/A")")
                Text("Age: \(sessionService.userDetails?.age ?? "N/A")")
                Text("Height: \(sessionService.userDetails?.height ?? "N/A")in")
                Text("Weight: \(sessionService.userDetails?.weight ?? "N/A")lbs")
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
