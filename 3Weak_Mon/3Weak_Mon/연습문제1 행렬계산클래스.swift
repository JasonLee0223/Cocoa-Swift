//
//  연습문제1 행렬계산클래스.swift.swift
//  3Weak_Mon
//
//  Created by 이건행 on 2021/11/22.
//

import Foundation

class Matrix {
    var a : Double
    var b : Double
    var c : Double
    var d : Double
    
    // a,b,c,d 모든 값을 지정할 수 있는 초기화 메소드를 구현
    init(a: Double = 0.0, b: Double = 0.0, c: Double = 0.0, d: Double = 0.0) {
        // 각 매개 변수에 default 값을 지정해서 다른 값이 없을 경우 0으로 초기화
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    // 행렬 덧셈 클래스
    func sum(with other: Matrix) -> Matrix {
        let sumA = self.a + other.a
        let sumB = self.b + other.b
        let sumC = self.c + other.c
        let sumD = self.d + other.d
        return Matrix(a: sumA, b: sumB, c: sumC, d: sumD)
    }
    
    // 행렬 곱셈 클래스
    func product(with other: Matrix) -> Matrix{
        let multipleA = self.a * other.a + self.b * other.c
        let multipleB = self.a * other.b + self.b * other.d
        let multipleC = self.c * other.a + self.d * other.c
        let multipleD = self.c * other.b + self.d * other.d
        return Matrix(a: multipleA, b: multipleB, c: multipleC, d: multipleD)
    }
}
