//
//  ElipsesScreen.swift
//  Swiftful Thinking Continued Learning
//
//  Created by M.Huzaifa on 24/04/2023.
//

import SwiftUI

struct ElipsesScreen: View {
    
    @State var showManageSheet: Bool = false
    @Environment(\.presentationMode) var Mode
    @State var showhiddenStorySheet: Bool = false
    
    var body: some View {
        HStack{
            VStack{
                Button("Manage Subscriptions and Notifications") {
                    showManageSheet.toggle()
                }
                .fullScreenCover(isPresented: $showManageSheet) {
                        ManageSubscriptionScreen()
                }
                Divider()
                
                Button("View Hidden Channels") {
                    showhiddenStorySheet.toggle()
                }
                .fullScreenCover(isPresented: $showhiddenStorySheet) {
                    HiddenStoriesScreen()
                }
                Divider()
                Button("Done") {
                    Mode.wrappedValue.dismiss()
            }
            }
            
        }
        .font(.headline)
        .fontWeight(.bold)
        .fontDesign(.rounded)
        .accentColor(Color.black)
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .shadow(radius: 30)
        .padding(.top)
    }
}

struct HiddenStoriesScreen: View {
    
    @Environment(\.presentationMode) var Mode
    
    var body: some View {
        ZStack {
            Text("No hidden Stories.")
            
            VStack {
                HStack(spacing: 30){
                    Button {
                        Mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    .font(.headline)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color.black)
                    Spacer()
                    VStack(spacing: 10.0){
                        Text("Hidden Stories")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .foregroundColor(Color.black)
                        Text("Manage your hidden Stories here.")
                            .font(.caption2)
                    }
Spacer()
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        
    }
}

struct ManageSubscriptionScreen: View {
    
    @Environment(\.presentationMode) var Mode
    var body: some View{
        VStack {
            HStack(spacing: 30){
                Button {
                    Mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                }
                .font(.headline)
                .fontWeight(.heavy)
                .fontDesign(.rounded)
                .foregroundColor(Color.black)
                .foregroundColor(Color.black)
                
                VStack(spacing: 10.0){
                    Text("Subscriptions")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(Color.black)
                    Text("Manage your subscriptions and notifications.")
                        .font(.caption2)
                }
                Button {
                    
                } label: {
                    EditButton()
                }
                .font(.headline)
                .fontWeight(.heavy)
                .fontDesign(.rounded)
                .foregroundColor(Color.black)

            }
            .padding(.horizontal, -5)
            Spacer()
        }
    }
}

struct ElipsesScreen_Previews: PreviewProvider {
    static var previews: some View {
//        ManageSubscriptionScreen()
        ElipsesScreen()
//        HiddenStoriesScreen()
    }
}
