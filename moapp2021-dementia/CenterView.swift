//
//  CenterView.swift
//
//  Created by huiwon on 2021/05/24.
//

import SwiftUI

//struct CenterSearch {
//      var Name: String
//      var C_Type: String
//      var Address: String
//      var Number: String
//      var City: String
//  }


struct CenterView: View {
//    var csv_content: File.Person

    var csv_content : read_csvfile
  //  var message: String=""
    var cities=["강원도","경기도","경상남도","경상북도","광주","대구","대전","부산","서울","세종",
    "울산", "인천","전라남도","전라북도","제주","충청남도","충청북도"]
    @State var selectedcity=0
    
//    let urlString : NSURL = NSURL(string: "tel://010-1111-2222")!
//
   // let csvfile = read_csvfile()
    var body: some View {
        
        
        
        
        
        
        HStack{
        //NavigationView {
            Form{
                Section{
                    Text("지역을 선택하세요")
                        .font(.system(size:25))
                    Picker(selection: $selectedcity, label:Text("시도선택").font(.system(size:25))) {
                        ForEach(0 ..< cities.count) { index in
                             Text(self.cities[index]).tag(index)
                                .font(.system(size:50))
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
            }
            .frame(width: 300)
            
            
           VStack(alignment: .leading) {
                ScrollView{
                    LazyVStack(alignment: .leading){
                        
                        ForEach(0..<centerlistlen){ i in
                            if csv_content.people[i].centerCity.contains(cities[selectedcity]){
                                
                                Text(name(selectcity: i))
                                    .bold()
                                    .font(.system(size:35))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 10)
                                    .padding(.top, 20)
                               
                                Text(ctype(selectcity: i))
                                    .font(.system(size:30))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 10)
                                Text(address(selectcity: i))
                                    .font(.system(size:30))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 10)
                                Button(action: {
                                    calling(number: number(selectcity: i))
                                }){
                                    Text(number(selectcity: i))
                                        .font(.system(size:30))
                                        .padding(.leading, 20)
                                        .padding(.bottom, 20)
                                }
                                Spacer()
                                Divider()
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    var centerlistlen: Int{
        _=csv_content.convertCSVIntoArray()
        let list_len=csv_content.people.count
       // print(selectedcity)
        return list_len
    }
    
    func name(selectcity : Int) -> String{
        //let list_content=csv_content.convertCSVIntoArray()
        _=csv_content.convertCSVIntoArray()
        return "\(csv_content.people[selectcity].centerName)"
    }
    
    func ctype(selectcity : Int) -> String{
        _=csv_content.convertCSVIntoArray()
        return "\(csv_content.people[selectcity].centerType)"
    }
    func address(selectcity : Int) -> String{
        _=csv_content.convertCSVIntoArray()
        return "\(csv_content.people[selectcity].centerAddress)"
    }
    func number(selectcity : Int) -> String{
        _=csv_content.convertCSVIntoArray()
        return "\(csv_content.people[selectcity].centerNumber)"
    }
//    func callNumber(phoneNumber : String){
//        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
//            let application:UIApplication = UIApplication.shared
//            let
//    }
    
}
