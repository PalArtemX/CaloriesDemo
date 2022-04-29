//
//  FoodViewModel.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import Foundation
import CoreData
import UIKit


class FoodViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published private(set) var savedEntities: [FoodEntity] = []
    @Published var name = ""
    @Published var calories: Double = 0
    
    // MARK: - init
    init() {
        container = NSPersistentContainer(name: "Food")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Core Data \(error.localizedDescription)")
            }
        }
        fetchFood()
    }

    
    // MARK: - Functions
    func fetchFood() {
        let request = NSFetchRequest<FoodEntity>(entityName: "FoodEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
        
    }
    
    func save() {
        do {
            try container.viewContext.save()
            fetchFood()
        } catch let error {
            print("Error: save data \(error.localizedDescription)")
        }
    }
    
    func addFood(name: String, calories: Double) {
        let food = FoodEntity(context: container.viewContext)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        self.name = ""
        self.calories = 0
        save()
    }
        
//    func editFood(name: String, calories: Double) {
//        let food = FoodEntity(context: container.viewContext)
//        food.date = Date()
//        food.name = name
//        food.calories = calories
//        self.name = ""
//        self.calories = 0
//        save()
//    }
    
    func deleteFood(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        save()
    }
    
    func totalCaloriesToday() -> Double {
        var caloriesToday: Double = 0
        for item in savedEntities {
            if Calendar.current.isDateInToday(item.date ?? Date()) {
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
    
}
