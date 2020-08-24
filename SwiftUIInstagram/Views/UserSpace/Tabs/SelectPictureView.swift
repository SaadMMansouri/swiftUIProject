//
//  SelectPictureView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/24/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct SelectPictureView: View {
    
    let columns = [
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
            Image("placeholder"),
        ]
    
    @State private var showImagePicker: Bool = false
    @State private var image: UIImage?
    
    func getSelectedImage(image: UIImage?) -> Image {
        guard let selectedImage = image else {
            return Image("placeholder")
        }
        return Image(uiImage: selectedImage)
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 5){
                
                getSelectedImage(image: image)
                    .resizable().scaledToFill()
                    .frame(width : .infinity, height : 400)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color(UIColor.systemBackground), lineWidth: 5))

                ScrollView {
                    ImagePicker(image: self.$image, isPresented: self.$showImagePicker, sourceType: .photoLibrary)
                }
            }.navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                    }
                    Button(action: {}) {
                        Text("Gallery").fontWeight(.bold)
                    }
                },
                trailing: Button(action: {}) {
                    Text("Next").fontWeight(.bold)
                }
            )
        }
    }
}

struct SelectPictureView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPictureView()
    }
}
