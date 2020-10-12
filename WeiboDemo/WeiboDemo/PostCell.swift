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
                post.avatarImage
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
                    .buttonStyle(BorderlessButtonStyle())
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
                                      text: post.commentCountText,
                                      color:.black){
                    print("comment")
                }
                
                Spacer()
                
                PostCellToolbarButton(image:"heart",
                                      text: post.likeCountText,
                                      color:.black){
                    print("like")
                }
                
                Spacer()
                
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height:10)
                .foregroundColor(.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal,15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[1])
    }
}
