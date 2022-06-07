//
//  StorageManager.swift
//  HabitApp
//
//  Created by Олейник Богдан on 06.06.2022.
//

import CoreData

class StorageManager {

    static let shared = StorageManager()

    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HabitApp")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    private let viewContext: NSManagedObjectContext

    private init() {
        viewContext = persistentContainer.viewContext
    }

    func fetchData(completion: (Result<[UserTasks], Error>) -> Void) {
        let fetchRequest = UserTasks.fetchRequest()

        do {
            let habits = try viewContext.fetch(fetchRequest)
            completion(.success(habits))
        } catch let error {
            completion(.failure(error))
        }
    }

    func save(_ taskName: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "UserTasks", in: viewContext) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: viewContext) as? UserTasks else { return }
        task.taskName = taskName
        saveContext()
    }

    func edit(_ task: UserTasks, newName: String) {
        task.taskName = newName
        saveContext()
    }

    func delete(_ task: UserTasks) {
        viewContext.delete(task)
        saveContext()
    }

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

