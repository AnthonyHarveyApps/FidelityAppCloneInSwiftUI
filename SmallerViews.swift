//
//  SmallerViews.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import SwiftUI

struct ScrollViewOffset<Content: View>: View {
  let onOffsetChange: (CGFloat) -> Void
  let content: () -> Content

  init(
    onOffsetChange: @escaping (CGFloat) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onOffsetChange = onOffsetChange
    self.content = content
  }

  var body: some View {
    ScrollView {
      offsetReader
      content()
        .padding(.top, -8)
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }

  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minY
        )
    }
    .frame(height: 0)
  }
}

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct WelcomeAndFeedPrefButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var date: Date
    @Binding var showFeedPreferences: Bool
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                Button(action: {
                    showFeedPreferences = true
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 25))
                })
                .padding(.trailing)
            }.padding()
            
            Text(date.description.contains("PM") ? "Welcome !" : "Good Morning !") // FIX 2021-06-12 17:22:31 +0000
                .font(.system(size: 40))
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}

struct LogInButton: View {
    @Binding var showLogIn: Bool
    var body: some View {
        VStack {
            Button(action: {

                showLogIn = true
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 3)
                        .foregroundColor(Color(#colorLiteral(red: 0.4595050216, green: 0.6081539989, blue: 0.1910475791, alpha: 1)))
                        .frame(width: 300)
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                }
            }).padding()
            
            Text("Log in to see your custom Feed")
                .foregroundColor(.black)
                .shadow(color: .white, radius: 10, x: 0.0, y: 0.0)
                .padding(.bottom)
        }
    }
}

struct VirtualAssistantButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showVirtualAssistant: Bool
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white).opacity(colorScheme == .dark ? 1 : 0.8)
                Text("Get answers and complete your task digitally")
                    .font(.caption)
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screen.width, height: 1)
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                HStack {
                    Image(systemName: "ellipsis.bubble")
                        .font(.system(size: 50))
                    Text("Your Virtual Assistant is available 24/7")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text(">")
                        .padding()
                }.padding()
            }.frame(width: screen.width)
        }.onTapGesture {
            showVirtualAssistant = true
        }
        .popover(isPresented: $showVirtualAssistant) {
            Text("Virtual Assistant Here")
                .font(.headline)
                .padding()
        }
    }
}

struct USMarketsBlock: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showMarkets: Bool
    @Binding var showStock: Bool
    @Binding var stockToShow: String
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white).opacity(colorScheme == .dark ? 1 : 0.8)
                Text("U.S. Markets")
                    .bold()
                    .padding()
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screen.width, height: 1)
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                HStack {
                    Spacer()
                    StockButton(stock: DJI)
                        .onTapGesture {
                            stockToShow = "DJI"
                            showStock = true
                        }
                    Spacer()
                    StockButton(stock: NASDAQ)
                        .onTapGesture {
                            stockToShow = "NASDAQ"
                            showStock = true
                        }
                    Spacer()
                    StockButton(stock: SandP)
                        .onTapGesture {
                            stockToShow = "S & P"
                            showStock = true
                        }
                    Spacer()
                }.padding()
            }.frame(width: screen.width)
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screen.width, height: 1)
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                Text("View Markets")
                    .font(.system(size: 15))
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1)))
                    .padding()
            }
            .onTapGesture {
                showMarkets = true
            }
        }
    }
}

struct StockButton: View {
    let stock: stockInfo
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text(stock.name)
                .foregroundColor(.white)
                .font(.caption2)
            Text(stock.changeTodayAmount > 0 ? "+\(stock.changeTodayAmount, specifier: "%.2f")" : "-\(stock.changeTodayAmount, specifier: "%.2f")")
                .foregroundColor(stock.changeTodayAmount >= 0 ? .green : .red)
            Text(stock.changeTodayPercent > 0 ? "+\(stock.changeTodayPercent, specifier: "%.2f")%" : "-\(stock.changeTodayPercent, specifier: "%.2f")%")
                .foregroundColor(stock.changeTodayPercent >= 0 ? .green : .red)
            Text("\(stock.price, specifier: "%.2f")")
                .foregroundColor(.white)
        }
    }
}

struct IdeasAndNewsBlock: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showNews: Bool
    @State private var showViewMore: Bool = false
    let arrayOfStories: [NewsArticle]
    let blockTitle: String
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white).opacity(colorScheme == .dark ? 1 : 0.8)
                HStack {
                    Spacer()
                    Text(blockTitle)
                        .bold()
                        .padding()
                    Spacer()
                    Button {
                        showViewMore.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                }
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screen.width, height: 0.5)
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                ScrollView(.horizontal) {
                    HStack(spacing: 1) {
                        
                        ForEach(arrayOfStories, id: \.self) { story  in
                            
                            ArticleButton(story: story)
                            
                            
                        }
                    }
                }
                if showViewMore {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(#colorLiteral(red: 0.1946291924, green: 0.2114399672, blue: 0.2339747548, alpha: 1)))
                            .frame(width: screen.width, height: 80)
                        VStack(alignment: .leading) {
                            Button {
                                //
                            } label: {
                                Label("View More News", systemImage: "newspaper")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                            }
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: screen.width, height: 1)
                            Button {
                                //
                            } label: {
                                Label("Select More Topics", systemImage: "newspaper")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                
                            }
                        }
                    }
                }
            }.frame(width: screen.width)
        }.frame(width: screen.width)
        .onTapGesture {
            showNews = true
        }
    }
}

