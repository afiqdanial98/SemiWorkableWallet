//
//  ContentView.swift
//  Ewallet
//
//  Created by Kavsoft on 27/02/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//
import CodeScanner
import SwiftUI
import CoreData


struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home : View {
    
    @State var show = false
    
    @State private var isShowingScanner = false
    var body : some View{
        
        ZStack{
            VStack(spacing: 20){
                
                HStack(spacing: 15){
                    ///GeometryReader{  geo in
                    Image("ISO").renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        ///.position(x:200,y:200)
                       
                    
                    Text("mididle").font(.title)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("menu").renderingMode(.original)
                    }
                }
            ///}
                HStack{
                    
                    Text("Account Overview").foregroundColor(Color.white)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }.padding(.top,18)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        
                        Text("0-0").font(.title)
                            .foregroundColor(Color.white)
                        
                        Text("")
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    
                    Button("Top Up"
                        
                    ) {
                        
                        ///Image("menu").renderingMode(.none)
                    }
                }
                .padding(20)
                .background(Color.orange.opacity(1))
                .cornerRadius(20)
                .padding(.top)
                
                HStack{
                    
                    Text("Send Money").foregroundColor(Color.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Button(action: {
                        self.isShowingScanner = true
                        
                    }) {
                        
                        Image(systemName: "qrcode.viewfinder")
                        Text("SCAN")
                    }
                    
                        
                }.padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 15){
                    
                        Button(action: {
                            //NavigationLink(destination: AlbumDetailView(album: album)){

                            
                            
                        }) {
                            
                            Image("add").renderingMode(.original)
                        }
                        
                        ForEach(names,id: \.self){i in
                            
                            VStack(spacing: 10){
                                
                                
                                Image("person")
                                
                                Text(i).foregroundColor(Color.black)
                                
                            }.frame(width: 100)
                            .padding(.vertical)
                            .background(Color.gray.opacity(1))
                            .cornerRadius(10)
                        }
                    }.padding(.leading)
                    
                }.padding(.top,18)
                
                
                HStack{
                    
                    Text("Services").foregroundColor(Color.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("filter").renderingMode(.original)
                    }
                    
                }.padding(.top)
                
                Row1().padding(.top)
                
                Row2()
                
                Spacer(minLength: 0)
                
            }.padding([.horizontal,.top])
            
            VStack{
                
                Spacer()
                
                Menu().offset(y: self.show ?  (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! : UIScreen.main.bounds.height)
                
            }.background(Color.red.opacity(self.show ? 0.5 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    
                    self.show.toggle()
            })
            
        }.animation(.default)
        .background(Color.black.opacity(0.05)) //background color
    }
}

struct Row1 : View {
    
    var body : some View{
        
        HStack(alignment: .top){
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r11").renderingMode(.original)
                        
                    }.padding()
                        .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text("Send Money")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r12").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text("Receive Money")
                    .frame(width: 55)
                    .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r13").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r14").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct Row2 : View {
    
    var body : some View{
        
        HStack(alignment: .top){
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r21").renderingMode(.original)
                        
                    }.padding()
                        .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r22").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r23").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r24").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    
                    Text(" ")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(1))
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}


struct Menu : View {
    
    var body : some View{
        NavigationView{
            VStack(spacing: 20){
                
                Button(action: {
                    
                }) {
                    
                    HStack{
                        
                        Text("Home")
                        
                        Spacer()
                        
                        Image("arrow")
                        
                    }.foregroundColor(.yellow)
                    
                }.padding()
                .background(Color.green.opacity(0.5))
                .cornerRadius(10)
                
                Button(action: {
                    
                    
                }) {
                    
                    HStack{
                        Text("Profile")
                        
                        Spacer()
                        
                        Image("arrow")
                        
                    }.foregroundColor(.yellow)
                    
                }.padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
                
                Button(action: {
                    
                }) {
                    
                    HStack{
                        
                        Text("Transactions")
                        
                        Spacer()
                        
                        Image("arrow")
                        
                    }.foregroundColor(.yellow)
                    
                }.padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
                
                Button(action: {
                    
                }) {
                    
                    HStack{
                        
                        Text("Accounts")
                        
                        Spacer()
                        
                        Image("arrow")
                        
                    }.foregroundColor(.yellow)
                    
                }.padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
                
                Button(action: {
                    
                }) {
                    
                    HStack{
                        
                        Text("Settings")
                        
                        Spacer()
                        
                        Image("arrow")
                        
                    }.foregroundColor(.yellow)
                    
                }.padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
                
                Button(action: {
                    
                }) {
                    
                    HStack{
                        
                        Text("Logout")
                        
                        Spacer()
                        
                        Image("out")
                        
                    }.foregroundColor(Color.orange)
                    
                }.padding()
                .background(Color.red.opacity(0.5))
                .cornerRadius(10)
            }
            .padding()
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.black.opacity(10))
            .cornerRadius(25)
        }
    }
}
var names = ["A","B","C","D"]

