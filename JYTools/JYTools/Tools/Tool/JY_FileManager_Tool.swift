//
//  JY_FileManager_Tool.swift
//  JYTools
//
//  Created by JYYQLin on 2024/10/13.
//

import UIKit
import Foundation

public class JY_FileManager_Tool {
    
    public static func yq_save_image_to_local(image: UIImage, imageName: String, directory: JY_FileManager_Directory = .document) {
        
        guard let path = FileManager.SearchPathDirectory(rawValue: UInt(directory.rawValue)) else {
            return
        }
        
        guard let documentsDirectory = FileManager.default.urls(for: path, in: .userDomainMask).first else { return }
        
        let fileURL = documentsDirectory.appendingPathComponent(imageName)
        
        if let data = image.pngData() {
            try? data.write(to: fileURL, options: .atomic)
        }
    }
    
    public static func yq_get_image_from_local(imageName: String, directory: JY_FileManager_Directory = .document) -> UIImage? {
        
        guard let path = FileManager.SearchPathDirectory(rawValue: UInt(directory.rawValue)) else {
            return nil
        }
        
        guard let documentsDirectory = FileManager.default.urls(for: path, in: .userDomainMask).first else { return nil }
        
        let fileURL = documentsDirectory.appendingPathComponent(imageName)
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
            return nil
        }
        
    }
}

public enum JY_FileManager_Directory: Int {
    case document = 9
    case library = 5
    case caches = 13
}
