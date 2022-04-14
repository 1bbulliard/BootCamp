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
    @Published var savedEntities: [GPSEntity] = []
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
        fetchgps()
    }
    func fetchgps() {
        let request = NSFetchRequest<GPSEntity>(entityName: "GPSEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        }  catch let  error {
            print("error fetching \(error)")
        }
    }
      //  func addgps (text: String) {
            func addgps (text: String, parm1: Double, parm2:Double) {
            let newgps = GPSEntity(context: container.viewContext)
            newgps.phone_number = text
            newgps.lat = parm1
            newgps.longt = parm2
            savedata()
        }
        func savedata() {
            do {
         try  container.viewContext.save()
                fetchgps()
            } catch let  error {
                print("error saving \(error)")
            }
        }
    }


struct CoreDataBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textfieldtext: String = ""
    @State var i: Double = 1
    @State var  j: Double = 2
    @State private var amt1 = ""
    @State private var amt2 = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add phone here", text: $textfieldtext)
                TextField("Add lat", text: $amt1)
                TextField("Add longtitud", text: $amt2)
                let i = (amt1 as NSString).doubleValue
                let j = (amt2 as NSString).doubleValue
                
                
                Button(action: {
                  //  vm.addGPS(text: textfieldtext, parm1: 33, parm2: 94 )
                    guard !textfieldtext.isEmpty else {return}
                   // vm.addgps(text: textfieldtext)
                    vm.addgps(text: textfieldtext, parm1: i, parm2: j)
                    textfieldtext = ""
                }, label: {
                Text("Button")
                        .font(.headline)
                        .background(Color(.blue))
                        .foregroundColor(.white)
                })
                
                
                Spacer()
                List {
                    ForEach (vm.savedEntities) { entity in
                        Text(entity.phone_number ?? "no name")
                        Text("\(entity.lat)")
                        Text("\(entity.longt)")
                        
                    }
                }
        }
        .navigationTitle("GPS")
    }
}
}
struct CoreDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootCamp()
    }
}
