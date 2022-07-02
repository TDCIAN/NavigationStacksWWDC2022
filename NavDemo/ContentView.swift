//
//  ContentView.swift
//  NavDemo
//
//  Created by JeongminKim on 2022/07/02.
//

import SwiftUI

// Model
struct Company: Identifiable, Hashable {
    var id = UUID()
    let name: String
}

struct Stock: Identifiable, Hashable {
    var id = UUID()
    let ticker: String
}

// View

struct ContentView: View {
    let companies: [Company] = [
        .init(name: "Apple"),
        .init(name: "Facebook"),
        .init(name: "Google"),
        .init(name: "Microsoft"),
        .init(name: "Dell")
    ]
    
    @State var path: [Company] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List(companies) { company in
                    NavigationLink(company.name, value: company)
                }
                .navigationDestination(for: Company.self) { company in
                    VStack {
                        Text(company.name)
                    }
                }
                
                Button("Go back") {
                    path = [
                        companies[1],
                        companies[0],
                        companies[2]
                    ]
                    // popToRootViewController
                }
                .padding(12)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
