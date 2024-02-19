//
//  main.swift
//  codingTest
//
//  Created by Roh on 2/19/24.
//

import Foundation


var myArray = [0,1,2,7,3,4]
var myArray2 = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

var result = myArray[myArray2[0][0]...myArray2[0][1]]
let result2 = result.map { aa in
    return aa
}

