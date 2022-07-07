//
//  ContentView.swift
//  Shared
//
//  Created by Mehdi Benyebka on 6/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTodo: String = ""
    @State private var todos: [Item] = []
    @State private var count: Int = 0
    @State private var items: [Item] = []
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    
                    TextField("Current todo ...", text: $currentTodo).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        items = callApi()
                        //print("***"+items[0])
                        guard !self.currentTodo.isEmpty else {return}
                        self.todos.append(Item(id:self.count+1,todo: self.currentTodo))
                        self.currentTodo = ""
                    })
                    {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                }.padding().background(Color.green)
                
                List {
                        ForEach(todos) { todoEntry in
                            Text(todoEntry.todo)
                        
                    }
                }
            }
        }
        .navigationBarTitle("Todo List")
       // Text("Hello, world!")
         //   .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
