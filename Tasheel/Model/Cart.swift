//
//  Cart.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/6/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import Foundation
struct Cart {
    var products:[Product] = []
    var address:[Address] = []
    var subtotal:String
    var discount:String
    var shipping:String
    var total:String
}
