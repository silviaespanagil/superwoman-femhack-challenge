//
//  AddStakeholderView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct AddStakeholderView: View {
    
    @StateObject var viewModel: AddStakeholderViewModel
    
    var body: some View {
        
        VStack {
            
            Form {

                Section(header: Text("Stakeholder info")) {
                    
                    TextField(viewModel.fullnameLabel, text: $viewModel.fullName)
                        .styleTextField()
                    TextField(viewModel.emailLabel, text: $viewModel.email)
                        .styleTextField()
                    TextField(viewModel.websiteLabel, text: $viewModel.website)
                        .styleTextField()
                }
                
                Section(header: Text("Stakeholder projects")) {
                    
                    VStack(alignment: .leading) {
                        
                        ForEach(viewModel.fundedProjects.indices, id: \.self) { index in
                            
                            TextField("Funded project name", text: $viewModel.fundedProjects[index])
                                .styleTextField()
                        }
                        Button(action: {
                            
                            viewModel.fundedProjects.append("")
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.peach)
                                .padding(.leading, 5)
                        }
                    }
                    TextField("Total amount funded in €", text: $viewModel.amountFunded)
                        .styleTextField()
                }
                
                if !viewModel.formIsEmpty {
                HStack {
                    
                    Button(action: {
                        
                        viewModel.saveStakeholder()
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
                        viewModel.cleanValues()
                    }){
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                        Text("Cancel")
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.darkBlue)
                    .shadow(color: .lightBlue, radius: 3, x: 3, y: 3)
                    
                }}
            }.foregroundColor(.peach)
                .alert(isPresented: $viewModel.presentAlert) {
                    
                    Alert(title: Text("eMail is not valid"), message: Text("Please check the mail and save again"), dismissButton: .default(Text("Okay"), action: {
                    }))
                }
        }
    }
}

struct AddStakeholderView_Previews: PreviewProvider {
    static var previews: some View {
        AddStakeholderView(viewModel: AddStakeholderViewModel())
    }
}
