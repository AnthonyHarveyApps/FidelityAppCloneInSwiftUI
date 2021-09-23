//
//  TransactView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import SwiftUI

struct TransactView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showVirtualAssistant: Bool
    
    var body: some View {
        UITableView.appearance().backgroundColor = .clear
             UITableViewCell.appearance().backgroundColor = .clear
       return ZStack {
        Color("colorForAccountView").edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: screen.width, height: 90)
                    HStack(alignment: .bottom) {
                        Image(systemName: "triangle.circle.fill")
                            .foregroundColor(.green)
                        Text("Trade + Transact")
                            .bold()
                            .bold()
                            .padding(.trailing)
                        Spacer()
                        
                        Button {
                            showVirtualAssistant = true
                        } label: {
                            Image(systemName: "ellipsis.bubble")
                                .foregroundColor(Color(UIColor.label))
                            
                        }
                        
                    }.padding()
                }
                List {
                    
                    HStack {
                        Image(systemName: "arrow.left.arrow.right")
                            .foregroundColor(.green)
                        Text("Trade")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    HStack {
                        Image(systemName: "newspaper.fill")
                            .foregroundColor(.green)
                        Text("Buy New Issue CDs")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    HStack {
                        Image(systemName: "arrow.left.arrow.right.circle")
                            .foregroundColor(.green)
                        Text("Transfer")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    
                    
                    HStack {
                        Image(systemName: "camera")
                            .foregroundColor(.green)
                        Text("Deposit Checks")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    
                    HStack {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.green)
                        Text("Pay Bills")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    
                    HStack {
                        Image(systemName: "wallet.pass")
                            .foregroundColor(.green)
                        HStack(spacing: 0) {
                        Text("Send Money with ")
                            Text("PAYPAL")
                                .bold()
                        }
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    //  Divider().background(Color.clear)
                    Rectangle()
                        .foregroundColor(Color("colorForAccountView"))
                      //  .background(Color.gray)
                        .frame(height: 30)
                       // .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        Text("Activity and Status")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                    HStack {
                        Text("Manage Scheduled Tranfers and Investments")
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "greaterthan")
                        })
                    }
                    
                }
                Spacer()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//struct TransactView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactView()
//    }
//}
