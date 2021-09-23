//
//  AccountsView.swift
//  SWIFTUI FIDELITY
//
//  Created by Anthony Harvey on 6/10/21.
//

import SwiftUI

struct AccountsView: View {
    @Binding var showVirtualAssistant: Bool
    
    var body: some View {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(Color("colorForAccountView"))
                        .frame(width: screen.width, height: 90)
                    HStack(alignment: .bottom) {
                        Image(systemName: "triangle.circle.fill")
                            .foregroundColor(.green)
                        Text("Trade + Transact")
                            .bold()
                            .bold()
                            .padding(.trailing)
                        Spacer()
                        
                        ThreeButtonsForTheTop(showVirtualAssistant: $showVirtualAssistant)
                        
                    }.padding()
                }
                List {
                    Group {
                        Text("Porfolio Total").listRowBackground(Color("colorForAccountView"))
                        
                        AccountBlock(nameOfAccount: "All Accounts", accountNumber: "Accounts 2 of 2", amountInAccount: 674_281.11, DayChange: 6_679.29)
                        
                        
                        Text("Investment Accounts").listRowBackground(Color("colorForAccountView"))
                        
                        AccountBlock(nameOfAccount: "INDIVIDUAL", accountNumber: "Z9876966", amountInAccount: 672_033.01, DayChange: 6789.90)
                        
                        Text("Education Accounts").listRowBackground(Color("colorForAccountView"))
                        
                        AccountBlock(nameOfAccount: "UTMA", accountNumber: "Z875653", amountInAccount: 2_248.10, DayChange: -110.61)
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .listRowBackground(Color("colorForAccountView"))
                        .frame(height: 30)
                    HStack {
                        Image(systemName: "creditcard")
                        Text("Manage Debit Cards")
                    }.foregroundColor(.green).padding(.vertical)
                    Rectangle()
                        .foregroundColor(.clear)
                        .listRowBackground(Color("colorForAccountView"))
                        .frame(height: 30)
                    
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Open an Account")
                    }.foregroundColor(.green).padding(.vertical)
                    
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("Show When Accounts are Reported").foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1))).font(.caption).padding()
                            
                            Text("Additional Important Information").foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1))).font(.caption).padding()
                        }
                        Spacer()
                    }.listRowBackground(Color("colorForAccountView"))
                    Button(action: {
                        //Action here
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                            HStack {
                                Image(systemName: "lock")
                                Text("Log Out")
                            }.padding()
                        }
                    }).foregroundColor(Color(#colorLiteral(red: 0.2881821692, green: 0.7473114729, blue: 0.9187006354, alpha: 1))).padding()
                    .padding(.bottom, 100)
                    .listRowBackground(Color("colorForAccountView"))
                }
                Spacer()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//struct AccountsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountsView()
//    }
//}

