//
//  ListFoodView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import SwiftUI

struct ListFoodView: View {
    @EnvironmentObject var foodVM: FoodViewModel
    
    var body: some View {
        List {
            ForEach(foodVM.savedEntities) { food in
                NavigationLink {
                    EditFoodView()
                } label: {
                    FoodRowView(food: food)
                }
            }
            .onDelete(perform: foodVM.deleteFood)
        }
    }
}










struct ListFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodView()
            .environmentObject(FoodViewModel())
    }
}
