//
//  FoodRowView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 29/04/2022.
//

import SwiftUI

struct FoodRowView: View {
    let food: FoodEntity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.name ?? "")
                    .bold()
                
                Text("\(Int(food.calories)) calories")
                    .foregroundColor(.indigo)
            }
            Spacer()
            Text(calcTimeSince(date: food.date ?? Date()))
                .foregroundColor(.gray)
                .italic()
        }
    }
}










//struct FoodRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodRowView(food: FoodViewModel())
//    }
//}
