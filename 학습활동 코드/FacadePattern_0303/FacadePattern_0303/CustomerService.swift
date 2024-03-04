//
//  CustomerService.swift
//  FacadePattern_0303
//
//  Created by Roh on 3/4/24.
//

import Foundation

class 주문이행서비스 {
    var 손님: String
    init(손님: String) {
        self.손님 = 손님
    }
    
    func 고객상담() {
        print("\(손님) 고객상담 진행")
    }
    
    func 주문수락() -> Bool {
        print("주문 수락")
        return true
    }
}

class 청구서비스 {
    var 아이템: String
    
    init(아이템: String) {
        self.아이템 = 아이템
    }
    
    func 결제요청() {
        print("\(아이템) 결제 진행")
    }
    func 청구서발급() {
        print("\(아이템) 청구서 발급")
    }
    func 지불확인및관리() -> Bool {
        print("\(아이템)에 대한 지불 확인")
        return true
    }
}

class 배송서비스 {
    var 손님: String
    var 아이탬: String
    var 장소: String
    
    init(
        손님: String,
        아이탬: String,
        장소: String
    ) {
        self.손님 = 손님
        self.아이탬 = 아이탬
        self.장소 = 장소
    }
    
    func 포장() {
        print("\(손님)고객의 \(아이탬) 포장을 완료")
    }
    
    func 운송() {
        print("\(장소)로 운송 시작")
    }
    
    func 배송추적() {
        print("\(장소)로 운송 완료")
    }
}

class 고객응대서비스 {
    var 주문이행: 주문이행서비스
    var 청구: 청구서비스
    var 배송: 배송서비스
    var 실패 = false
    var 미지불 = false
    
    init(주문이행: 주문이행서비스, 청구: 청구서비스, 배송: 배송서비스) {
        self.주문이행 = 주문이행
        self.청구 = 청구
        self.배송 = 배송
    }
    
    func 시작() {
        주문이행.고객상담()
        let 주문확인 = 주문이행.주문수락()
        if 주문확인 == 실패 {
            print("주문 실패")
            return
        }
        청구.결제요청()
        청구.청구서발급()
        let 지불확인 = 청구.지불확인및관리()
        if 지불확인 == 미지불 {
            print("결제 미진행")
        }
        배송.포장()
        배송.운송()
        배송.배송추적()
    }
}
