//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    
    var imageName: String
    
    var itemName: String
    
    var quantity: String
    
    var category: String
    
    var body: some View {
        HStack {
            Image(imageName).resizable().frame(width: 80, height: 62)
            
            Spacer()
            
            Text(itemName)
                .padding()
            
            Spacer()
            
            Text(quantity)
        }
    }
}
