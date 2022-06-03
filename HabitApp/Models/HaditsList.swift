//
//  StorageManager.swift
//  HabitApp
//
//  Created by Олейник Богдан on 01.06.2022.
//

import Foundation
import UIKit

struct HabitsList {
    let image: String
    let title: String
    let secondText: String
    
    static func getHabitsList() -> [HabitsList] {
        [
            HabitsList(
                image: "drop",
                title: "Пить воду",
                secondText: "Вода выводит токсины и заряжает бодростью"
            ),
            HabitsList(
                image: "globe.europe.africa",
                title: "Учить языки",
                secondText: "Открой новые возможности"
            ),
            HabitsList(
                image: "pawprint",
                title: "Гулять с питомцем",
                secondText: "Дыши свежим воздухом и наслаждайся погодой"
            ),
            HabitsList(
                image: "leaf",
                title: "Отдохни",
                secondText: "Продуктивность приходит после отдыха"
            ),
            HabitsList(
                image: "moon",
                title: "Ложись спать",
                secondText: "Всем нужно отдыхать"
            )
        ]
    }
}
