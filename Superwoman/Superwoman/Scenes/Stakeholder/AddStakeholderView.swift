//
//  AddStakeholderView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct AddStakeholderView: View {
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var website: String = ""
    @State var fundedProjects: [String] = [""]
    @State var amountFunded: [String] = [""]
    
    var body: some View {
        
        VStack {
            
            Form {
                
                Section(header: Text("Stakeholder info")) {
                    
                    TextField("Fullname", text: $fullName)
                        .styleTextField()
                    TextField("eMail", text: $email)
                        .styleTextField()
                    TextField("Website", text: $website)
                        .styleTextField()
                }
                
                Section(header: Text("Stakeholder projects")) {
                    
                    VStack(alignment: .leading) {
                        
                        ForEach(fundedProjects.indices, id: \.self) { index in
                            
                            TextField("Funded project name", text: $fundedProjects[index])
                                .styleTextField()
                        }
                        Button(action: {
                            
                            fundedProjects.append("")
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.peach)
                                .padding(.leading, 5)
                        }
                    }
                    TextField("Total amount funded in €", text: $email)
                        .styleTextField()
                }
                HStack {
                    
                Button(action: {
                            print("Save")
                        }){
                            Image(systemName: "person.crop.circle.badge.checkmark")
                            Text("Save")
                        }
                        .padding()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.darkBlue)
                        .shadow(color: .lightBlue, radius: 3, x: 3, y: 3)
                    
                Spacer()
                    
                Button(action: {
                                print("Cancel")
                            }){
                                Image(systemName: "person.crop.circle.badge.exclamationmark")
                                Text("Cancel")
                            }
                            .padding()
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(.darkBlue)
                            .shadow(color: .lightBlue, radius: 3, x: 3, y: 3)
                    
                }
            }.foregroundColor(.peach)
        }
    }
}

struct AddStakeholderView_Previews: PreviewProvider {
    static var previews: some View {
        AddStakeholderView()
    }
}
