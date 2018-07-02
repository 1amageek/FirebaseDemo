//
//  User.swift
//  Demo
//
//  Created by 1amageek on 2018/07/02.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import Foundation
import Pring

@objcMembers
class User: Object {

    dynamic var name: String?
    dynamic var profileImage: File?
    dynamic var posts: ReferenceCollection<Post> = []
}
