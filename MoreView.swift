//
//  MoreView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import SwiftUI

struct MoreView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var beta: Bool = false
    @State var seeMore: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: screen.width, height: 90)
                    HStack(alignment: .bottom) {
                        Image(systemName: "triangle.circle.fill")
                            .foregroundColor(.green)
                        Text("More")
                            .bold()
                            .bold()
                            .padding(.trailing)
                        Spacer()

                        Button(action: {
                            //
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.system(size: 25))
                        })
                        .padding(.trailing)

                    }.padding()
                }
                List {
                    HStack {
                        Text("Beta trading experience")
                        Image(systemName: "info.circle")
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        Toggle("", isOn: $beta).labelsHidden()
                    }
                    
                    Rectangle()
                        .frame(height: 25)
                        .foregroundColor(Color(UIColor.systemBackground))
                    
                    Group {
                        WithImage(text: "Planning", image: "mappin.and.ellipse")

                        WithImage(text: "Markets", image: "globe")
                        
                        WithImage(text: "Research", image: "magnifyingglass")
                        
                        WithImage(text: "News + Live TV", image: "newspaper")

                        WithImage(text: "Webinars On Demand", image: "play.circle")
                        
                        WithImage(text: "Podcasts", image: "slider.vertical.3")
                        }
                    Rectangle()
                        .frame(height: 25)
                        .foregroundColor(Color(UIColor.systemBackground))
                    HStack {
                        Text("See more")
                        Spacer()
                        Button(action: {
                            seeMore.toggle()
                        }, label: {
                            Image(systemName: !seeMore ? "greaterthan" : "chevron.down")
                        })
                    }
                    if seeMore {
                        Group {
                            WithImage(text: "Alerts", image: "bell")

                            WithImage(text: "Notebook", image: "note.text")
                            
                            WithImage(text: "Learning Center", image: "lightbulb")
                            
                            WithImage(text: "Net Worth", image: "dollarsign.circle")

                            WithImage(text: "Shareholder Q&A Forums", image: "person.3.fill")
                            
                            WithImage(text: "Life Events", image: "map.fill")
                            }
                    }
                    Rectangle()
                        .frame(height: 25)
                        .foregroundColor(Color(UIColor.systemBackground))
                    Group {
                    WithoutImage(text: "Settings & Profile")
                    WithoutImage(text: "Open an Account")
                    WithoutImage(text: "Contact Us")
                    WithoutImage(text: "Find an advisor")
                    WithoutImage(text: "Send Us Feedback")
                    WithoutImage(text: "Legal + Mobile Security")
                    }
                    Rectangle()
                        .frame(height: 25)
                        .foregroundColor(Color(UIColor.systemBackground))
                    HStack {
                        Spacer()
                    Button("Log In") {
                        //
                    } .foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1)))
                        Spacer()
                    }
                }
                Spacer()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//struct MoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoreView()
//    }
//}

