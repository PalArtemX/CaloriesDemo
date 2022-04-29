//
//  EditFoodView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<FoodEntity>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("\(food.name!)", text: $name)
                        .onAppear {
                            name = food.name!
                            calories = food.calories
                        }
                    Section {
                        VStack {
                            Text("\(Int(calories))")
                                .font(.headline)
                            Slider(value: $calories, in: 0...1000, step: 10)

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











//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}
