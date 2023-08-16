//
//  ContentView.swift
//  UIkitPractice
//
//  Created by 澤木柊斗 on 2023/08/16.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var text: String = "Default"
    var body: some View {
        VStack {
            Text(text).foregroundColor(.black)
             CustomButton(text: $text)
        }
        .padding()
        .background(Color(.white))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
