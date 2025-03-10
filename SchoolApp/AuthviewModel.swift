import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    // ローカルに保存するユーザー情報
    @AppStorage("my_user_session_data") private var userSessionData: Data = Data()

    @Published var currentUser: User? = nil

    private let userProfileService = UserProfileService()

    var isLoggedIn: Bool {
        currentUser != nil
    }

    init() {
        // アプリ起動時、Firebase Auth が既にセッションを持っていれば user が non-nil
        if let user = Auth.auth().currentUser {
            // まずはローカル @AppStorage から読み込んで反映
            loadFromAppStorage()

            // Firestore に最新データがあるかもしれないので、再度 fetch
            Task {
                await self.reloadUserProfileFromFirestore(uid: user.uid)
            }
        } else {
            // 未ログイン
            loadFromAppStorage() // (もし何か残っていれば読み込む)
        }
    }

    // MARK: - 新規登録 (ユーザー名付き)

    /// 新規登録するときに userName も受け取る
    func signUp(email: String, password: String, userName: String) async throws {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let firebaseUser = authResult.user
        let uid = firebaseUser.uid

        // Firestore に userName, email を保存
        try await userProfileService.saveUserProfile(uid: uid, email: email, userName: userName)

        // MyUserSession に反映
        let session = User(userID: uid, userName: email, email: userName)
        await MainActor.run {
            self.currentUser = session
            self.saveToAppStorage()
        }
    }

    // MARK: - ログイン (ユーザー名取得)

    func signIn(email: String, password: String) async throws {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let firebaseUser = authResult.user
        // Firestore から userName を含むプロファイルを取得
        await reloadUserProfileFromFirestore(uid: firebaseUser.uid)
    }

    // MARK: - Firestore のユーザープロファイルを読み込み

    private func reloadUserProfileFromFirestore(uid: String) async {
        do {
            if let (email, userName) = try await userProfileService.fetchUserProfile(uid: uid) {
                // 成功: MyUserSession に更新
                let session = User(userID: uid, userName: email, email: userName)
                await MainActor.run {
                    self.currentUser = session
                    self.saveToAppStorage()
                }
            } else {
                print("ユーザープロファイルが見つからない")
            }
        } catch {
            print("Firestore 読み込み失敗: \(error)")
        }
    }

    // MARK: - ログアウト

    func signOut() throws {
        try Auth.auth().signOut()
        self.currentUser = nil
        self.userSessionData = Data()
    }

    // MARK: - ローカルの保存・復元

    private func saveToAppStorage() {
        guard let currentUser = currentUser else { return }
        do {
            let data = try JSONEncoder().encode(currentUser)
            self.userSessionData = data
        } catch {
            print("Encoding error: \(error)")
        }
    }

    private func loadFromAppStorage() {
        guard !userSessionData.isEmpty else { return }
        do {
            let session = try JSONDecoder().decode(User.self, from: userSessionData)
            self.currentUser = session
        } catch {
            print("Decoding error: \(error)")
        }
    }
}
