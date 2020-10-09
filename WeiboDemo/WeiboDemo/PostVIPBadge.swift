//
//  PostVIPBadge.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/9.
//

import SwiftUI

struct PostVIPBadge: View {
    var body: some View {
        Text("v")
            .bold()
            .font(.system(size:11))
            .foregroundColor(.yellow)
            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 7.5)
                    .stroke(Color.white , lineWidth: 1)
            )
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge()
    }
}
