//
//  Practice DragGesture.swift
//  Swiftful Thinking Continued Learning
//
//  Created by M.Huzaifa on 23/04/2023.
//

import SwiftUI

struct Snap_Clone: View {
    
    
    @State var showSheet: Bool = false
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    SnapBar()
                    Divider()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack{
                            Text("Friends")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Spacer()
                        }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20 ) {
                            StoryView(name: " Huzaifa", image: "lion")
                            StoryView(name: " Khalifa", image: "person5")
                            StoryView(name: " Shahid", image: "person4")
                            StoryView(name: " Tom", image: "person3")
                            StoryView(name: " Arslan", image: "person2")
                            StoryView(name: " Sufiyan", image: "person")
                            StoryView(name: " Akram", image: "lion")
                        }
                        .padding(.horizontal,8)
                    }
                    .padding(.vertical,12)
                    HStack{
                        Text("Subscriptions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "chevron.right")
                                .accentColor(Color.gray)
                        }
                        Spacer()

                    }
                    .fullScreenCover(isPresented: $showSheet) {
                        SubscriptionScreen()
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            
                            SubscriptionsView(name: "Huzaifa", iamge: "person")
                            SubscriptionsView(name: "Nick", iamge: "person2")
                            SubscriptionsView(name: "Daniel", iamge: "person3")
                            SubscriptionsView(name: "Hafsa", iamge: "person4")
                            SubscriptionsView(name: "Malika", iamge: "person5")
                            SubscriptionsView(name: "Umair", iamge: "person")
                            SubscriptionsView(name: "Hassan", iamge: "lion")
                            SubscriptionsView(name: "Hafeez", iamge: "person5")
                            SubscriptionsView(name: "Babar", iamge: "person2")
                        }
                        
                        
                        
                    }
                    HStack{
                        Text("Discover")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                        Spacer()
                    }
                    .padding(.top)
                        LazyVGrid(columns: columns) {
                            Image("lion")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            Image("person")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            Image("person2")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            Image("person3")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            Image("person4")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            Image("person5")
                                .resizable()
                                .frame(width: 170, height: 250)
                                .cornerRadius(5)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
            }
        }
    }


struct SubscriptionScreen: View{
    
    @Environment(\.presentationMode) var Mode
    
    var body: some View{
        VStack {
            HStack{
                Spacer()
                Text("Subscriptions")
                Spacer()
                Button {
                    Mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                        .accentColor(Color.black)
                }
            }
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding(.horizontal,20)
            Spacer()
        }
    }
}
//MARK: Content
struct Practice_DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        Snap_Clone()
    }
}

struct SnapBar: View {
    @State var showElipsesScreen: Bool = false
    @State var showSearchsScreen: Bool = false
    
    var body: some View {
        HStack(spacing: 50) {
            Image(systemName: "person.fill")
                .background(
                    Circle()
                        .frame(width: 45, height: 55)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
            HStack{
                Button {
                    showSearchsScreen.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .accentColor(Color.black)
                    .font(.headline)
                    .background() {
                        Circle()
                            .frame(width: 45, height: 55)
                            .foregroundColor(Color.gray.opacity(0.2))
            }
          
                }
            .fullScreenCover(isPresented: $showSearchsScreen) {
                withAnimation(.spring()){
                    
                    SearchScreen()
                }
            }
            
            Text("Stories")
                .foregroundColor(Color.black)
                .font(.title3)
            Image(systemName: "person.fill.badge.plus")
                .background(
                    Circle()
                        .frame(width: 45, height: 55)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
            HStack{
                Button {
                    showElipsesScreen.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .accentColor(Color.black)
                }
            }
            .sheet(isPresented: $showElipsesScreen, content: {
                ElipsesScreen()
                    .presentationDetents([.height(150)])
            })
                .background(
                    Circle()
                        .frame(width: 45, height: 55)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
        }
    }
}


struct StoryView: View {
    
    var name: String
    var image: String
    
    public init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    
    var body: some View {
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 80)
                    .cornerRadius(60)
                    .overlay {
                        Circle()
                            .stroke(Color.purple, lineWidth: 1.5)
                            .frame(width: 80, height: 90)
                    }
            }
            Text(name)
                .font(.caption)
        }
    }
}

struct SubscriptionsView: View {
    
    var name: String
    var image: String
    
    public init(name: String, iamge: String) {
        self.name = name
        self.image = iamge
    }
    
    var body: some View {
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 130)
                    .cornerRadius(10)
            }
            Text(name)
        }
    }
}