struct ArticleButton: View {
    
    let story: NewsArticle
    var body: some View {
        ZStack {
            Image(story.imageName)
                .resizable()
                .brightness(-0.5)
            
            VStack {
                Spacer()
                Text(story.summary)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text("\(story.source) - \(story.date)")
                    .font(.system(size: 14))
                    .font(.caption)
                    .padding(.bottom)
            }
        }.frame(width: 250, height: 170)
    }
}

struct Disclaimer: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.systemBackground))
            Text("Performance data shown represents past performance and is no guarantee of future results. Investment return and principal value will fluctuate, so you may have a gain or loss when shares are sold. Current performance may be higher or lower than that quoted. Visit Fidelity.com/performance for most recent month-end performance\nFidelity Brokerage Services LLC, Member NYSE, SIPC, 900 Salem Street, Smithfield, RI 02917\n\nBefore investing, consider the funds' investment objectives, risks, charges, and expenses. Contact Fidelity for a prospectus or, if available, a summary prospectus containing this information. Read it carefully.")
                .font(.caption2)
            
        }
        .frame(width: screen.width, height: 200)
    }
}

struct BullOfTheDayBlock: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showStock: Bool
    @Binding var stockToShow: String
    let stock: stockInfo
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white).opacity(colorScheme == .dark ? 1 : 0.8)
                Text("Bull of The Day")
                    .bold()
                    .padding()
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: screen.width, height: 1)
            ZStack {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                VStack {
                    
                    HStack {
                        Image("Bull")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                        VStack {
                            Text(stock.symbol)
                                //.font(.largeTitle)
                                .font(.system(size: 65))
                            Text(stock.name)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Image("Bear")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }

                    HStack {
                        Text(stock.changeTodayAmount > 0 ? "+\(stock.changeTodayAmount, specifier: "%.2f")" : "-\(stock.changeTodayAmount, specifier: "%.2f")")
                            .foregroundColor(stock.changeTodayAmount >= 0 ? .green : .red)
                            .font(.title)
                        Text(stock.changeTodayPercent > 0 ? "+\(stock.changeTodayPercent, specifier: "%.2f")%" : "-\(stock.changeTodayPercent, specifier: "%.2f")%")
                            .foregroundColor(stock.changeTodayPercent >= 0 ? .green : .red)
                            .font(.title)
                        Text("\(stock.price, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .font(.title)
                        
                    }
                    Text("One blockbuster earnings report sent this stock skyrocketing")
                        .font(.caption)
                        .padding(.bottom)
                    
                    Text("DELAYED AS OF 4:10:00 PM ET 06/11/21")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("PROVIDED BY ZACKS")
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1)))
                }
            }.frame(width: screen.width)
            
        }
    }
}

struct ThreeButtonsForTheTop: View {
    @Binding var showVirtualAssistant: Bool
    var body: some View {
        HStack(spacing: 20) {
            
            Button {
                //
            } label: {
                Image(systemName: "dollarsign.square")
                    .foregroundColor(Color(UIColor.label))
            }
            Button {
                showVirtualAssistant = true
            } label: {
                Image(systemName: "ellipsis.bubble")
                    .foregroundColor(Color(UIColor.label))
                
            }
            
            Button {
                //
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(UIColor.label))
            }
        }.frame(width: (screen.width / 4) )
    }
}

struct WithoutImage: View {
    let text: String
    let does: (() -> Void)? = nil
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName: "greaterthan")
            })
        }
    }
}

struct WithImage: View {
    let text: String
    let image: String
    let does: (() -> Void)? = nil
    var body: some View {
        HStack {
            Image(systemName: image)
            //                  .foregroundColor(.green)
            Text(text)
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName: "greaterthan")
            })
        }
    }
}

struct AccountBlock: View {
    
    let nameOfAccount: String
    let accountNumber: String
    let amountInAccount: Double
    let DayChange: Double
    
    var body: some View {
        VStack {
            HStack {
                Text(nameOfAccount)
                    .font(.title3)
                Spacer()
                Text("\(amountInAccount, specifier: "%.2f")")
                    .font(.title3)
            }
            .padding(.top)
            
            
            HStack {
                Text(accountNumber)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text("Day Chg $\(DayChange, specifier: "%.2f") (\((DayChange / amountInAccount) * 100, specifier: "%.2f")%)")
                    .foregroundColor(DayChange < 0 ? .red : .green)
                
            }
            
            .padding(.bottom)
            
        }
    }
}
