//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/11.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action:() -> Void //closure
    
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5){
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(text)
                    .font(.system(size:15))
            }
            .foregroundColor(color)
        }
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "Text", color: .blue){
            print("点赞")
        }
    }
}
