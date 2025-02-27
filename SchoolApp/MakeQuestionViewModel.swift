import SwiftUI
import Firebase

class MakeQuestionViewModel: ObservableObject {
    @Published var questionText: String = ""
    @Published var choice1: String = ""
    @Published var choice2: String = ""
    @Published var choice3: String = ""
    @Published var choice4: String = ""
    @Published var correctAnswer: String = "" // 正解の選択肢
    @Published var points: Int = 0
    
    // 選択肢が選ばれた時の更新
    func updateCorrectAnswer(choice: String) {
        self.correctAnswer = choice
    }
    
    // Firestoreに問題を保存する関数
    func saveQuestion() {
        let db = Firestore.firestore()
        
        let newQuestion = MakeQuestion(
            questionText: questionText,
            choices: [choice1, choice2, choice3, choice4],
            correctAnswer: correctAnswer, // 正解の選択肢
            points: points
        )
        
//        do {
//            let ref = db.collection("questions").document() // Firestoreが自動でIDを管理
//            try ref.setData(from: newQuestion)
//            print("問題が保存されました")
//        } catch {
//            print("エラーが発生しました: \(error.localizedDescription)")
//        }
    }
}
