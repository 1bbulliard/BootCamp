//
//  extension_view.swift
//  BootCamp
//
//  Created by Bob Bulliard on 1/7/22.
//

import SwiftUI

struct extension_view: View {
    var body: some View {
        VStack {
            Spacer()
            if 1 == 1 { bodyx}
            Spacer()
            
            bodyy
            Spacer()
            bodyz
            Spacer()
        }
    }
}
struct extension_view_Previews: PreviewProvider {
    static var previews: some View {
        extension_view()
    }
}
// note that extension_view is identical to above struct extension_view
// so extension just adds to above view, or it extends it.

extension extension_view {
    private  var bodyx: some View {
        
        Text("func2a: \(myFunc2ab(num:28, num2: 9))")
            .padding(30)
        
    }
    
    private  var bodyy: some View {
        Text("Hello, Worldy3y!: \(myFunc3xy(3))")
        
    }
    private  var bodyz: some View {
        Text("Hello, Worldz: ")
    }
}


func myFunc3xy(_ num: Int)  -> Int     // example call 
//num = num * 3
{var numx = 0
    numx = num + 1
    return numx }

func myFunc2ab(num: Int, num2: Int)   -> Int      // example call myFunc(num: 3)
//num = num + 1

{return num+num2}
func sum(a: Int, b: Int) {
    let a = a + b
    let b = a - b
    // return a
}
