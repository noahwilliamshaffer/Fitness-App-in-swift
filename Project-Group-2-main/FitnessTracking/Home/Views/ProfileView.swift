//
//  ProfileView.swift
//  FitnessTracking
//
//  Created by Xander Jean on 11/11/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        List {
             Section("Fitness Information") {
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Gender: \(sessionService.userDetails?.gender ?? "N/A")")
                Text("Age: \(sessionService.userDetails?.age ?? "N/A")")
                Text("Height: \(sessionService.userDetails?.height ?? "N/A")in")
                Text("Weight: \(sessionService.userDetails?.weight ?? "N/A")lbs")
                Text("bmi: \(sessionService.userDetails?.bmi ?? "N/A")")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
