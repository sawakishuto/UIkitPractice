//
//  CustomButton.swift
//  UIkitPractice
//
//  Created by 澤木柊斗 on 2023/08/16.
//
import UIKit
import SwiftUI
struct CustomButton: UIViewRepresentable {
    @Binding var text: String
    
  
    
    func makeUIView(context:Context) -> UIButton{
        let button = UIButton(frame: CGRect(x: 0,y :0,width: 160,height: 44))
        
        button.setTitle("CustomButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.didTapCustomButton(sender:)), for: .touchUpInside)
        return button
    }
    func updateUIView(_ uiView: UIButton, context: Context) {
        print("更新")
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(button: self)
    }
    class Coordinator{
        var button: CustomButton
        
        init(button: CustomButton){
            self.button = button
        }
        @objc func didTapCustomButton(sender: UIButton) {
            print("click")
                   if button.text == "Default" {
                       print("change")
                       button.text = "Change"
                       return
                   }
                   button.text = "Default"
               }
    }
}
