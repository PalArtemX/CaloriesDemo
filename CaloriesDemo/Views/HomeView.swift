//
//  HomeView.swift
//  CaloriesDemo
//
//  Created by Artem Paliutin on 28/04/2022.
//

import SwiftUI
import CoreData


struct HomeView: View {
    @State private var showingADDView = false
    @EnvironmentObject var foodVM: FoodViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(foodVM.totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                ListFoodView()
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
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FoodViewModel())
    }
}
