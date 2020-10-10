//
//  Post.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/10.
//

import SwiftUI

struct Post {
    
    //属性
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    //属性不可变 let  可变 var
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int //评论数
    var likeCount: Int //点赞数
    var isLiked: Bool //我是否点赞
    
    
}


