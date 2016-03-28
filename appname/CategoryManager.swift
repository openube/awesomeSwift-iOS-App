//
//  CategoryManager.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 27/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryManager {
    private var cats = [CategoryModel]()

    var catCount: Int {
        return self.cats.count
    }

    init() {
        self.updateFromRealm()
    }

    private func updateFromRealm() {
        // swiftlint:disable force_try
        self.cats = Array(try! Realm().objects(CategoryModel))
    }

    func addCat(cat: CategoryModel) {
        if !self.cats.contains(cat) {
            self.cats.append(cat)
        }
    }

    func catAtIndex(index: Int) -> CategoryModel? {
        let upperBound = self.cats.count
        if 0..<upperBound ~= index {
            return self.cats[index]
        } else {
            return nil
        }
    }

    func removeCatAtIndex(index: Int) {
        let upperBound = self.cats.count
        if 0..<upperBound ~= index {
            self.cats.removeAtIndex(index)
        }
    }

    func removeAllCats() {
        self.cats.removeAll()
    }
}
