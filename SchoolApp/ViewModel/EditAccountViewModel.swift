import SwiftUI
import FirebaseStorage


class EditAccountViewModel{
    
    func uploadImageToFirebase(image: UIImage) {
        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("profile_images/\(UUID().uuidString).jpg")
        
        if let imageData = image.jpegData(compressionQuality: 0.75) {
            imageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("画像のアップロードに失敗しました: \(error.localizedDescription)")
                    return
                }
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("URL取得に失敗しました: \(error.localizedDescription)")
                        return
                    }
                    guard let downloadURL = url else { return }
                    print("アップロード成功！URL: \(downloadURL)")
                    // URLを保存したり、UIに表示するなどの処理を追加
                }
            }
        }
    }
    
}
