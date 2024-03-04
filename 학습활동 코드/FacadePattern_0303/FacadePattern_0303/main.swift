//
//  main.swift
//  FacadePattern_0303
//
//  Created by Roh on 3/3/24.
//

import Foundation

//let macBook = Product(identifier: "product-01", name: "MacBook", cost: 2000000)
//let iPad = Product(identifier: "product-02", name: "iPad", cost: 1200000)
//let iphone = Product(identifier: "product-03", name: "iPhone", cost: 1000000)
//
//let productDB = AvailableProduct(productList: [macBook : 4, iPad: 3, iphone: 1])
//
//let gnoam = Customer(identifier: "customer-01", name: "Gnoam", address: "신림")
//
//let orderFacade = OrderFacade(productDB: productDB, orderDB: OrderList())
//
//orderFacade.order(product: iphone, customer: gnoam)
//orderFacade.order(product: iPad, customer: gnoam)

let 나는누구 = "그노움"
let 어떤것 = "에어팟맥스"
let 집 = "신림"

let 주문이행 = 주문이행서비스(손님: 나는누구)
let 청구 = 청구서비스(아이템: 어떤것)
let 배송 = 배송서비스(손님: 나는누구, 아이탬: 어떤것, 장소: 집)

let 고객 = 고객서비스(주문이행: 주문이행, 청구: 청구, 배송: 배송)
