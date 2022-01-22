//
//  AddProjectView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct AddProjectView: View {
    
    @StateObject var viewModel: AddProjectViewModel
    
    @State private var showingImagePicker = false
    
    var body: some View {
        
        VStack {
            
            Form {
                
                Section(header: Text(viewModel.headerInfo)) {
                    
                    TextField(viewModel.projectNameLabel, text: $viewModel.projectName)
                        .styleTextField()
                        .disableAutocorrection(true)
                    
                    TextField(viewModel.websiteLabel, text: $viewModel.website)
                        .styleTextField()
                        .disableAutocorrection(true)
                    
                    VStack(alignment: .leading) {
                        
                        Text(viewModel.descriptionLabel)
                            .foregroundColor(.lightBlue)
                            .padding(.leading, 5)
                        ZStack {
                            
                            TextEditor(text: $viewModel.description)
                                .styleTextField()
                                .disableAutocorrection(true)
                        }
                    }
                    
                    TextField(viewModel.budgetLabel, text: $viewModel.budget)
                        .styleTextField()
                        .disableAutocorrection(true)
                    
                    DatePicker(viewModel.dateLabel, selection: $viewModel.closingDate, displayedComponents: .date)
                        .foregroundColor(.darkBlue)
                    
                    ZStack(alignment: .leading) {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.lightBlue)
                        
                        if (viewModel.image == nil) {
                            
                            Text(viewModel.imageLabel)
                                .foregroundColor(.darkBlue)
                                .padding()
                        } else {
                            
                            Text(viewModel.imageLoadedLabel)
                                .foregroundColor(.darkBlue)
                                .padding()
                        }
                    }
                    .onTapGesture {
                        
                        showingImagePicker = true
                    }
                    .onChange(of: viewModel.inputImage) {
                        _ in viewModel.loadImage()
                    }
                }.foregroundColor(.peach)
                
                if !viewModel.formIsEmpty {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.saveProject()
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
                        
                    }.alert(isPresented: $viewModel.presentAlert) {
                        
                        Alert(title: Text(viewModel.alertTitle),
                              message: Text(viewModel.alertText), dismissButton: .default(Text(viewModel.alertDismiss), action: {
                        }))
                    }
                }
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $viewModel.inputImage)
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(viewModel: AddProjectViewModel())
    }
}
