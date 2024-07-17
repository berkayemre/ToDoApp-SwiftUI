//
//  ContentView.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewVM()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
           accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

#Preview {
    MainView()
}
