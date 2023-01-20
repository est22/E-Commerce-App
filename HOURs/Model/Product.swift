//
//  Product.swift
//  HOURs
//
//  Created by Lia AN on 2023/01/20.
//

import SwiftUI

// Goods Model with Sample Data
struct Product: Identifiable{
    var id: String
    var title: String
    var description: String
    var produtImage: String
    var produtPrice: String
}

// ID's are use to link each page when Deep Link are called
var products: [Product] = [

    Product(id: "sunglasses", title: "Balenciaga Sunglasses", description: "Used less than 5 times. \n Bought 2 years ago but got new ones. \n Non-refundable", produtImage: "balenciaga", produtPrice: "$34"),
    Product(id: "bag", title: "Burberry WOC Cross Bag", description: "Bought from London Outlet in 2019, \n used less than 5 times. \n Unique color and well reserved bag. \n ON SALE ONLY IN JAN", produtImage: "burberry", produtPrice: "$340"),
    Product(id: "perfume1", title: "Diptique Philosykos EDT 90ml", description: "Almost brand new", produtImage: "diptique", produtPrice: "$80"),
    Product(id: "eyeshadow1", title: "Espoir Pink Eyeshadow Palette", description: "Almost brand new. \n Used once for a test. \n Got this from my friend but not my personal color. \n Shipping includes extra cost of $4.", produtImage: "espoir", produtPrice: "$12"),
    Product(id: "eyeshadow2", title: "Deardalia Dual Lip & Eyeshadow", description: "[BRAND NEW] Got this as a bday gift but have too many eyeshadows. \n Expiration date: 2025-12-24. PLEASE do not ask for discount.", produtImage: "eyeshadow", produtPrice: "$20"),
    Product(id: "drawer", title: "IKEA ALGOT Drawer", description: "ALGOT is sold out but was a steadyseller at IKEA. \n Better get a good chance with an affordable price!", produtImage: "ikea", produtPrice: "$30"),
    Product(id: "mouse", title: "Logitec MX3 Master Vertical Mouse", description: "Color: Grey \n Used once. \n No more questions accepted", produtImage: "mouse", produtPrice: "$94"),
    Product(id: "perfume2", title: "Prada Fleur d'oranger Perfume EDT 90ml", description: "Got this from duty free shop. \n Expiration Date: 2024-11-05", produtImage: "prada", produtPrice: "$72"),

]
