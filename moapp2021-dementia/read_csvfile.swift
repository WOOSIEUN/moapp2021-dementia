//
//  read_csvfile.swift
//
//  Created by huiwon on 2021/05/24.
//

import Foundation

class read_csvfile{
    struct Person {
          var centerName: String
          var centerType: String
          var centerAddress: String
          var centerNumber: String
          var centerCity: String
      }

    var people = [Person]()
    var return_nil=["nil"]

    func convertCSVIntoArray() -> Array<Any> {

          //locate the file you want to use
          guard let filepath = Bundle.main.path(forResource: "data", ofType: "csv") else {
              return return_nil
          }

          //convert that file into one long string
          var data = ""
          do {
            data = try String(contentsOfFile: filepath, encoding: .utf8)
          } catch {
              print(error)
              return return_nil
          }

          //now split that string into an array of "rows" of data.  Each row is a string.
          var rows = data.components(separatedBy: "\n")

          //if you have a header row, remove it here
          rows.removeFirst()
          
    //      print(rows)
          //now loop around each row, and split it into each of its columns
          for row in rows {
            //print(row)
              let columns = row.components(separatedBy: ",")
           // print("count: \(columns.count)")
              //check that we have enough columns
              if columns.count == 5 {
                  let centerName = columns[0]
                  let centerType = columns[1]
                  let centerAddress = columns[2]
                  let centerNumber = columns[3]
                  let centerCity = columns[4]

                  let person = Person(centerName: centerName, centerType: centerType, centerAddress: centerAddress, centerNumber: centerNumber, centerCity: centerCity)
                  people.append(person)
        
              }
          }
//        for element in people{
//            print(element)
//        }
        return people
      }

}
