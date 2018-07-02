//
//  Post.swift
//  Demo
//
//  Created by 1amageek on 2018/07/02.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import Foundation
import Pring

@objcMembers
class Post: Object {

    dynamic var user: Relation<User> = .init()
    dynamic var image: File?
}
