//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Fruit {
    let name: String
    let color: String
    init(fruitName: String, fruitColor: String) {
        self.name = fruitName
        self.color = fruitColor
    }
}

class Items: Identifiable {
    
    var itemImage: String
    
    var itemName: String
    
    var quantity: String
    
    var category: String
    
    init(imageName: String, itemName: String, quantity: String, category: String) {
        
        self.itemImage = imageName
        
        self.itemName = itemName
        
        self.quantity = quantity
        
        self.category = category
    }
    
}


struct ContentView: View {
    
    var list = [
        Items(imageName : "banana", itemName: "Bananas", quantity: "3", category: "fruit"),
        Items(imageName : "apple", itemName: "Apples", quantity: "4", category: "fruit"),
        Items(imageName : "eggs", itemName: "Eggs", quantity: "12", category: "dairy"),
        Items(imageName : "milk", itemName: "milk", quantity: "1", category: "beverage"),

        Items(imageName : "cheese", itemName: "cheese", quantity: "2", category: "dairy"),

        Items(imageName : "juice", itemName: "juice", quantity: "5", category: "beverage"),

        Items(imageName : "water", itemName: "water", quantity: "20", category: "beverage")

    ]
    
    
    var fruits = [
        Items(imageName : "banana", itemName: "Bananas", quantity: "3", category: "fruit"),
        Items(imageName : "apple", itemName: "Apples", quantity: "4", category: "fruit")
    ]
    
    var dairy = [
        Items(imageName : "eggs", itemName: "Eggs", quantity: "12", category: "dairy"),
        Items(imageName : "cheese", itemName: "cheese", quantity: "2", category: "dairy")
    ]
    
    var beverage = [
        Items(imageName : "juice", itemName: "juice", quantity: "5", category: "beverage"),
        Items(imageName : "milk", itemName: "milk", quantity: "1", category: "beverage"),
        Items(imageName : "water", itemName: "water", quantity: "20", category: "beverage")
    ]
    
    var body: some View {
        List {
            Section(header : Text("fruit")) {
                ForEach(fruits) {
                    i in CustomCell(imageName: i.itemImage, itemName: i.itemName,
                                    quantity: i.quantity, category: i.category)
                }
            }
        }
        List {
            Section(header : Text("dairy")) {
                ForEach(dairy) {
                    i in CustomCell(imageName: i.itemImage, itemName: i.itemName,
                                    quantity: i.quantity, category: i.category)
                }
            }
        }
        List {
            Section(header : Text("beverage")) {
                ForEach(beverage) {
                    i in CustomCell(imageName: i.itemImage, itemName: i.itemName,
                                    quantity: i.quantity, category: i.category)
                }
            }
        }
        
    }
}
