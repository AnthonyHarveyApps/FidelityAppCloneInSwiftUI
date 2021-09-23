//
//  WatchlistView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/16/21.
//

import SwiftUI

struct WatchlistView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isList: Bool = true
    @State private var scrollOffset: CGFloat = .zero
    @Binding var showVirtualAssistant: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(width: screen.width, height: 90)
                HStack(alignment: .bottom) {
                    Image(systemName: "triangle.circle.fill")
                        .foregroundColor(.green)
                    Text("Watch List")
                        .bold()
                        .bold()
                        .padding(.trailing)
                    Spacer()
                    
                    ThreeButtonsForTheTop(showVirtualAssistant: $showVirtualAssistant)
                }.padding()
            }
            ScrollView {  // List????
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    HStack {
                        Text("Default Watch List")
                        Button(action: {
                            // select WatchList
                        }, label: {
                            Image(systemName: "arrowtriangle.down.fill")
                        }).foregroundColor(colorScheme == .dark ? .white : .black)
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                isList.toggle()
                            }        
                        }, label: {
                            HStack(spacing: 0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 30, height: 30)
                                        .foregroundColor(isList ? .gray : .black)
                                Image(systemName: "list.dash")
                                    .foregroundColor(.white)
                                }
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 30, height: 30)
                                        .foregroundColor(!isList ? .gray : .black)
                                Image(systemName: "square.grid.2x2.fill")
                                    .foregroundColor(.white)
                                }
                            }
                        }).padding(.horizontal)
                        
                        Button(action: {
                            //  showFeedPreferences = true
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.system(size: 25))
                        }).padding(.horizontal)
                    }
                    
                    if isList {
                        
                        WatchListListView(stocksOnWatchlist: arrayOfStocks)
                        
                    } else {
                        
                        WatchListGridView(stocksOnWatchlist: arrayOfStocks)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: screen.width)
                            .foregroundColor(Color(UIColor.systemBackground))
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Questions?")
                                    .foregroundColor(.green)
                                Text("Text our agents for quick help on your Watch List.").font(.system(size: 10))
                            }
                            Spacer()
                            Button(action: {
                                // chat screen
                            }, label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.gray).opacity(0.2)
                                    Image(systemName: "bubble.left.fill")
                                        .foregroundColor(.green)
                                }
                            }).padding()
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    
                    Text("*Equity Summary Score Provided By StarMine from Refinitiv").font(.system(size: 13)) .foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1))).padding()
                    
                    Text("Tap a security to access full quote details including performance information").font(.system(size: 13)).foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding()
                    
                    Text("Performance data shown represents past performance and is no guarentee of future results. Investment return and principal value will fluctuate, so you may have a gain or loss when shares are sold. Current performance may be higher or lower than quoted.").font(.system(size: 13)).foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding()
                    HStack {
                        Spacer()
                        Button(action: {
                            // log in
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                HStack {
                                    Image(systemName: "lock")
                                    Text("Log In")
                                }.padding()
                            }
                        }).foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1))).padding()
                        .padding(.bottom, 100)
                        Spacer()
                    }
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct WatchlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchlistView(showVirtualAssistant: .constant(false))
//    }
//}

