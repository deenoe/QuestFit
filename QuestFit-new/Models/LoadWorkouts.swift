//
//  LoadWorkouts.swift
//  QuestFit-new
//
//  Created by Miguel Bunag on 5/5/24.
//
import FirebaseFirestore

func addWorkoutToFirestore(workout: Workouts, collectionName: String) {
    let db = Firestore.firestore()
    
    // Create a reference to the collection
    let collectionRef = db.collection(collectionName)
    
    // Add a new document with a generated ID
    collectionRef.addDocument(data: [
        "exerciseName": workout.exerciseName,
        "setCount": workout.setCount,
        "repCount": workout.repCount,
        "exp": workout.exp
    ]) { err in
        if let err = err {
            print("Error adding document: \(err)")
        } else {
            print("Document added with ID: \(collectionRef.document().documentID)")
        }
    }
}

func loadChest() {
    print("Loading Chest Workouts..")
    let workouts = [
        Workouts(exerciseName: "Chest Press, Machine", setCount: 3, repCount: 8, exp: 5),
        Workouts(exerciseName: "Bench Press", setCount: 4, repCount: 10, exp: 6),
        Workouts(exerciseName: "Dumbbell Flyes", setCount: 3, repCount: 12, exp: 4),
        Workouts(exerciseName: "Incline Bench Press", setCount: 3, repCount: 8, exp: 6),
        Workouts(exerciseName: "Cable Crossover", setCount: 3, repCount: 12, exp: 4),
        Workouts(exerciseName: "Decline Bench Press", setCount: 3, repCount: 8, exp: 6),
        Workouts(exerciseName: "Push-Ups", setCount: 3, repCount: 15, exp: 3),
        Workouts(exerciseName: "Chest Dips", setCount: 3, repCount: 10, exp: 5),
        Workouts(exerciseName: "Pec Deck Machine", setCount: 3, repCount: 12, exp: 4),
        Workouts(exerciseName: "Smith Machine Bench Press", setCount: 3, repCount: 8, exp: 5),
        Workouts(exerciseName: "Incline Dumbbell Press", setCount: 3, repCount: 10, exp: 5),
        Workouts(exerciseName: "Machine Chest Press", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Wide Grip Bench Press", setCount: 3, repCount: 8, exp: 7),
        Workouts(exerciseName: "Chest Flyes", setCount: 3, repCount: 10, exp: 6),
        Workouts(exerciseName: "Dumbbell Pullover", setCount: 3, repCount: 12, exp: 5),
        Workouts(exerciseName: "Parallel Bar Dips", setCount: 3, repCount: 10, exp: 6),
        Workouts(exerciseName: "Chest Press Machine", setCount: 3, repCount: 12, exp: 5),
        Workouts(exerciseName: "Close Grip Bench Press", setCount: 3, repCount: 8, exp: 7),
        Workouts(exerciseName: "Chest Cable Flyes", setCount: 3, repCount: 10, exp: 6),
        Workouts(exerciseName: "Dumbbell Bench Press", setCount: 3, repCount: 12, exp: 5)
    ]
    
    for workout in workouts {
        addWorkoutToFirestore(workout: workout, collectionName: "chest")
    }
}


func loadBack() {
    print("Loading Back Workouts..")
    let workouts = [
        Workouts(exerciseName: "Pull-Ups", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Deadlifts", setCount: 4, repCount: 8, exp: 9),
        Workouts(exerciseName: "Barbell Rows", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Lat Pulldowns", setCount: 3, repCount: 10, exp: 6),
        Workouts(exerciseName: "T-Bar Rows", setCount: 3, repCount: 8, exp: 7),
        Workouts(exerciseName: "One-Arm Dumbbell Rows", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Seated Cable Rows", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Hyperextensions", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Good Mornings", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Reverse Flyes", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Rack Pulls", setCount: 3, repCount: 8, exp: 9),
        Workouts(exerciseName: "Bent Over Rows", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Machine Rows", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Pulldown Machine", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Back Extensions", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Shrugs", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Face Pulls", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Dead Hangs", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Chin-Ups", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Wide Grip Rows", setCount: 3, repCount: 10, exp: 7)
    ]
    
    for workout in workouts {
        addWorkoutToFirestore(workout: workout, collectionName: "back")
    }
}

func loadLegs() {
    print("Loading Leg Workouts..")
    let workouts = [
        Workouts(exerciseName: "Squats", setCount: 4, repCount: 8, exp: 9),
        Workouts(exerciseName: "Leg Press", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Lunges", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Leg Curls", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Leg Extensions", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Calf Raises", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Deadlifts", setCount: 4, repCount: 8, exp: 9),
        Workouts(exerciseName: "Hack Squats", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Stiff-Leg Deadlifts", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Front Squats", setCount: 3, repCount: 8, exp: 9),
        Workouts(exerciseName: "Step-Ups", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Inner Thigh Machine", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Outer Thigh Machine", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Calf Press", setCount: 3, repCount: 12, exp: 6),
        Workouts(exerciseName: "Sissy Squats", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Glute-Ham Raises", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Smith Machine Squats", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Cable Kickbacks", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Cable Leg Raises", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Single Leg Press", setCount: 3, repCount: 10, exp: 7)
    ]
    
    for workout in workouts {
        addWorkoutToFirestore(workout: workout, collectionName: "legs")
    }
}

func loadArms() {
    print("Loading Arm Workouts..")
    let workouts = [
        Workouts(exerciseName: "Bicep Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Tricep Dips", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Hammer Curls", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Skull Crushers", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Preacher Curls", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Tricep Pushdowns", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Close-Grip Bench Press", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Concentration Curls", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Overhead Tricep Extensions", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Reverse Curls", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Zottman Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Dumbbell Kickbacks", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Spider Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Lying Tricep Extensions", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Incline Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Tricep Rope Pushdowns", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "Barbell Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Dumbbell Skull Crushers", setCount: 3, repCount: 10, exp: 7),
        Workouts(exerciseName: "EZ-Bar Curls", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Cable Curls", setCount: 3, repCount: 10, exp: 7)
    ]
    
    for workout in workouts {
        addWorkoutToFirestore(workout: workout, collectionName: "arms")
    }
}

func loadCore() {
    print("Loading Core Workouts..")
    let workouts = [
        Workouts(exerciseName: "Planks", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Russian Twists", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Hanging Leg Raises", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Crunches", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Woodchoppers", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Mountain Climbers", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Ab Rollouts", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Bicycle Crunches", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Leg Raises", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Side Planks", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Dead Bugs", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Plank Rotations", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Sit-Ups", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "V-Ups", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Flutter Kicks", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Russian Leg Raises", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Hollow Body Holds", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Dragon Flags", setCount: 3, repCount: 12, exp: 7),
        Workouts(exerciseName: "Lying Windshield Wipers", setCount: 3, repCount: 10, exp: 8),
        Workouts(exerciseName: "Scissor Kicks", setCount: 3, repCount: 12, exp: 7)
    ]
    
    for workout in workouts {
        addWorkoutToFirestore(workout: workout, collectionName: "core")
    }
}
