//
//  HomeView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/23/22.
//

import SwiftUI

struct DietView: View {
    var body: some View {
        Text("Diet")
    }
}

struct LogoutView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View{
        VStack{
            ButtonView(title: "Logout"){
                sessionService.logout()
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        TabView {
            WorkoutView()
                .tabItem {
                    Label("Workouts", systemImage: "figure.cooldown")
                }
            Diet()
                .tabItem {
                    Label("Diet", systemImage: "fork.knife")
                }
            ProfileView()
                .tabItem {
                    Label("Fitness Profile", systemImage: "figure.run")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            LogoutView()
                .tabItem{
                    Label("Logout", systemImage: "arrow.right")
                }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
