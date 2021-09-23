//
//  FakeData.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import Foundation

struct stockInfo: Hashable {
    var name: String
    var symbol: String
    var price: Double
    var changeTodayAmount: Double
    var changeTodayPercent: Double
    var dayTrend: String?
    var volume: Int
}

var DJI = stockInfo(name: "DOW", symbol: "DJI", price: 34479.60, changeTodayAmount: 13.36, changeTodayPercent: 0.04, volume: 76845)

var NASDAQ = stockInfo(name: "NASDAQ", symbol: "IXIC", price: 14069, changeTodayAmount: 49.09, changeTodayPercent: 0.35, volume: 876589)

var SandP = stockInfo(name: "S&P 500", symbol: "SPX", price: 4247.44, changeTodayAmount: -8.26, changeTodayPercent: -0.19, volume: 27566)

var DDS = stockInfo(name: "DILLARDS INC", symbol: "DDS", price: 168.98, changeTodayAmount: 2.43, changeTodayPercent: 1.46, volume: 54324)

var FAK = stockInfo(name: "FakeStock", symbol: "FAK", price: 169.58, changeTodayAmount: 9.43, changeTodayPercent: 5.56, volume: 76876)

var PHO = stockInfo(name: "PhonyStock", symbol: "PHO", price: 211.22, changeTodayAmount: -22.7, changeTodayPercent: -10.74, volume: 87567)

var DDS2 = stockInfo(name: "My Fake Stock", symbol: "MFS", price: 879.90, changeTodayAmount: 2.43, changeTodayPercent: 0.01, volume: 54324)

var arrayOfStocks = [DJI, NASDAQ, SandP, DDS, FAK, PHO, DDS2]

struct NewsArticle: Hashable {
    var imageName: String
    var source: String
    var date: String
    var summary: String
}

var story1 = NewsArticle(imageName: "calc", source: "MT Newswires", date: "06/11/2021", summary: "Canada Markets Summary")
var story2 = NewsArticle(imageName: "cash", source: "MT Newswires", date: "06/09/2021", summary: "US Stocks Indicated to Close Lower as Investors Await Crucial Inflation Data")
var story3 = NewsArticle(imageName: "chess", source: "MT Newswires", date: "06/08/2021", summary: "Here is some additional Fake Information to try out in this section")
var story4 = NewsArticle(imageName: "cashCase", source: "MT Newswires", date: "06/08/2021", summary: "Here is some additional Fake Information to try out in this section. This time with a longer text")

var arrayOfStories1 = [story1, story2, story3, story4]
