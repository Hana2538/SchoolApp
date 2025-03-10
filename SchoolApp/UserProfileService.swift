import Firebase
import FirebaseFirestore

class UserProfileService {
    private let db = Firestore.firestore()
    private let collectionName = "users"

    /// Firestore: ユーザー情報を書き込む (新規 or 更新)
    /// - Parameters:
    ///   - uid: Firebase Authentication のユーザーID
    ///   - email: ユーザーのメールアドレス
    ///   - userName: ユーザーが設定した名前
    func saveUserProfile(uid: String, email: String, userName: String) async throws {
        let docRef = db.collection(collectionName).document(uid)
        try await docRef.setData([
            "email": email,
            "userName": userName,
            "updatedAt": FieldValue.serverTimestamp()
        ], merge: true)
    }

    /// Firestore: ユーザー情報を取得
    /// - Parameter uid: 対象となるユーザーID
    /// - Returns: (email, userName) のタプル
    func fetchUserProfile(uid: String) async throws -> (String, String)? {
        let docRef = db.collection(collectionName).document(uid)
        let snapshot = try await docRef.getDocument()

        guard let data = snapshot.data() else {
            return nil
        }
        let email = data["email"] as? String ?? ""
        let userName = data["userName"] as? String ?? ""
        return (email, userName)
    }
}
