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
                
                Section(header: Text(viewModel.headerInfo)) {
                    
                    TextField(viewModel.fullnameLabel, text: $viewModel.fullName)
                        .styleTextField()
                        .disableAutocorrection(true)
                    TextField(viewModel.emailLabel, text: $viewModel.email)
                        .styleTextField()
                        .disableAutocorrection(true)
                    TextField(viewModel.websiteLabel, text: $viewModel.website)
                        .styleTextField()
                        .disableAutocorrection(true)
                }
                
                Section(header: Text(viewModel.headerProjects)) {
                    
                    VStack(alignment: .leading) {
                        
                        ForEach(viewModel.fundedProjects.indices, id: \.self) { index in
                            
                            TextField(viewModel.fundedProjectLabel, text: $viewModel.fundedProjects[index])
                                .styleTextField()
                                .disableAutocorrection(true)
                        }
                        Button(action: {
                            
                            viewModel.fundedProjects.append("")
                        }) {
                            Image(systemName: viewModel.addSystemName)
                                .foregroundColor(Color.peach)
                                .padding(.leading, 5)
                        }
                    }
                    TextField(viewModel.amountFundedLabel, text: $viewModel.amountFunded)
                        .styleTextField()
                        .disableAutocorrection(true)
                }
                
                if !viewModel.formIsEmpty {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.saveStakeholder()
                        }){
                            Image(systemName: viewModel.saveSystemName)
                            Text(viewModel.saveButtonLabel)
                        }
                        .padding()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.darkBlue)
                        .shadow(color: .lightBlue, radius: 3, x: 3, y: 3)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.cleanValues()
                        }){
                            Image(systemName: viewModel.cancelSystemName)
                            Text(viewModel.cancelButtonLabel)
                        }
                        .padding()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.darkBlue)
                        .shadow(color: .lightBlue, radius: 3, x: 3, y: 3)
                        
                    }
                }
            }.foregroundColor(.peach)
                .alert(isPresented: $viewModel.presentAlert) {
                    
                    Alert(title: Text(viewModel.alertTitle),
                          message: Text(viewModel.alertText), dismissButton: .default(Text(viewModel.alertDismiss), action: {
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
