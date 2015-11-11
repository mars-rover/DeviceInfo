//
//  DeviceInfo.swift
//  AWiFi
//
//  Created by A on 15/10/12.
//  Copyright © 2015年 A. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

struct DeviceInfo {

    func getDeviceModel() -> String {
        let name = UnsafeMutablePointer<utsname>.alloc(1)
        uname(name)
        let machine = withUnsafePointer(&name.memory.machine, { (ptr) -> String? in
            let int8Ptr = unsafeBitCast(ptr, UnsafePointer<Int8>.self)
            return String.fromCString(int8Ptr)
        })
        name.dealloc(1)
        var deviceType: String = ""
        if let m = machine {
            switch m {
                // iPhones
            case "iPhone1,1":
                deviceType = "iPhone 2G (A1203)"
            case "iPhone1,2":
                deviceType = "iPhone 3G (A1241/A1324)"
            case "iPhone2,1":
                deviceType = "iPhone 3GS (A1303/A1325)"
            case "iPhone3,1":
                deviceType = "iPhone 4 (A1332)"
            case "iPhone3,2":
                deviceType = "iPhone 4 (A1332)"
            case "iPhone3,3":
                deviceType = "iPhone 4 (A1349)"
            case "iPhone4,1":
                deviceType = "iPhone 4S (A1387/A1431)"
            case "iPhone5,1":
                deviceType = "iPhone 5 (A1428)"
            case "iPhone5,2":
                deviceType = "iPhone 5 (A1429/A1442)"
            case "iPhone5,3":
                deviceType = "iPhone 5C (A1456/A1532)"
            case "iPhone5,4":
                deviceType = "iPhone 5C (A1507/A1516/A1526/A1529)"
            case "iPhone6,1":
                deviceType = "iPhone 5C (A1453/A1533)"
            case "iPhone6,2":
                deviceType = "iPhone 5S (A1457/A1518/A1528/A1530)"
            case "iPhone7,1":
                deviceType = "iPhone 6 Plus (A1522/A1524)"
            case "iPhone7,2":
                deviceType = "iPhone 6 (A1549/A1586)"
                
                // iPods
            case "iPod1,1":
                deviceType = "iPod Touch 1G (A1213)"
            case "iPod2,1":
                deviceType = "iPod Touch 2G (A1288)"
            case "iPod3,1":
                deviceType = "iPod Touch 3G (A1318)"
            case "iPod4,1":
                deviceType = "iPod Touch 4G (A1367)"
            case "iPod5,1":
                deviceType = "iPod Touch 5G (A1421/A1509)"
                
                // iPads
            case "iPad1,1":
                deviceType = "iPad 1G (A1219/A1337)"
            case "iPad2,1":
                deviceType = "iPad 2 (A1395)"
            case "iPad2,2":
                deviceType = "iPad 2 (A1396)"
            case "iPad2,3":
                deviceType = "iPad 2 (A1397)"
            case "iPad2,4":
                deviceType = "iPad 2 (A1395+New Chip)"
            case "iPad2,5":
                deviceType = "iPad Mini 1G (A1432)"
            case "iPad2,6":
                deviceType = "iPad Mini 1G (A1454)"
            case "iPad2,7":
                deviceType = "iPad Mini 1G (A1455)"
            case "iPad3,1":
                deviceType = "iPad 3 (A1416)"
            case "iPad3,2":
                deviceType = "iPad 3 (A1403)"
            case "iPad3,3":
                deviceType = "iPad 3 (A1430)"
            case "iPad3,4":
                deviceType = "iPad 4 (A1458)"
            case "iPad3,5":
                deviceType = "iPad 4 (A1459)"
            case "iPad3,6":
                deviceType = "iPad 4 (A1460)"
            case "iPad4,1":
                deviceType = "iPad Air (A1474)"
            case "iPad4,2":
                deviceType = "iPad Air (A1475)"
            case "iPad4,3":
                deviceType = "iPad Air (A1476)"
            case "iPad4,4":
                deviceType = "iPad Mini 2G (A1489)"
            case "iPad4,5":
                deviceType = "iPad Mini 2G (A1490)"
            case "iPad4,6":
                deviceType = "iPad Mini 2G (A1491)"
                
                // Simulators
            case "i386":
                deviceType = "iPhone Simulator 32Bit"
            case "x86_64":
                deviceType = "iPhone Simulator 64Bit"
                
                // 新机器等待更新列表
            default:
                deviceType = "watting to update"
            }
        }
        return deviceType
    }
    
    func getDeviceTypeOn456() -> Int {
        switch getDeviceModel() {
        case "iPhone 4 (A1332)", "iPhone 4 (A1332)", "iPhone 4 (A1349)", "iPhone 4S (A1387/A1431)":
            return 4
        case "iPhone 5 (A1428)", "iPhone 5 (A1429/A1442)", "iPhone 5C (A1456/A1532)", "iPhone 5C (A1507/A1516/A1526/A1529)",
            "iPhone 5C (A1453/A1533)", "iPhone 5S (A1457/A1518/A1528/A1530)":
            return 5
        case "iPhone 6 Plus (A1522/A1524)", "iPhone 6 (A1549/A1586)":
            return 6
        default:
            return 4
        }
    }
    
    func getSystemVersion() -> String {
        return UIDevice.currentDevice().systemVersion
    }
    
    func getIdfv() -> String? {
        return UIDevice.currentDevice().identifierForVendor?.UUIDString
    }
}