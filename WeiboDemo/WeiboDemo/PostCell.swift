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
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5){
                loadImage(name: post.avatar)
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
//
            Text(post.text)
                .font(.system(size:17))

            if !post.images.isEmpty {
                loadImage(name: post.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30 , height: (UIScreen.main.bounds.width - 30) * 0.75)
                    .clipped()
            }
            
            Divider()
            
            HStack(spacing:0){
                Spacer()
                
                PostCellToolbarButton(image:"message",
                                      text:"评论",
                                      color:.black){
                    print("comment")
                }
                
                Spacer()
                
                PostCellToolbarButton(image:"heart",
                                      text:"点赞",
                                      color:.black){
                    print("like")
                }
                
                Spacer()
                
            }
            
            
        }
        .padding(.horizontal,15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
