//
//  TryThisScroll.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/19/21.
//

import SwiftUI

struct WatchListListView: View {
    var stocksOnWatchlist: [stockInfo]
    var body: some View {
        ScrollView {
                HStack {
                    
                    LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {

                        
//                        Section(header:  Text("Symbol")
//                                    .frame(width: 80, height: 60, alignment: .leading)) {
                        
                        Text("Symbol")
                            .frame(width: 80, height: 60, alignment: .leading)
                        
                        Rectangle()
                            .frame(height:0.2)
                        //   Divider()
                        
                        ForEach(stocksOnWatchlist, id: \.self) { stock in
                            VStack(alignment: .leading) {
                                Text(stock.symbol)
                                
                                Text(stock.name)
                                    .font(.system(size: 11))
                                    .truncationMode(.tail)
                            }.frame(width: 80, height: 63, alignment: .leading)
                            Rectangle()
                                .frame(height: 0.2)
                        }
                   // }
                        
                        
                        
                        
                    }.frame(width: 80, alignment: .leading)
                    .padding(.leading)
                    
                    
                    Rectangle()
                        .frame(width:0.5, height: 1 + (91 * CGFloat(stocksOnWatchlist.count)))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                            Section(header: TopLineWithHeaders(scrollOffset: .constant(0)).background(Color(UIColor.systemBackground))) {
                              //  Divider()
                                Rectangle()
                                    .frame(height: 0.2)
                                ForEach(stocksOnWatchlist, id: \.self) { stock in
                                    Rectangle()
                                        .frame(height: 0.2)
                                    HStack {
                                        Group {
                                            
                                        Text("\(stock.price, specifier: "%.2f")")
                                            .frame(width: 90, height: 60, alignment: .leading)
                                            
                                        Text("\(stock.changeTodayAmount, specifier: "%.2f")")
                                            .frame(width: 90, height: 60, alignment: .leading)
                                            .foregroundColor(stock.changeTodayAmount >= 0 ? .green : .red)
                                            
                                        Text("\(stock.changeTodayPercent, specifier: "%.2f") %")
                                            .frame(width: 90, height: 60, alignment: .leading)
                                            .foregroundColor(stock.changeTodayPercent >= 0 ? .green : .red)
                                            
                                        Text("Day Trend")
                                            .frame(width: 90, height: 60, alignment: .leading)
                                            
                                        Text("\(stock.volume)")
                                            .frame(width: 90, height: 60, alignment: .leading)
                                      
                                    }
                                        Group {
                                            
                                            Image(systemName: "lock")
                                                .frame(width: 200, height: 60, alignment: .leading)
                                            
                                            Image(systemName: "lock")
                                                .frame(width: 90, height: 60, alignment: .leading)
           
                                            Text("--")
                                                .frame(width: 180, height: 60, alignment: .leading)
                                           
                                            Text("--")
                                                .frame(width: 180, height: 60, alignment: .leading)

                                        }
                                        Group {
                                                
                                            Text("--")
                                                .frame(width: 180, height: 60, alignment: .leading)

                                            Text("--")
                                                .frame(width: 180, height: 60, alignment: .leading)

                                            Text("52 Week Range")
                                                .frame(width: 180, height: 60, alignment: .leading)

                                        }
                                    }
                                    
//                                    Rectangle()
//                                        .frame(height: 0.2)
                                } //HERE
                            }
                            
                        }
                        
                    }
                    
                }
        }
    }
}




struct TopLineWithHeaders: View {
    @Binding var scrollOffset: CGFloat
    var body: some View {
        HStack {
                
            ScrollView(.horizontal) {
                
                HStack {
                    Text("Last Price")
                        .frame(width: 90, height: 60, alignment: .leading)
                    
                    Text("Change")
                        .frame(width: 90, height: 60, alignment: .leading)
                    
                    Text("% Change")
                        .frame(width: 90, height: 60, alignment: .leading)
                    
                    Text("Day Trend")
                        .frame(width: 90, height: 60, alignment: .leading)
                    
                    Text("Volume")
                        .frame(width: 90, height: 60, alignment: .leading)
                    
                    Group {
                        Text("Equity Summary Score")
                            .frame(width: 200, height: 60, alignment: .leading)
                        
                        Text("Notes")
                            .frame(width: 90, height: 60, alignment: .leading)
                        
                        Text("% Today's Gain/Loss")
                            .frame(width: 180, height: 60, alignment: .leading)
                        
                        Text("Today's Gain/Loss")
                            .frame(width: 180, height: 60, alignment: .leading)
                        
                        Text("Total Gain/Loss")
                            .frame(width: 180, height: 60, alignment: .leading)
                        
                        Text("% Total Gain/Loss")
                            .frame(width: 180, height: 60, alignment: .leading)
                        
                        Text("52 Week Range")
                            .frame(width: 180, height: 60, alignment: .leading)
                    }
                }
            }.frame(height: 60)
        }
    }
}
