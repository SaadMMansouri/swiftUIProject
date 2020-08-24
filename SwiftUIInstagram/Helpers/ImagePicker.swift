//
//  ImagePicker.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/23/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI
import UIKit

public struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    var sourceType: UIImagePickerController.SourceType = .camera

    public func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator( image: $image, isPresented: $isPresented )
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
}

public extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var image: UIImage?

        public init(image: Binding<UIImage?>, isPresented: Binding<Bool>) {
            _image = image
            _isPresented = isPresented
        }
    }
}

extension ImagePicker.Coordinator: UIImagePickerControllerDelegate {
    public func imagePickerController( _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        isPresented = false
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPresented = false
    }
}
