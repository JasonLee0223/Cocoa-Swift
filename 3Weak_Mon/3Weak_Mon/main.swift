//
//  main.swift
//  3Weak_Mon
//
//  Created by 이건행 on 2021/11/22.
//

import Foundation

//1. matrix
let matrix1 = Matrix(a: 1, b: 2, c: 3, d: 4)
let matrix2 = Matrix(a: 5, b: 6, c: 7, d: 8)
let sumedMatrix = matrix1.sum(with: matrix1)
let productedMatrix = matrix1.product(with: matrix2)
print(sumedMatrix.a,sumedMatrix.b,sumedMatrix.c,sumedMatrix.d)
print(productedMatrix.a,productedMatrix.b,productedMatrix.c,productedMatrix.d)

