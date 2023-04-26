//
//  SearchScreen.swift
//  Swiftful Thinking Continued Learning
//
//  Created by M.Huzaifa on 24/04/2023.
//

import SwiftUI

struct SearchScreen: View {
    
    @Environment(\.presentationMode) var Mode
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $textFieldText)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 55)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal)
                Button {
                    Mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                    
                }

            }
            .foregroundColor(Color.black)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding(.horizontal,30)
            Spacer()
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
