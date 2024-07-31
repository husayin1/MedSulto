//
//  FilterSheet.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct FilterSheet: View {
    @State private var accreditedIsOn: Bool = false
    @State private var freeIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Filters").font(.headline)
                Spacer()
                Button {
                    print("Reset Filters")
                } label: {
                    Text("Reset")
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Specialities")
                        Spacer()
                        Button {
                            print("view all specialities")
                        } label: {
                            Text("View all")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        Text("Sub Speciality")
                        Spacer()
                        Button {
                            print("view all sub specialities")
                        } label: {
                            Text("View all")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        Text("Course Type")
                        Spacer()
                        Button {
                            print("view all course types")
                        } label: {
                            Text("View all")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack{
                                
                                Text("Accredited type")
                                Spacer()
                                
                                Toggle(isOn: $accreditedIsOn){
                                    
                                }
                            }
                            Text("There are other insightful courses that are not accredited.")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        Text("Accreditation type")
                        Spacer()
                        Button {
                            print("view all accreditation types")
                        } label: {
                            Text("View all")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        Text("Credits")
                        Spacer()
                        Button {
                            print("view all credits")
                        } label: {
                            Text("View all")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack{
                                
                                Text("Free courses only")
                                Spacer()
                                
                                Toggle(isOn: $freeIsOn){
                                    
                                }
                            }
                            Text("Some of the courses come with a price tag, and you need to pay in order to enroll and participate.")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    Button {
                        print("Apply Filters")
                    } label: {
                        Text("Apply Filters")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("Primary"))
                            .cornerRadius(50)
                    }
                    
                    
                }
            }
        }
        .padding()
    }
}

struct FilterSheet_Previews: PreviewProvider {
    static var previews: some View {
        FilterSheet()
    }
}
