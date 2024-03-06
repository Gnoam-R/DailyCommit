//
//  main.swift
//  Flyweight Pattern
//
//  Created by Ick on 2021/05/22.
//

import Foundation

var bullets: [Bullet] = []

for i in 0..<5 {
    let i = Float(i)
    bullets.append(
        Bullet(
            x: i,
            y: i,
            velocity: i*5,
            extrinsicState: BulletFlyweightFactory.getBulletFlyweight(
                color: "Red",
                size: 12.0
            )
        )
    )
}

for i in 0..<5 {
    let i = Float(i)
    bullets.append(
        Bullet(
            x: i,
            y: i,
            velocity: i*5,
            extrinsicState: BulletFlyweightFactory.getBulletFlyweight(
                color: "blue",
                size: 24.0
            )
        )
    )
}
print("--------------------------------")
print("Flyweight 객체 수 : \(BulletFlyweightFactory.flyweightCount)")
print("Flyweight Bullet 수 : \(bullets.count)")
print("--------------------------------")
bullets[1].getState()
bullets[2].getState()
print("--------------------------------")
bullets[8].getState()
bullets[9].getState()
