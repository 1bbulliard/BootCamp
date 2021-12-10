//
//  AppStorageBootcamp.swift
//  BootCamp
//
//  Created by Bob Bulliard on 12/8/21.
//

import SwiftUI


struct AppStorageBootcamp: View {
    @State var currentUserName: String?
// old way @AppStorage("name") var currentUserName: String?
    var body: some View {
        VStack(spacing:20){
        Text(currentUserName ?? "Add Name Here")
            if let name = currentUserName {
                Text(name)
            }
            Button("Save".uppercased()) {
                let name: String = "Emily"
                currentUserName = name
              
            }
    }
        
}
}
struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
