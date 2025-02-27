import SwiftUI
import Firebase

struct MakeQuestion: Identifiable, Codable {
    var id: String?  // Firestoreが自動的にIDを生成するのでOptionalに変更
    var questionText: String
    var choices: [String]
    var correctAnswer: String // 正解の選択肢
    var points: Int
    
    init(questionText: String, choices: [String], correctAnswer: String, points: Int) {
        self.id = nil // Firestoreが自動でIDを生成
        self.questionText = questionText
        self.choices = choices
        self.correctAnswer = correctAnswer
        self.points = points
    }
}

struct MakeQuestionModel: View {
    @State private var questionText = ""
    @State private var options = ["", "", "", ""]
    @State private var correctAnswer = ""
    @State private var points = 0
    
    var body: some View {
        VStack {
            TextField("問題文", text: $questionText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ForEach(0..<4, id: \.self) { index in
                TextField("選択肢 \(index + 1)", text: $options[index])
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            TextField("正解 (選択肢の1つ)", text: $correctAnswer)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Stepper("ポイント: \(points)", value: $points, in: 0...100)
                .padding()
            
            Button(action: {
                saveQuestion()
            }) {
                Text("問題を保存")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func saveQuestion() {
        let db = Firestore.firestore()
        
        // 問題データをFirestoreに保存
        let newQuestion = MakeQuestion(
            questionText: questionText,
            choices: options,
            correctAnswer: correctAnswer,
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

struct MakeQuestionModel_Previews: PreviewProvider {
    static var previews: some View {
        MakeQuestionModel()
    }
}
