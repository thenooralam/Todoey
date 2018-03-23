//
//  Category.swift
//  Todoey
//
//  Created by Nooralam Shaikh on 23/03/18.
//  Copyright © 2018 Nooralam Shaikh. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name = ""
    let items = List<Item>()

}
