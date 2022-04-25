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
    @Published var filt = "1"
    @Published var filt2 = 31.0
    @Published var filt3 = 35.0
    @Published var filt4 = 88.0
    @Published var filt5 = 91.0
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
       // let xxx = NSFetchRequest<GPSEntity>(entityName: "GPSEntity", with)
        let request = NSFetchRequest<GPSEntity>(entityName: "GPSEntity")
        // works
  //      request.predicate = NSPredicate(format: "phone_number BEGINSWITH %@", filt)
        
        //  works
    //  request.predicate = NSPredicate(format: "lat >  %i", filt2)
        // works!!!
  //     request.predicate = NSPredicate(format: "lat > %i and lat < %i", filt2, filt3)
        // works!!
  //    request.predicate = NSPredicate(format: "lat > %i and lat < %i and longt > %i and longt < %i" , filt2, filt3, filt4, filt5)\
        // works!!
        // d is signed 32 bit integer and works even though lat is double.. think it works cause d indicates interger which is
        //    what filt2,3,4,5 is.  if it were double, i should use f
//request.predicate = NSPredicate(format: "lat > %d and lat < %d and longt > %d and longt < %d" , filt2, filt3, filt4, filt5)
        // works work
        // f should be floating point double
        request.predicate = NSPredicate(format: "lat > %f and lat < %f and longt > %f and longt < %f" , filt2, filt3, filt4, filt5)
//        let context = <#Managed object context#>
//        let controller = NSFetchedResultsController(fetchRequest: "fetchRequest", managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//
        do {
            savedEntities = try container.viewContext.fetch(request)
        }  catch let  error {
            print("error fetching \(error)")
        }
    }
      //  func addgps (text: String) {
            func addgps (text: String, parm1: Double, parm2:Double) {
//let x = Int(parm1)
  //              let y = Int(parm2)
                filt2 = parm1 - 5.0
                filt3 = parm1 + 5.0
                filt4 = parm2 - 5.0
                filt5 = parm2 + 5.0
            let newgps = GPSEntity(context: container.viewContext)
            newgps.phone_number = text
            newgps.lat = parm1
            newgps.longt = parm2
            savedata()
        }
    
    func deleteGPS(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        savedata()
    }
    
        func savedata() {
 //          savedEntities.removeAll()
 //          savedata()
            do {
         try  container.viewContext.save()
                fetchgps()
                
            } catch let  error {
                print("error saving \(error)")
            }
        }
    func deletedata(indexSet: IndexSet) {
      //    savedEntities.removeAll()
      //    savedata()
//        guard let index = indexSet.first else {return}
//        let entity = savedEntities[index]
//        ForEach (savedEntities) {entity in entity}
//
//
//       let index = IndexSet.first else {return}
//
//        container.viewContext.delete(entity)
    }
    }


struct CoreDataBootCamp: View {
  //  @ObservedObject var viewModel = ContentViewModel()
    @StateObject var vm = CoreDataViewModel()
  //  @ObservableObject filtx = filt()
    @State var textfieldtext: String = ""
    @State var i: Double = 1
    @State var  j: Double = 2
    @State private var amt1 = ""
    @State private var amt2 = ""
    @Environment(\.managedObjectContext) var moc
// this fetchrequest is not being used.. fetch is in the coredataviewmodel
   // @StateObject var filtx = filt()
    @FetchRequest(sortDescriptors: [],
                 predicate: nil
             //     predicate: NSPredicate(format:
             //                               "phone_number BEGINSWITH %@", "1111")
                  ) var vmx:
                  FetchedResults<GPSEntity>
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
              //  Text("Filt is: \(filt)")
          //      vm.filt2 = 32
            //    vm.filt3 = 35
             //   vm.filt4 = 88
             //   vm.filt2 = 20
            
              //  Text("\(vm.filt2)")
                
                TextField("Add phone here", text: $textfieldtext)
                TextField("Add lat", text: $amt1)
                TextField("Add longtitud", text: $amt2)
                let i = (amt1 as NSString).doubleValue
                let j = (amt2 as NSString).doubleValue
                
//                Button ("add example") {
//                    let test1 = GPSEntity(context: moc)
//                    test1.phone_number = "3371234123"
//                    test1.longt = 90
//                    test1.lat = 90
//                    try? moc.save() 
//               
//
//                }

                Button(action: {
              
                    guard !textfieldtext.isEmpty else {return}
                  
                    vm.addgps(text: textfieldtext, parm1: i, parm2: j)
                    textfieldtext = ""
                }, label: {
                Text("add Button")
                        .font(.headline)
                        .background(Color(.blue))
                        .foregroundColor(.white)
                })
//                Button(action: {
//              
//                  
//                  
//                    vm.deletedata()
//                  
//                }, label: {
//                Text("delete Button")
//                        .font(.headline)
//                        .background(Color(.blue))
//                        .foregroundColor(.white)
//                })
                
                Text("Searching from lat \(vm.filt2) to lat \(vm.filt3) / Searching from longt: \(vm.filt4) to longt: \(vm.filt5)  ")
                Spacer()
              //  filt()
                List {
                   
                    ForEach (vm.savedEntities) { entity in
                       let newline = Text(entity.phone_number ?? "no name"  ) + Text("        Lat:  \(entity.lat, specifier: "%.4f")") + Text("        Long: \(entity.longt, specifier: "%.4f")")
                        Text("\(newline)")
                            .font(.system(size: 8, weight: .medium, design: .rounded))
                      
                      
                    
                        
                    }
                    .onDelete(perform: vm.deleteGPS)
                }
                
            }
        .navigationTitle("GPS")
    }
        
        
}
//    func filt (){
//        let filttest = UIAlertAction(title:"Filtr", style: .default) {
//            (action)  in
//            self.fetchRequestWithTemplate(named: "FetchRequest")
//        }
//    }
//    func fetchRequestWithTemplate(named:String) {
//        coreData.fetchRequest(requestName: named)
//        self.handle(result)
//    }
}
struct CoreDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootCamp()
    }
}
