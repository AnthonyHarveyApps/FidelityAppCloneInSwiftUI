//
//  FeedView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//




import SwiftUI
let screen: CGRect = UIScreen.main.bounds

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showVirtualAssistant: Bool
    @State var showLogIn: Bool = false
    @State var showFeedPreferences: Bool = false
    @State var date = Date()
    @State var showMarkets: Bool = false
    @State var showStock: Bool = false
    @State var stockToShow: String = ""
    @State var showNews: Bool = false
    @State var zoomedIn: Bool = false
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State private var scrollOffset: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Image(date.description.contains("PM") ? "NY" : "clouds2") // FIX 2021-06-12 17:22:31 +0000
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(zoomedIn ? 1.5 : 1.0)
                .animation(.easeInOut(duration: 10))
                .onReceive(timer) { _ in
                    zoomedIn.toggle()
                }
                .onAppear {
                    zoomedIn.toggle()
                }
            
            VStack {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: screen.width, height: 90)
                    HStack(alignment: .bottom) {
                        Spacer()
                            .frame(width: (screen.width / 4) )
                        Text("FIDELITY")
                            .bold()
                            .foregroundColor(.green)
                            .padding(.horizontal)
                        
                        ThreeButtonsForTheTop(showVirtualAssistant: $showVirtualAssistant)
                        
                    }.padding()
                }.offset(x: 0, y: scrollOffset > -CGFloat.random(in: 90...105) ? 0 : -51)
                
                Spacer()
                
            }.offset(x: 0, y: scrollOffset > -CGFloat.random(in: 90...105) ? 0 : -81)
            .edgesIgnoringSafeArea(.all)
            
            ScrollViewOffset { scrollOffset in
                withAnimation {
                    self.scrollOffset = scrollOffset
                }
            } content: {
                VStack {
                    
                    WelcomeAndFeedPrefButton(date: $date, showFeedPreferences: $showFeedPreferences)
                        .opacity(scrollOffset > -30 ? 1 : 0)
                    
                    LogInButton(showLogIn: $showLogIn)
                    
                    VirtualAssistantButton(showVirtualAssistant: $showVirtualAssistant)
                    
                    USMarketsBlock(showMarkets: $showMarkets, showStock: $showStock, stockToShow: $stockToShow)
                        .padding()
                    
                    IdeasAndNewsBlock(showNews: $showNews, arrayOfStories: arrayOfStories1, blockTitle: "Investing Ideas & Strategies News")
                        .padding(.vertical)
                    
                    IdeasAndNewsBlock(showNews: $showNews, arrayOfStories: arrayOfStories1, blockTitle: "Top News").padding(.vertical)
                    
                    IdeasAndNewsBlock(showNews: $showNews, arrayOfStories: arrayOfStories1, blockTitle: "Information Technology News").padding(.vertical)
                    
                    BullOfTheDayBlock(showStock: $showStock, stockToShow: $stockToShow, stock: DDS)
                    
                    Disclaimer()
                }.padding(.top, 70)
            }.frame(width: screen.width)
            .coordinateSpace(name: "frameLayer") // the new coordinate space!
            .padding(.top)
        }
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView(showVirtualAssistant: .constant(false))
//    }
//}

