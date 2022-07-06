//
//  Item.swift
//  todo List
//
//  Created by Mehdi Benyebka on 6/29/22.
//

import Foundation

struct Item: Identifiable, Decodable {
    var id: Int
    var todo: String
}
