//
//  Post.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/10.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}


struct Post: Codable {
    
    
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

let postList = loadPostListData("PostListData_recommend_1.json")

//解析微博的数据文件
func loadPostListData(_ fileName:String) -> PostList{
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("can not fina \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load \(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data")
    }
    return list
}


func loadImage(name:String) -> Image {
    Image(uiImage: UIImage(named: name)!)
}
