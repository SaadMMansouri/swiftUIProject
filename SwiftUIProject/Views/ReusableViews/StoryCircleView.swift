//
//  StoryCircleView.swift
//  SwiftUIProject
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct StoryCircleView: View {
    var body: some View {
        Image(systemName: "largecircle.fill.circle")
            .frame(width : 60, height: 60)
            .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
            .foregroundColor(Color.black.opacity(0.3))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 2))
    }
}

struct StoryCircleView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCircleView()
    }
}
