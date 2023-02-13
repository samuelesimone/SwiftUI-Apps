//
//  ContentView.swift
//  Devote
//
//  Created by Samuele Simone on 02/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - 1. PROPERTIES
    @State var task: String = ""
    private var isButtonDisable: Bool {
        task.isEmpty
    }
    @Environment(\.managedObjectContext) private var viewContext
    
    //FETCHING DATA
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //MARK: - FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
        
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyBoard()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
           
            ZStack {
                VStack {
                    VStack {
                        TextField("New Task", text:$task)
                            .padding()
                            .background(
                                Color( UIColor.systemGray6))
                        .cornerRadius(10)
                        Button(action: {
                            addItem()
                        }, label: {
                            Spacer()
                            Text("SAVE")
                            Spacer()
                        })
                        .disabled(isButtonDisable)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisable ? Color.gray : Color.pink)
                        .cornerRadius(10)
                    }.padding()
                    
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                VStack(alignment: .leading) {
                                    Text(item.task ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }//: LIST ITEM
                            } label: {
                                Text(item.timestamp!, formatter: itemFormatter)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }.listStyle(InsetGroupedListStyle())
                  
                }
               
                
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationTitle("Daily Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
        }
            
            .navigationViewStyle(StackNavigationViewStyle())
            .background(backgroundGradient.ignoresSafeArea(.all))
            Text("Select an item")
        }
        
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
    
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
