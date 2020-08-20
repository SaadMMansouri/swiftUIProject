//
//  ContainedButtonView.swift
//  SwiftUIProject
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct ContainedButtonView: View {
    
    var text : String = "Button"
    var color : Color = .blue
    var textColor : Color = .white
    var action : () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .foregroundColor(textColor)
                .padding()
        }.background(color).cornerRadius(4)
    }
}

struct ContainedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContainedButtonView( action: {})
    }
}
