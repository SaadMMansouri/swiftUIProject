//
//  TextButtonView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct TextButtonView: View {
    
    var sentence : String = "sentence before"
    var text : String = "button"
    var color : Color = .clear
    var textColor : Color = .black
    var action : () -> Void
    
    var body: some View {
        Button(action: action){
            Text(sentence).font(.system(size: 14))
            + Text(" ") +
            Text(text).font(.system(size: 14))
                .fontWeight(.bold)
                
        }
        .foregroundColor(textColor)
        .multilineTextAlignment(.center)
    }
}

struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView(action: {})
    }
}
