//
//  PostCell.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/9.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        HStack(spacing: 5){
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: post.vip)
                        .offset(x: 16, y: 16)
                )
            
            VStack(alignment: .leading, spacing: 10){
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(.init(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                    .lineLimit(1)
                
                Text(post.date)
                    .font(.system(size:11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            if !post.isFollowed {
                Spacer()
                
                Button(action:{
                    print("click")
                }){
                    Text("关注")
                        .font(Font.system(size:14))
                        .foregroundColor(.orange)
                        .frame(width: 50, height: 26)
                        .overlay(RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                        )
                }
            }
            
            
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post:Post(avatar:"8697cf1ely8gashxj3b09j20u00u040v.jpg",
                           vip:true,
                           name:"用户昵称",
                           date:"2020-01-01 00:00",
                           isFollowed:false))
    }
}
