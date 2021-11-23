//
//  DownLoads.swift
//  UI-320 (iOS)
//
//  Created by nyannyan0328 on 2021/10/03.
//

import SwiftUI

struct Download: Identifiable {
    var id = UUID().uuidString
    var donwnloads : CGFloat
    var weekDay : String
}


var downloads : [Download] = [

Download(donwnloads: 500, weekDay: "Mon"),
Download(donwnloads: 240, weekDay: "Tue"),
Download(donwnloads: 300 , weekDay: "WED"),
Download(donwnloads: 940, weekDay: "Thu"),
Download(donwnloads: 689, weekDay: "Fri"),
Download(donwnloads: 560, weekDay: "Sat"),
Download(donwnloads: 200, weekDay: "Sun")
]
