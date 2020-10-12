//
//  PostListView.swift
//  WeiboDemo
//
//  Created by lxd on 2020/10/12.
//

import SwiftUI

struct PostListView: View {

    //类的构造方法
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List{
            //遵循协议 id默认用id这个标识符
            ForEach(postList.list){ post in
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
        //⬆️该函数就是调用init方法
    }
}
