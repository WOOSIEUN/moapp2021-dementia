//
//  call_center.swift
//  moapp2021-dementia
//
//  Created by huiwon on 2021/06/09.
//

import UIKit

func calling(number : String){
    if let url = NSURL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url as URL) {
      UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}
