//
//  DetailFoodView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import SwiftUI

struct DetailFoodView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var foodVM: FoodViewModel
    let food: FoodEntity
    
    var body: some View {
        VStack {
            VStack {
                Text(food.name ?? "")
                    .bold()
                    .font(.title3)
                HStack {
                    Text("\(Int(food.calories)) calories")
                        .foregroundColor(.indigo)
                        .font(.headline)
                    Spacer()
                    Text(calcTimeSince(date: food.date ?? Date()))
                        .foregroundColor(.gray)
                        .italic()
                }
            }
            .frame(width: 300)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        
        Spacer()
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }
            .foregroundColor(.red)
            .buttonStyle(.bordered)
            Spacer()
        }
        .padding(.top)
    }
}












//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailFoodView(food: <#FoodEntity#>)
//            .environmentObject(FoodViewModel())
//    }
//}
