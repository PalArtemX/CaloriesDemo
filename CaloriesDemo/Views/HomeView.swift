//
//  HomeView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 28/04/2022.
//

import SwiftUI
import CoreData


struct HomeView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<FoodEntity>
    
    @State private var showingADDView = false
    
    @EnvironmentObject var foodVM: FoodViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
//                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
//                    .foregroundColor(.gray)
//                    .padding(.horizontal)
                
                List {
                    ForEach(foodVM.savedEntities) { food in
                        NavigationLink {
                            EditFoodView(food: food)
                        } label: {
                            HStack {
                                VStack {
                                    Text(food.name ?? "")
                                        .bold()
                                    
                                    Text("\(Int(food.calories)) calories")
                                }
                                Spacer()
                                Text(calcTimeSince(date: food.date ?? Date()))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }

                    }
                    //.onDelete(perform: deleteFood)
                }
            }
            
            .navigationTitle("Calories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingADDView.toggle()
                    } label: {
                        Label("Add Food", systemImage: "plus.circle")
                            .symbolRenderingMode(.hierarchical)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingADDView) {
                AddFoodView()
            }
        }
    }
    
//    private func totalCaloriesToday() -> Double {
//        var calorieasToday: Double = 0
//        for item in food {
//            if Calendar.current.isDateInToday(item.date ?? Date()) {
//                calorieasToday += item.calories
//            }
//        }
//        return calorieasToday
//    }
    
//    private func deleteFood(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { food[$0] }.forEach(managedObjectContext.delete)
//            DataController().save(context: managedObjectContext)
//        }
//    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FoodViewModel())
    }
}
