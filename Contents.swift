//: Playground - noun: a place where people can play

import UIKit




class WorkoutMain{
    
    //class variables
    
    //date time objects for use in random number generator function
    let date = NSDate()     //gets date object
    let calendar = NSCalendar.currentCalendar() //gets current date info
    //array holds all workouts
    var workoutArray : [WorkoutType] = [WorkoutType]()
    //todays date (day)
    var todayDateValue = 0
    
    //string intro message
    var str = "Week 7: Critical Thinking Functions\nBy: Nestor (Felix) Sotres\n\nThis lab will simply print out my workout routine based on the number day of the month. For example if today was 8/15/15, it would print out my work out schedule for the 15th of the month. Or if it was 4/10/15, it would print out the work out for the 10th of the mont. Just a different way to do work outs. Some of the numbers may not make much sense and the types of workouts are limited, this is more a proof of consept and a way to demonstrate knowledge and use of functions, nested functions, and closures.\n"
    
    
    //main program loop function
    func start() -> Void {
        //print homework message
        println(str)
        println("\nWelcome to the workout generator.")
        //create all workouts
        createWorkouts()
        //get todays date value
        todayDateValue = getCurrentDay()
        println("\nToday is the \(todayDateValue) of the month. Your workout today is: \n")
        //print todays workout
        printTodaysWorkout(getCurrentDay(), workoutSelection: selectWorkout )
    }
    
    
    /* CLOSURE */
    //Simple logic to create a random number to access workout array info
    var selectWorkout = {(day : Int)-> Int in
        //based on the number day return a integer value from which to draw todays workout from
        if (day < 10){
            return 3;
        } else if (day > 9 && day < 18) {
            return 0;
        } else if (day > 17 && day < 22) {
            return 1;
        } else if (day > 21 && day < 31){
            return 2;
        } else{
            return 1;
        }
        
    }
    
    /*prints out workout for today
        This function receives todays date (number of the day in the month) and a closure that has a bit of logic in order to print out the right work out for the day. The closure receives todays date and then returns the number of the workout for the workout array to access info from.
    */
    func printTodaysWorkout(todayDateVal : Int, workoutSelection : (day : Int)->Int) -> Void {
        //get the number to get workout for today
        var workoutAccessNumber = workoutSelection(day: todayDateVal)
        //print out workout info
        println("\t \(workoutArray[workoutAccessNumber].name)")
        println("\nMuscle targeted: \(workoutArray[workoutAccessNumber].type)")
        println("Your Record Lift: \(workoutArray[workoutAccessNumber].record)")
        println("Max weight to lift: \(workoutArray[workoutAccessNumber].maxWeight)")
        println("Number of Reps for this exercise: \(workoutArray[workoutAccessNumber].reps)")
        println("Weight for Set 1: \(workoutArray[workoutAccessNumber].set1Weight)")
        println("Weight for Set 2: \(workoutArray[workoutAccessNumber].set2Weight)")
        println("Weight for Set 3: \(workoutArray[workoutAccessNumber].set3Weight)")
    }
    
    //returns the number date of the current day.
    func getCurrentDay()-> Int {
        //date time objects for use in random number generator function
        let date2 = NSDate()     //gets date object
        let calendar2 = NSCalendar.currentCalendar() //gets current date info
        let components2 = calendar2.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitDay, fromDate: date2)
        let day = components2.day //get current day (date)
        //return day (date)
        return Int(day)
    }
    
    /*func createWorkouts(randClosure : ()->Int)->Void{
    for var cnt = 0; cnt < 1; ++cnt{
    println("Random: \(randClosure())" )
    }
    */
    /* NESTED FUNCTION */
    //creates all workouts used
    func createWorkouts()-> Void{
        
        //nested function to generate random data for workout creation
        /*NOTE:
            Cannot use this function as a closure. Sometimes the closure call will work sometimes it wont. Playgrounds will either generate a simple random number or it will interrupt execution due Seems to be a call to invalid access location. Looking at the error message, it doesnt seem to like having to call the system to create an NSDate object within a closure. It also will not recognize a global class variable (NSDate objects) as members of the closure function and will not be able to access them. Using as a nested function instead.
        */
        /* NESTED FUNCTION */
        //generates a random number based on the current time
        func random()-> Int {
            
            let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
            let minutes = components.minute //get current minutes
            
            //create seed for random number
            var seed: UInt32 = UInt32(minutes)
            //get random number based off seed (current minute)
            var randomNumber = arc4random_uniform(seed)
            return Int(randomNumber)
        }
        
        //create workouts
        workoutArray.append(WorkoutType(name1 : "Bench", type1 : "Chest", mweight : 180, rep : random(), sweight1 : 135, sweight2 : 165, sweight3 : 180 , record1 : 200))
        workoutArray.append(WorkoutType(name1 : "Dumbbell Bicep Curl", type1 : "Bicep", mweight : 50, rep : random(), sweight1 : 35, sweight2 : 40, sweight3 : 45 , record1 : 60))
        workoutArray.append(WorkoutType(name1 : "Dumbbell Tricep Curl", type1 : "Tricep", mweight : 35, rep : random(), sweight1 : 20, sweight2 : 25, sweight3 : 30 , record1 : 35))
        workoutArray.append(WorkoutType(name1 : "Shoulder Press", type1 : "Shoulders", mweight : 100, rep : random(), sweight1 : 50, sweight2 : 65, sweight3 : 80 , record1 : 140))
        
    }
    
    
    
}//end WorkoutMain class

//class used to create workout types
class WorkoutType{
    //class variables
    var name = ""           //name of workout
    var type = ""           //type of muscle exercised
    var maxWeight = 0       //max weight lifted
    var reps = 0            //sets for exercise
    var set1Weight = 0      //weight used for 1st set
    var set2Weight = 0      //weight used for 2nd set
    var set3Weight = 0      //weight used for 3rd set
    var record = 0          //weight of record lift!
    
    //initializing method to create workout
    init(name1 : String, type1 : String, mweight :Int, rep: Int, sweight1 : Int, sweight2 : Int, sweight3: Int, record1: Int){
        //set object variables using self to avoid any confusion
        self.name = name1
        self.type = type1
        self.maxWeight = mweight
        self.reps = rep
        self.set1Weight = sweight1
        self.set2Weight = sweight2
        self.set3Weight = sweight3
        self.record = record1
    }
    
} //end WorkoutType class

//way to initialize entire program
var run = WorkoutMain()
run.start()
