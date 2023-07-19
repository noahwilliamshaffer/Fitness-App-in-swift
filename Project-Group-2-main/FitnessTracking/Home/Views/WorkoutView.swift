//
//  Workout.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 11/6/22.
//
import SwiftUI

struct WorkoutView: View {
    
    let NormalWorkouts = workoutsNormalData
    let OverweightWorkouts = workoutsOverweightData
    let UnderweightWorkouts = workoutsUnderweightData
    let fullBody = fullBodyWorkout
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        let StringWeight = sessionService.userDetails?.bmi ?? "N/A"
        let weight = Float(StringWeight) ?? 0
        //let randomInt = Int.random(in: 1..<7)

    
        NavigationView {
            VStack (alignment: .leading) {
                
                ForEach(fullBody) { workout in
                    NavigationLink(destination: WorkoutDetailsView(workout: workout)){
                        ZStack{
                            Image("arm-workout.jpg")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height:300)
                            //vertical stack
                            
                            VStack{
                                Spacer()
                                Text("Full Body")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                            }
                            .padding()
                            .frame(width: 380)
                            //.background(Color(UIColor.systemGray))
                        }
                        .frame(width:380, height:300)
                        .cornerRadius(20)
                        .shadow(radius: 8)
                        //.padding(.top, 20)
                        .padding()
                        .clipped()
                    }
                }
                
                
                Text("Daily Workouts")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        if weight == 25{
                            ForEach(NormalWorkouts){ workout in
                                // Day card
                                
                                NavigationLink(destination: WorkoutDetailsView(workout: workout)){
                                    ZStack {
                                        Image(workout.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(workout.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                        }
                        else if weight > 25{
                            ForEach(OverweightWorkouts){ workout in
                                // Day card
                                
                                NavigationLink(destination: WorkoutDetailsView(workout: workout)){
                                    ZStack {
                                        Image(workout.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(workout.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                        }
                        else{
                            ForEach(UnderweightWorkouts){ workout in
                                // Day card
                                
                                NavigationLink(destination: WorkoutDetailsView(workout: workout)){
                                    ZStack {
                                        Image(workout.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(workout.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                        }
                    }
                }
                .padding()
                .offset(x: 0, y: -35)
                Spacer()
            }
            .navigationBarTitle("Workouts")
        }
    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}




struct Workout: Identifiable{
    var id = UUID()
    
    var day: String
    var image: String
    var routine: [String]
}


let workoutsNormalData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Bench Press: warmups: 10 reps: 25%, 6 reps, 40%, 50%", " 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101% ", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["Jump rope 30 minutes, 200 Crunches", "Sprints: 100 meters, 12 reps", "Hit 10k steps"]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["DeadLift Warmups: 10 reps: 25%, 6 reps", "4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101% ", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["Dumbell Bicep curls, Dumbell Shoulder Press: 10 reps: 25%, 6 reps, 40%, 50%", "Dumbell Bicep curls, Dumbell Shoulder Press, 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101%", "Headcrushers 60% max, bench and tricep extension burnout to failure"]),
    Workout(day: "Friday", image: "rope", routine: ["Squat Warmups: 10 reps: 25%, 6 reps", "4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101%", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Saturday", image: "body", routine: ["Bench Press: warmups: 10 reps: 25%, 6 reps, 40%, 50%", "6 reps, 40%, 50%", " 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Sunday", image: "fight", routine: ["Jump rope 30 minutes, 200 Crunches", "Jog 7 miles", "Ice Bath"])
]
let workoutsOverweightData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Sprints: 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["5 mile jog", "Asisted pullups: 30 Assisted chinups 30", "Log 15k steps"]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["Sprints 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["5 mile jog", "Asisted pullups:30 Assisted chinups:30", "Log 15k steps"]),
    Workout(day: "Friday", image: "rope", routine: ["Sprints: 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Saturday", image: "body", routine: ["5 mile jog", "Asisted pullups:30 Assisted chinups:30", "Log 15k steps"]),
    Workout(day: "Sunday", image: "fight", routine: ["Jump rope 1 hour, 3 minute inc, 2 min rest", "Curls: 10 sets, 6 reps, maxmum intensity", "Log 15k steps"])
]

let workoutsUnderweightData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs, 100 grams of whey, sip between sets","Bench Press warmups: 10 reps: 25%, 6 reps, 40%, 50%", "Bench Press Workout: 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101% ", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs, 100 grams of whey, sip between sets", "Clean Warmup: 10 reps: 25%, 6 reps","Clean Workout: 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101%", "Shoulder press with Maximum weight you can do reps, 30, 20, 15, 10, 5, 3",]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs","DeadLift Warmups: 10 reps: 25%, 6 reps", "4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101% ", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs", "Dumbell Bicep curls, Dumbell Shoulder Press: 10 reps: 25%, 6 reps, 40%, 50%", "Dumbell Bicep curls, Dumbell Shoulder Press, 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101%", "Headcrushers 60% max, bench and tricep extension burnout to failure"]),
    Workout(day: "Friday", image: "rope", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs", "Squat Warmups: 10 reps: 25%, 6 reps", "4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%, 1 Rep 100%, 1 Rep 101%", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Saturday", image: "body", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs", "Bench Press: warmups: 10 reps: 25%, 6 reps, Bench Press Workout: 40%, 50%", "6 reps, 40%, 50%", " 4 Rep 60%,70%, || 2 Rep 80%,90% || 1 Rep 95%", "Delt raises, heaviest weight for reps, 30,20,15,10"]),
    Workout(day: "Sunday", image: "fight", routine: ["Intra Workout Shake: Fill Jug with 200 grams of carbs", "Sprints: 20 meters, 30 reps", "Ice Bath"])
]
let fullBodyWorkout = [
    Workout(day: "Full Body", image: "arm-workout.jpg", routine: ["Warmup", "Push-ups", "Cool Down"])
]
