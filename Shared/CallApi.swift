//
//  CallApi.swift
//  todo List
//
//  Created by Mehdi Benyebka on 7/5/22.
//

import Foundation

func callApi() -> [Item] {
    
    var items=[Item]()
    
    guard let url = URL(string: "http://localhost:3000/todos") else {
        return items
    }
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        
        let decoder = JSONDecoder()
        
    
        if let data = data {
            do {
                let tasks = try decoder.decode([Item].self, from: data)
                tasks.forEach{
                    item in items.append(item);
                    //item in print(item.todo);
                }
            } catch {
                print(error)
            }
        }
       
        //if let data = data, let string = String(data: data, encoding: .utf8){
          //  print(string)
       // }
    }
   
    
    task.resume()
    return items
   
}
