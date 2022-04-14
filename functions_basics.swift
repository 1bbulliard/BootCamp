//
//  functions_basics.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/7/21.
//

import SwiftUI

struct functions_basics: View {
    var body: some View {
        VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("func1: \(myFunc1(label:3))")
        Text("func2: \(myFunc2(num:3))")
            Text("func2a: \(myFunc2a(num:8, num2: 9))")
            Text("func3: \(myFunc3(3))")
            Text("func3b: \(myFunc3b(5, 4))")
            Text("Arith mean: \(arithmeticMean(1, 2, 3, 4, 5))")
            Text("Arith mean2: \(arithmeticMean2(parm1: 1, parm2: 2))")
    }
}
}
func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
         total += number
                     }
            return total / Double(numbers.count)
                 }
func arithmeticMean2(parm1: Double, parm2: Double) -> Double {
        var total: Double = 0
        total = parm1 + parm2
        
            return total / 2
                 }

func myFunc1(label num: Int ) -> Int  // example call myFunc(label: 3)
{return num}
func myFunc2(num: Int)   -> Int      // example call myFunc(num: 3)
{return num}
func myFunc2a(num: Int, num2: Int)   -> Int      // example call myFunc(num: 3)
{return num}
// or {return num, num2}
func myFunc3(_ num: Int)  -> Int     // example call myFunc(3)
{return num}
// _ is a placeholder meaning the call doesnt have a label to the param
func myFunc3b(_ num: Int, _ num2: Int)  -> Int     // example call myFunc(3)
//num = num + num2
{return num}

struct functions_basics_Previews: PreviewProvider {
    static var previews: some View {
        functions_basics()
    }
}
