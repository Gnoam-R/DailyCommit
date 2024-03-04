//
//  shopping.swift
//  FacadePattern_0303
//
//  Created by Roh on 3/3/24.
//

import Foundation

class Customer {
    var identifier: String
    var name: String
    var address: String
    
    init(identifier: String, name: String, address: String) {
        self.identifier = identifier
        self.name = name
        self.address = address
    }
}

extension Customer: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

struct Product {
    let identifier: String
    var name: String
    var cost: Int
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

// 재고 관리
class AvailableProduct {
    var productList: [Product: Int] = [:]
    
    init(productList: [Product: Int]) {
        self.productList = productList
    }
}

// 주문 현황
class OrderList {
    var orderList: [Customer: [Product]] = [:]
}

class OrderFacade {
    let productDB: AvailableProduct
    let orderDB: OrderList
    
    init(productDB: AvailableProduct, orderDB: OrderList) {
        self.productDB = productDB
        self.orderDB = orderDB
    }
    
    func order(product: Product, customer: Customer) {
        print("\(customer.name)님이 \(product.name)를 주문하셨습ㄴ디ㅏ.")
        if let count = self.productDB.productList[product] {
            if count == 0 {
                print("\(product.name)재고가 없습니다.")
            } else if count > 0 {
                self.productDB.productList[product] = count - 1
                
                var orderList = orderDB.orderList[customer, default: []]
                orderList.append(product)
                self.orderDB.orderList[customer] = orderList
                guard let result = self.orderDB.orderList[customer] else {
                    return
                }
                print(result)
                
                print("\(customer.name)님의 \(product.name)를 주문 접수 완료!")
            }
        } else {
            print("존재하지 않는 제품입니다.")
        }
    }
}
