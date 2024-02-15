//
//  ContentView.swift
//  VoyageMate
//
//  Created by Marcello Gonzatto Birkan on 14/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) var modelContext
  @State private var path = [Destination]()
  @State private var sortOrder = SortDescriptor(\Destination.name)
  
  var body: some View {
    NavigationStack(path: $path) {
      DestinationListingView(sort: sortOrder)
        .navigationTitle("Voyage Mate")
        .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
        .toolbar {
          Button("Add Destination", systemImage: "plus", action: AddDestination)
          
          Menu("Sort", systemImage: "arrow.up.arrow.down") {
            Picker("Sort", selection: $sortOrder) {
              Text("Name")
                .tag(SortDescriptor(\Destination.name))
              
              Text("Priority")
                .tag(SortDescriptor(\Destination.priority, order: .reverse))
              
              Text("Date")
                .tag(SortDescriptor(\Destination.date))
            }
            .pickerStyle(.inline)
          }
        }
    }
  }
  
  func addSamples() {
    let rome = Destination(name: "Rome")
    let florence = Destination(name: "Florence")
    let naples = Destination(name: "Naples")
    
    modelContext.insert(rome)
    modelContext.insert(florence)
    modelContext.insert(naples)
  }
  
  func AddDestination() {
    let destination = Destination()
    modelContext.insert(destination)
    path = [destination]
  }
  
}

#Preview {
  ContentView()
}
