import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfVowels(in string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u",
                                   "A", "E", "I", "O", "U"]
        return string.reduce(0) {
            $0 + (vowels.contains($1) ? 1 : 0)
        }
    }

    func makeHeadline(from string: String) -> String {
        let words = string.components(separatedBy: " ")

        let headlineWords = words.map { (word) -> String in
            var mutableWord = word
            let first = mutableWord.remove(at: mutableWord.startIndex)

            return String(first).uppercased() + mutableWord
        }

        return headlineWords.joined(separator: " ")
    }

}

//    func numberOfVowels(in string: String) -> Int {
//        let vowels: [Character] = ["a", "e", "i", "o", "u",
//                                   "A", "E", "I", "O", "U"]
//
//        var numberOfVowels = 0
//
//        for character in string {
//            if vowels.contains(character) {
//                numberOfVowels += 1
//            }
//        }
//
//        return numberOfVowels
//    }

