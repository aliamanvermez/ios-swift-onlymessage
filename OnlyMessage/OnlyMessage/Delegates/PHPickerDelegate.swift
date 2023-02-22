//
//  PHPickerDelegate.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 22.02.2023.
//

import Foundation
import PhotosUI
class PHPickerDelegate : NSObject, PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if let result = results.first {
            result.itemProvider.loadFileRepresentation(forTypeIdentifier: "public.image") { (url, error) in
                if let error = error {
                    print("Hata: \(error.localizedDescription)")
                } else if let url = url {
                    do {
                        let imageData = try Data(contentsOf: url)
                        DispatchQueue.main.async {
                            OMSignUpViewController().imageViewProfileImage.image = UIImage(data: imageData)
                        }
                    } catch {
                        print("Hata: \(error.localizedDescription)")
                    }
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
