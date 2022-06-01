//
//  StorageManager.swift
//  HabitApp
//
//  Created by Олейник Богдан on 01.06.2022.
//

import Foundation
import UIKit

struct HabitsList {
    let image: UIImage!
    let title: String
    let secondText: String
    
    static func getHabitsList() -> [HabitsList] {
        [
            HabitsList(
                image: UIImage(systemName: "drop.fill"),
                title: "Пить воду",
                secondText: "Вода выводит токсины и заряжает бодростью"
            ),
            HabitsList(
                image: UIImage(systemName: "drop.fill"),
                title: "Учить языки",
                secondText: "Открой новые возможности"
            ),
            HabitsList(
                image: UIImage(systemName: "drop.fill"),
                title: "Гулять с питомцем",
                secondText: "Дыши свежим воздухом и наслаждайся погодой"
            ),
            HabitsList(
                image: UIImage(systemName: "drop.fill"),
                title: "Отдохни",
                secondText: "Продуктивность приходит после отдыха"
            ),
            HabitsList(
                image: UIImage(systemName: "drop.fill"),
                title: "Ложись спать",
                secondText: "Всем нужно отдыхать"
            )
        ]
    }
}
