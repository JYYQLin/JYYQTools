//
//  JY_Date_Tool.swift
//  JYTools
//
//  Created by JYYQLin on 2024/10/13.
//

import UIKit

public class JY_Date_Tool {
    /** 转为（天，时，分，秒）的格式 */
    public static func yq_time_interval_since_now(to futureTimestamp: TimeInterval) -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let currentDate = Date()
        let futureDate = Date(timeIntervalSince1970: futureTimestamp)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: futureDate)
        
        guard let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second else {
            return (0, 0, 0, 0)
        }
        
        return (days <= 0 ? 0 : days, hours <= 0 ? 0 : hours, minutes <= 0 ? 0 : minutes, seconds <= 0 ? 0 : seconds)
    }
}

extension Int {
    /** 转为（天，时，分，秒）的格式 */
    public func yq_time_interval_since_now() -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
     
        return JY_Date_Tool.yq_time_interval_since_now(to: TimeInterval(self))
    }
}

extension TimeInterval {
    /** 转为（天，时，分，秒）的格式 */
    public func yq_time_interval_since_now() -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
     
        return JY_Date_Tool.yq_time_interval_since_now(to: self)
    }
}


public class JY_Time_Tool {
    public static func timeAgoSinceDate(_ timestamp: TimeInterval, _ date: NSDate, currentDate: NSDate, numericDates: Bool) -> String {
        let calendar = NSCalendar.current
        let now = currentDate
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year, .second], from: earliest, to: latest as Date)

        if (components.year! >= 2) {
            
            return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "yyyy-MM-dd HH:mm")
            
        } else if (components.year! >= 1){
            if (numericDates){
                return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "MM-dd HH:mm")
            } else {
                return "Last year".yq_localized(tableName: "JY_Time_Tool")
            }
        } else if (components.month! >= 2) {
            return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "MM-dd HH:mm")
        } else if (components.month! >= 1){
            if (numericDates){
                return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "MM-dd HH:mm")
            } else {
                return "Last month".yq_localized(tableName: "JY_Time_Tool")
            }
        } else if (components.weekOfYear! >= 2) {
            return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "MM-dd HH:mm")
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return JY_Time_Tool.yq_conversion_MMDD(time: timestamp, dateFormat: "MM-dd HH:mm")
            } else {
                return "Last Week".yq_localized(tableName: "JY_Time_Tool")
            }
        } else if (components.day! >= 2) {
            return "\(components.day!)" + "Days ago".yq_localized(tableName: "JY_Time_Tool")
        } else if (components.day! >= 1){
            if (numericDates){
                return "1" + "Day ago".yq_localized(tableName: "JY_Time_Tool")
            } else {
                return "Yesterday".yq_localized(tableName: "JY_Time_Tool")
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!)" + "Hours ago".yq_localized(tableName: "JY_Time_Tool")
        } else if (components.hour! >= 1){
            return "1" + "Hour ago".yq_localized(tableName: "JY_Time_Tool")
        } else if (components.minute! >= 2) {
            return "\(components.minute!)" + "Minutes ago".yq_localized(tableName: "JY_Time_Tool")
        } else if (components.minute! >= 1){
            return "1" + "Minute ago".yq_localized(tableName: "JY_Time_Tool")
        } else if (components.second! >= 3) {
            return "\(components.second!)" + "Seconds ago".yq_localized(tableName: "JY_Time_Tool")
        } else {
            return "Just now".yq_localized(tableName: "JY_Time_Tool")
        }
    }

    // 使用Unix时间戳转换成指定格式的方法
    public static func yq_convert_timestamp_to_readableString(_ timestamp: TimeInterval) -> String {
        let date = NSDate(timeIntervalSince1970: timestamp)
        let now = NSDate()
        return timeAgoSinceDate(timestamp, date, currentDate: now, numericDates: true)
    }

}

extension JY_Time_Tool {
    public static func yq_conversion_MMDD(time: TimeInterval, dateFormat: String = "MM-dd") -> String {
        // 1.创建时间格式化对象
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en")
        fmt.dateFormat = dateFormat
        
        let date = Date(timeIntervalSince1970: time)
        
        let timeStr = fmt.string(from: date)
        return timeStr
    }
}
