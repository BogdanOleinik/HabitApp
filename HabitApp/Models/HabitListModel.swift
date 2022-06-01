//
//  HabitListModel.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import UIKit

struct Habit: Hashable {
    var habitName: String
    var habitImage: UIImage
    var habitCount: Int
//    var id = UUID()
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    static func == (lhs: Habit, rhs: Habit) -> Bool {
//        return lhs.id == rhs.id
//    }
    
    static func getHabits() -> [Habit] {
        [
            Habit(habitName: "Run", habitImage: UIImage(named: "picture")!, habitCount: 20),
            Habit(habitName: "Walk", habitImage: UIImage(named: "picture")!, habitCount: 6),
            Habit(habitName: "Drink", habitImage: UIImage(named: "picture")!, habitCount: 43),
            Habit(habitName: "Swim", habitImage: UIImage(named: "picture")!, habitCount: 0),
            Habit(habitName: "Sleep", habitImage: UIImage(named: "picture")!, habitCount: 9),
            Habit(habitName: "Swim", habitImage: UIImage(named: "picture")!, habitCount: 7),
            Habit(habitName: "Sleep", habitImage: UIImage(named: "picture")!, habitCount: 12),
            Habit(habitName: "Dance", habitImage: UIImage(named: "picture")!, habitCount: 18)
        ]
    }
}

