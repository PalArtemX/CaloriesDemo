//
//  CaloriesDemoApp.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 28/04/2022.
//

import SwiftUI

@main
struct CaloriesDemoApp: App {
    @StateObject var foodVM = FoodViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(foodVM)
        }
    }
}
