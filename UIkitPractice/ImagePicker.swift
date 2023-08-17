//
//  ImagePicker.swift
//  UIkitPractice
//
//  Created by 澤木柊斗 on 2023/08/17.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var image : UIImage? = nil
    @State private var selectedPhoto : PhotosPickerItem? = nil
    
    var body: some View {
        VStack{
            if let image = image {
                Image(uiImage: image).resizable()
                
            }else{
                Text("Select Photo")
            }
            PhotosPicker(selection: $selectedPhoto, label: {Text("PhotoPicker")})
                .onChange(of: selectedPhoto){
                    pickedItem in
                    Task{
                        guard let imageData = try await pickedItem?.loadTransferable(type: Data.self)else
                        {return}
                        guard let pickedImage = UIImage(data: imageData)else{return}
                        image = pickedImage
                    }
                }
            
        }
        .padding()
 
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
