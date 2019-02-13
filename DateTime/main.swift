//
//  main.swift
//  DateTime
//
//  Created by Ulrich Baumeister on 08.02.19.
//  Copyright © 2019 Ulrich Baumeister. All rights reserved.
//

import Foundation

var d1 = CalcDays(firstDate: "08.02.2019", secondDate: "08.03.2019")

let t1 = d1.daysSeconds() // ergibt eine Ganzzahl
print(Int(t1))

let t2 = d1.daysComps() // ergibt eine Ganzzahl + "Tage"
print(t2)

let t3 = d1.daysDate() // ergibt eine Ganzzahl + "Tage"
print(t3)
