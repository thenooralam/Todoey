//
//  Item.swift
//  Todoey
//
//  Created by Nooralam Shaikh on 23/03/18.
//  Copyright © 2018 Nooralam Shaikh. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
