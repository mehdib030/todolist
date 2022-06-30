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
    
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    TextField("Current todo ...", text: $currentTodo).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !self.currentTodo.isEmpty else {return}
                        self.todos.append(Item(todo: self.currentTodo))
                        self.currentTodo = ""
                    })
                    {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                }.padding()
                
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
