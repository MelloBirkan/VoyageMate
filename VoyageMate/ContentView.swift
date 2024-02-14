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
  @Query var destinations: [Destination]
  @State private var path = [Destination]()
  
  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(destinations) { destination in
          NavigationLink(value: destination) {
            VStack(alignment: .leading) {
              Text(destination.name)
                .font(.headline)
              
              Text(destination.date.formatted(date: .long, time: .shortened))
            }
          }
        }
        .onDelete(perform: deleteDestination)
      }
      .navigationTitle("Voyage Mate")
      .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
      .toolbar {
        Button("Add Samples", action: addSamples)
        Button("Add Destination", systemImage: "plus", action: AddDestination)
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
  
  func deleteDestination(_ indexSet: IndexSet) {
    for index in indexSet {
      let destination = destinations[index]
      modelContext.delete(destination)
    }
  }
}

#Preview {
  ContentView()
}
