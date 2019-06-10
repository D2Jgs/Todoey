//
//  Category.swift
//  Todoey
//
//  Created by jash on 09/06/19.
//  Copyright © 2019 Automated. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object{
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
