//
//  거품정렬 클래스.swift.swift
//  3Weak_Mon
//
//  Created by 이건행 on 2021/11/24.
//

/* 아래와 같은 거품 정렬 알고리즘을 직접 클래스로 구현
do
  swapped = false
  for i = 1 to indexOfLastUnsortedElement
    if leftElement > rightElement
      swap(leftElement, rightElement)
      swapped = true
      swapCounter++
while swapped
*/

import Foundation

class BubbleSort{
    //초기화 생성 함수에는 Int 값을 배열로 전달하고
    private var originArr = [Int]()
    
    init(originArr: Array<Int>) {
        self.originArr = originArr      // 내부 property 배열에 저장한다.
    }
    
    // 함수를 호출하면 거품 정렬을 거쳐서 리턴한다. Ascending: 오름차순
    func sorted(isAscending: Bool) -> Array<Int> {
        //내부 배열은 그대로 두고 복사해서 정렬을 시도한다.
        var swapArr = originArr

        func swap(aIndex: Int, bIndex: Int){
            if swapArr[aIndex] > swapArr[bIndex]{
                let tempValue = swapArr[aIndex]
                swapArr[aIndex] = swapArr[bIndex]
                swapArr[bIndex] = tempValue
            }
        }
        /*
        //isAscending 값이 true 이면 오름차순으로, false이면 내림차순으로 정렬한다.
        
         */
        for i in 0..<originArr.count - 1 {
            for j in 0..<originArr.count - 1 - i {
                //isAscending ? swap(aIndex: j, bIndex: j + 1) : swap(aIndex: j + 1, bIndex: j)
                guard isAscending == true else {
                    //Descending
                    swap(aIndex: j + 1, bIndex: j)
                    swapArr.sorted(by: >) //Descending
                    continue
                };
                swap(aIndex: j, bIndex: j + 1)
                swapArr.sorted(by: <) //Ascending
            }
        }
        return swapArr
    }
}

