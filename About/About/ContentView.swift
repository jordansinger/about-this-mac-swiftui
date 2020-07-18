//
//  ContentView.swift
//  About This Mac
//
//  Created by Jordan Singer on 7/17/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            Overview()
        }
    }
}

struct Sidebar: View {
    @State private var selection: Set<Int> = [0]
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(destination: Overview()) {
                Label("Overview", systemImage: "menubar.dock.rectangle")
            }
            .tag(0)
            
            NavigationLink(destination: Displays()) {
                Label("Displays", systemImage: "display")
            }
            .tag(1)
            
            NavigationLink(destination: Storage()) {
                Label("Storage", systemImage: "externaldrive")
            }
            .tag(2)
            
            Label("Support", systemImage: "lifepreserver")
            Label("Service", systemImage: "wrench.and.screwdriver")
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 160, idealWidth: 160, maxWidth: 160, maxHeight: .infinity)
        .toolbar { Spacer() }
    }
}

struct Overview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(systemName: "menubar.dock.rectangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(height: 48)
            Text("macOS Big Sur")
                .font(.title)
            Text("Version 11.0")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("MacBook Pro (13-inch, 2020, Four Thunderbolt 3 ports)")
                    .fontWeight(.medium)
                HStack {
                    Text("Processor")
                        .fontWeight(.medium)
                    Text("2 GHz Quad-Core Intel Core i5")
                }
                HStack {
                    Text("Memory")
                        .fontWeight(.medium)
                    Text("16 GB 3733 MHz LPDDR4X")
                }
                HStack {
                    Text("Graphics")
                        .fontWeight(.medium)
                    Text("Intel Iris Plus Graphics 1536 MB")
                }
                HStack {
                    Text("Serial Number")
                        .fontWeight(.medium)
                    Text("JHBHVJYKU78")
                }
            }
            .font(.callout)
            .padding(.top)
        }
        .navigationTitle("Overview")
        .frame(minWidth: 480, idealWidth: 480, maxWidth: 480, maxHeight: .infinity)
    }
}

struct Displays: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "display")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(height: 48)
            
            Text("Built-in Retina Display")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("13.3-inch (2560 x 1600)")
                Text("Intel Iris Plus Graphics 1536 MB graphics")
            }
            .font(.callout)
            .padding(.top)
        }
        .navigationTitle("Displays")
        .frame(minWidth: 480, idealWidth: 480, maxWidth: 480, maxHeight: .infinity)
    }
}

struct Storage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "externaldrive")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
                .frame(height: 48)
            Text("500 GB Flash Storage")
                .font(.headline)

            VStack(alignment: .leading, spacing: 4) {
                Text("256 GB available of 480 GB")
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 64, height: 24)
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 32, height: 24)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 24, height: 24)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 24, height: 24)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 128, height: 24)
                }
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .background(Color(NSColor.unemphasizedSelectedContentBackgroundColor))
                .cornerRadius(4)
            }
            .font(.callout)
            .padding(.top)
        }
        .navigationTitle("Storage")
        .frame(minWidth: 480, idealWidth: 480, maxWidth: 480, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
