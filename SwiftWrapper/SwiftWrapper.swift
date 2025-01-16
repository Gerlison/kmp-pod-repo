import UIKit
import Foundation
import DocumentDetector

@objcMembers
public class CafDocumentDetector : NSObject, DocumentDetectorControllerDelegate {
    
    var documentDetector: DocumentDetectorSdk
    
    public init(token: String) {
        self.documentDetector = DocumentDetectorSdk
            .CafBuilder(mobileToken: token)
            .enableMultiLanguage(true)
            .setDocumentCaptureFlow(flow :[
              DocumentDetectorStep(document: CafDocument.CNH_FRONT),
              DocumentDetectorStep(document: CafDocument.CNH_BACK)
            ])
            .build()
    }
    
    public func getController() -> DocumentDetectorController {
        var controller = DocumentDetectorController(documentDetector: self.documentDetector)
        controller.documentDetectorDelegate = self
        
        return controller
    }
    
    public func documentDetectionController(_ scanner: DocumentDetector.DocumentDetectorController, didFinishWithResults results: DocumentDetector.DocumentDetectorResult) {
        
        let response : NSMutableDictionary! = [:]

            var captureMap : [NSMutableDictionary?]  = []
            for index in (0 ... results.captures.count - 1) {
              let capture : NSMutableDictionary! = [:]
              let imagePath = saveImageToDocumentsDirectory(image: results.captures[index].image, withName: "document\(index).jpg")
              capture["imagePath"] = imagePath
              capture["imageUrl"] = results.captures[index].imageUrl
              capture["quality"] = results.captures[index].quality
              capture["label"] = results.captures[index].label
              captureMap.append(capture)
            }

            response["type"] = results.type
            response["captures"] = captureMap
            response["trackingId"] = results.trackingId
    }
    
    public func documentDetectionControllerDidCancel(_ scanner: DocumentDetector.DocumentDetectorController) {

    }
    
    public func documentDetectionController(_ scanner: DocumentDetector.DocumentDetectorController, didFailWithError error: DocumentDetector.CafDocumentDetectorFailure) {
     
    }
    
    func saveImageToDocumentsDirectory(image: UIImage, withName: String) -> String? {
        if let data = image.jpegData(compressionQuality: 0.8) {
          let dirPath = getDocumentsDirectory()
          let filename = dirPath.appendingPathComponent(withName)
          do {
            try data.write(to: filename)
            print("Successfully saved image at path: \(filename)")
            return filename.path
          } catch {
            print("Error saving image: \(error)")
          }
        }
        return nil
      }

      func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0]
      }
}
