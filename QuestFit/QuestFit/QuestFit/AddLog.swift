//
//  AddLog.swift
//  QuestFit
//
//  Created by Max Lopez on 3/21/24.
//
import SwiftUI

struct AddLog: View {
    @Binding var loggedWorkouts: ListOfWorkouts
    @Environment(\.presentationMode) var presentationMode
    
    let workoutCategories = [
        "Chest": ["Bench Press", "Push-ups", "Dumbbell Flyes"],
        "Back": ["Pull-ups", "Deadlifts", "Rows"],
        "Arms": ["Bicep Curls", "Tricep Dips", "Hammer Curls"],
        "Legs": ["Squats", "Lunges", "Leg Press"]
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List(workoutCategories.keys.sorted(), id: \.self) { category in
                    NavigationLink(destination: WorkoutListView(workouts: workoutCategories[category] ?? [], category: category, loggedWorkouts: $loggedWorkouts)) {
                        Text(category)
                    }
                }
                .navigationTitle("Workout Categories")
                
                Spacer()
                
                Button(action: {
                    // Dismiss the current view to return to WorkoutLogView
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("End Workout")
                }
                .padding()
            }
        }
    }
}



struct WorkoutListView: View {
    let workouts: [String]
    let category: String
    @Binding var loggedWorkouts: ListOfWorkouts
    
    var body: some View {
        List(workouts, id: \.self) { workout in
            NavigationLink(destination: LogWorkoutView(workout: workout, loggedWorkouts: $loggedWorkouts)) {
                Text(workout)
            }
        }
        .navigationTitle(category)
    }
}

struct LogWorkoutView: View {
    @State private var weight: String = ""
    @State private var reps: String = ""
    @State private var sets: String = ""
    @State private var notes: String = ""
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    let workout: String
    @Binding var loggedWorkouts: ListOfWorkouts
    
    var body: some View {
        Form {
            Section(header: Text("Workout Details")) {
                TextField("Weight (lbs)", text: $weight)
                    .keyboardType(.numberPad)
                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)
                TextField("Sets", text: $sets)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Notes")) {
                TextEditor(text: $notes)
                    .frame(height: 100)
            }
            
            Button(action: {
                // Handle logging workout
                logWorkout()
            }) {
                Text("Log Workout")
            }
        }
        .navigationTitle(workout)
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text("Please input only integers"), dismissButton: .default(Text("OK")))
                }
    }
    
    private func logWorkout() {
        // Convert weight, reps, and sets to appropriate data types
        guard let weight = Float(weight),
              let reps = Int(reps),
              let sets = Int(sets)
              else {
            print("Log Button not working")
            showAlert = true
            return
        }
        
        // Create a new Exercise
        let newExercise = Exercise(name: workout, weight: Double(weight), reps: reps, sets: sets, note: notes)
        
        // Append the new exercise to loggedWorkouts
        loggedWorkouts.workouts.append(newExercise)
        
        print("Logged workout: \($loggedWorkouts.workouts), Weight: \(weight), Reps: \(reps), Sets: \(sets), Notes: \(notes)")
        print("Idid something")
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddLog_Previews: PreviewProvider {
    @State static var loggedWorkouts = ListOfWorkouts( date: Date())
    
    static var previews: some View {
        AddLog(loggedWorkouts: $loggedWorkouts)
    }
}
