//
//  GATTBootKeyboardOutputReport.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Boot Keyboard Output Report
 
 The Boot Keyboard Input Report characteristic is used to transfer fixed format and length Input Report data between a HID Host operating in Boot Protocol Mode and a HID Service corresponding to a boot keyboard.
 
 [Boot Keyboard Output Report](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.boot_keyboard_output_report.xml)
 */
public struct GATTBootKeyboardOutputReport: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .bootKeyboardOutputReport }
    
    public var value: UInt8
    
    public init(value: UInt8) {
        
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(value: data[0])
    }
    
    public var data: Data {
        
        return Data([value])
    }
}

extension GATTBootKeyboardOutputReport: Equatable {
    
    public static func == (lhs: GATTBootKeyboardOutputReport, rhs: GATTBootKeyboardOutputReport) -> Bool {
        
        return lhs.value == rhs.value
    }
}

extension GATTBootKeyboardOutputReport: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}
