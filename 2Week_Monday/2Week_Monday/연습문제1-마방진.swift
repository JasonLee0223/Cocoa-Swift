//
//  연습문제1-마방진.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//

/*
func makeMagicSquare(row: Int) -> Array<Array<Int>> {
    let reRow = row //위 매개변수를 왜 다시 변수를 선언해서 받아야할까??
*/


import Foundation

struct MagicSquare{
    
    func makeMagicSquare(row: Int) -> [[Int]] {
        var MagicArr = [[Int]](repeating: [Int](repeating: 0, count: row), count: row)
        var squrRow = 0             // 행
        var squrCol = Int(row/2)    // 열 squrCol=1
        var tempRow = 0
        var tempCol = Int(row/2)
        MagicArr[squrRow][squrCol] = 1  // 시작점 위치 초기화
        
        // 그러므로 2행부터 시작
        for addNum in 2...row*row {
            tempRow = tempRow - 1 < 0 ? row - 1 : squrRow - 1 //처음 tempRow = 2 행
            tempCol = tempCol + 1 > row - 1 ? 0 : squrCol + 1 //처음 tempCol = 2 열
            
            if MagicArr[tempRow][tempCol] != 0 {
                squrCol = squrCol + 1 > row - 1 ? 0 : squrCol + 1
                MagicArr[squrRow][squrCol] = addNum
                tempRow = squrRow
                tempCol = squrCol
            } else {
                squrRow = tempRow
                squrCol = tempCol
                MagicArr[squrRow][squrCol] = addNum //MagicArr[2][2] = 2
            }
        }
     return MagicArr
    }
    
    func printMagicSquare(square: [[Int]]){
        for innerArray in square {
            for num in innerArray {
                print(num, terminator: " ")
            }
            print("")
        }
    }
}
var resMagic = MagicSquare()


/*
func testArray() -> [[Int]]{
    let array = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)
    print(array, terminator: " ")
    
    return array
}
 print(testArray()) -> main.swift에서 호출
*/
