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

//Data model
struct Post: Codable, Identifiable {
    
    
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

//可以添加只读属性和函数
//这里添加与view相关的属性
extension Post {
    
    //计算属性 只读属性
    var avatarImage: Image{
        return loadImage(name: avatar)
    }
    
    var commentCountText: String{
        if commentCount <= 0 { return "评论"}
        if commentCount < 1000 { return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount) / 1000)
    }
    
    var likeCountText: String{
        if likeCount <= 0 { return "点赞"}
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fk", Double(likeCount) / 1000)
    }
    
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

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
