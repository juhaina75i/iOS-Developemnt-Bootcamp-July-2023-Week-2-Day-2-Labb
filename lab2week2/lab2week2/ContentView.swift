//
//  ContentView.swift
//  lab2week2
//
//  Created by Juhaina on 13/01/1445 AH.
//
import SwiftUI
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let categories: Array<String> = [
        "Discover",
        "⚽️Sports",
        "🎷Music",
        "🎭Shows"
    ]
    
    let cards: Array<CardData> = Array(
        repeating: CardData(
            title: "Title",
            subtitle: "Description",
            price: 10,
            asyncImage: "https://source.unsplash.com/200x200/?[sport]"
        ),
        count: 10
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Riyadh City")
                    .font(.system(.largeTitle))
                HStack {
                    Image(systemName: "magnifyingglass").padding(8)
                                   TextField("Search", text: .constant("")).frame(height: 40).cornerRadius(15)
                                   Spacer()
                }
                ScrollView(.horizontal){
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white, lineWidth:3))
                                .background(Color.pink.opacity(0.09))
                           
                                .cornerRadius(50)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                ZStack {
                    AsyncImage(url: URL(string: "https://source.unsplash.com/200x200/?[cities]")){ result in
                        if let image = result.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .clipped()
                        } else {
                            Rectangle()
                                .fill(Color.black.opacity(0.1))
                        }
                    }
                    VStack {
                        Spacer()
                        Text("NO Pelicans @ BRK Nets")
                        Text("Wed 10/19 • 7:30 PM • $33")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                }
                .padding()
                .frame(height: 200)
                // MARK: Popular Cards
                HStack {
                    Text("Popular")
                    Spacer()
                    
                    NavigationLink {
                       
                               Text("Hello, Juhaina!")
                    } label: {
                        Text("See All >")
                    }
                }
                .padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(cards) { card in
                            ZStack {
                                AsyncImage(url: URL(string: card.asyncImage)){ result in
                                    if let image = result.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 150)
                                            .clipped()
                                            .cornerRadius(10)
                                    } else {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.1))
                                    }
                                }
                                
                                VStack {
                                    Spacer()
                                    Text(card.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack {
                                        Text(card.subtitle)
                                        Spacer()
                                        Text(card.price.description)
                                    }
                                }
                                .padding()
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 150)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .preferredColorScheme(colorScheme)
        }
    }
}
