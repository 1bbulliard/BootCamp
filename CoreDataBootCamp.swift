//
//  CoreDataBootCamp.swift
//  BootCamp
//
//  Created by Bob Bulliard on 4/14/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject{
    let container:NSPersistentContainer
    init()
    {
        container = NSPersistentContainer(name: "GPS_Container")
        container.loadPersistentStores { (description, error) in
            if let error = error    {
                print("Error loading core data. \(error)")
            }else {
                print("Succesfully  open core data file")
            }

}
    }
}

struct CoreDataBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootCamp()
    }
}
