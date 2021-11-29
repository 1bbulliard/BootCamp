//
//  InitializerBootCamp_13.swift
//  BootCamp
//
//  Created by Bob Bulliard on 11/29/21.
//

import SwiftUI
struct InitializerBootcamp: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        
        if fruit == .apple{
            self.backgroundColor = .red
            self.title = "Apples"
        } else {
            self.backgroundColor = .orange
            self.title = "Oranges"
        }
    }
    enum Fruit {
          case apple
          case orange
        
    }
    var body: some View {
        VStack(spacing: 12){
            Text(title)
                .font(.headline)
            Text("\(count)")
        }
        .frame(width: 150, height: 150, alignment: .center)
        .background(backgroundColor)
        
        .font(.largeTitle)
        .foregroundColor(.white)
        .cornerRadius(19)
    }
}
 
struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
        InitializerBootcamp(count: 20, fruit: .apple)
            InitializerBootcamp(count: 10, fruit: .orange)
    }
}
}
