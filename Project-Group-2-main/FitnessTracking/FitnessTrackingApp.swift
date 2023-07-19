//
//  FitnessTrackingApp.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/10/22.
//

import SwiftUI
import Firebase

@main
struct FitnessTrackingApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var sessionService = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if #available(iOS 16.0, *) {
                    switch sessionService.state{
                    case .loggedIn:
                        HomeView()
                            .environmentObject(sessionService)
                    case .loggedOut:
                        LoginView()
                    }
                    
                }
                else {
                    // Fallback on earlier versions
                }
            }
            
        }
    }
}

