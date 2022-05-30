//
//  HabitListModel.swift
//  HabitApp
//
//  Created by Олейник Богдан on 29.05.2022.
//

import Foundation

struct Habits {
    let name: String
    
    static func getHabits() -> [Habits] {
        [
            Habits(name: "Пить воду"),
            Habits(name: "Рано вставать"),
            Habits(name: "Йога"),
            Habits(name: "Медитация"),
            Habits(name: "Бегать")
        ]
    }
}

