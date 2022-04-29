//
//  EditFoodView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var foodVM: FoodViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("\(foodVM.name)", text: $foodVM.name)
                        .onAppear {
                            foodVM.name = foodVM.name
                            foodVM.calories = foodVM.calories
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
            }
            HStack {
                Spacer()
                Button {
                    
                    dismiss()
                } label: {
                    Text("Submit")
                }
                .foregroundColor(.blue)
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.top, 50)
            
        }
    }
}











struct EditFoodView_Previews: PreviewProvider {
    static var previews: some View {
        EditFoodView()
            .environmentObject(FoodViewModel())
    }
}
