//
//  WorkoutDetailsView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 12/9/22.
//
import SwiftUI

struct WorkoutDetailsView: View {
    
    var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading){
            Text(workout.day)
                .padding(.leading, 30)
                .font(.largeTitle)
            List(workout.routine, id: \.self){ exercise in
                Text(exercise)
            }
        }

    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(workout: Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Warmup", "planks", "weights"]))
    }
}
