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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            FilterSheetHeader()
            ScrollView {
                VStack {
                    FilterCell(headerText: "Specialities")
                    FilterCell(headerText: "Sub Speciality")
                    FilterCell(headerText: "Course Type")
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
                    
                    FilterCell(headerText: "Accreditation type")
                    FilterCell(headerText: "Credits")
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
                        //for dismissing the sheet
                        presentationMode.wrappedValue.dismiss()

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
