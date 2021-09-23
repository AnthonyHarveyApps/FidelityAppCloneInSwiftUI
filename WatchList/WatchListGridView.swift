//
//  WatchListGridView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/21/21.
//

import SwiftUI

struct WatchListGridView: View {
    var stocksOnWatchlist: [stockInfo]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(stocksOnWatchlist, id: \.self) { stock in
                ZStack {
                RoundedRectangle(cornerRadius: 8)
                   // .frame(width: 100, height: 80)
                    .foregroundColor(stock.changeTodayPercent >= 0 ? .green : .red).opacity(0.6)
                
                    VStack(alignment: .center) {
                        Text(stock.symbol)
                            .bold()
                            .font(.caption)
                        Text("\(stock.price, specifier: "%.2f")")
                            .font(.caption)
                        Text("\(stock.changeTodayPercent, specifier: "%.2f") %")
                            .font(.caption)
                    }.padding()
                
            
                }
            }
            
            ZStack {
            RoundedRectangle(cornerRadius: 8)
               // .frame(width: 100, height: 80)
                .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [4], dashPhase: 4))
            
                Image(systemName: "plus").padding()
            
        
            }.onTapGesture {
                // add to watchlist
            }
            
            
            
        }
            
            
        
    }
}

struct WatchListGridView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListGridView(stocksOnWatchlist: arrayOfStocks)
    }
}
