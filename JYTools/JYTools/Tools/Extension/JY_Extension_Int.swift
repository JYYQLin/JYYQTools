//
//  JY_Extension_Int.swift
//  JYTools
//
//  Created by JYYQLin on 2024/10/13.
//

import UIKit

extension Int {
    public func yq_to_unitString() -> String {
        let numABS = abs(self)
        let sign = (self < 0) ? "-" : ""

        switch numABS {
        case 1_0000...:
            let formatted = Double(numABS) / 1_0000
            return "\(sign)\(formatted.yq_format(f: ".2"))w"
        case 1_000...:
            let formatted = Double(numABS) / 1_000
            return "\(sign)\(formatted.yq_format(f: ".2"))k"
        default:
            return "\(self)"
        }
    }
}

extension Double {
    func yq_format(f: String) -> String {
         return String(format: "%\(f)f", self)
     }
}


//extension Int {
//    public func yq_to_unitString() -> String {
//        if self > 1000 && self < 10000 {
//            return String(format: "%.1f", Double(self) / 1000.0) + "k"
//        }else if self > 10000 {
//            let count = Double(self) / 10000.0
//            return String(format: "%.1f", count) + "w"
//        }else{
//            return "\(self)"
//        }
//    }
//}
