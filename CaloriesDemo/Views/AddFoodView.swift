//
//  AddFoodView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 28/04/2022.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var foodVM: FoodViewModel
    
    var body: some View {
        VStack {
            // MARK: - Form
            Form {
                Section {
                    TextField("Food name...", text: $foodVM.name)
                } header: {
                    Text("Name")
                }

                Section {
                    VStack {
                        Text("\(Int(foodVM.calories))")
                            .font(.headline)
                        Slider(value: $foodVM.calories, in: 0...1000, step: 10)
                    }
                } header: {
                    Text("Calories")
                }
            }
            // MARK: - Button
            HStack {
                Spacer()
                Button {
                    foodVM.addFood(name: foodVM.name, calories: foodVM.calories)
                    dismiss()
                } label: {
                    Text("Submit")
                }
                .foregroundColor(.blue)
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.top)
        }
    }
}










struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
            .environmentObject(FoodViewModel())
    }
}
