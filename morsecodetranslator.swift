// Usage
let englishText = "this is a secret message"
let secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."


func encodeToMorse(englishText: String) -> String {
    let letterToMorse = [
        "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
        "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
        "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.",
        "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
        "y": "-.--", "z": "--.."
    ]
    
    var morseText = ""
    
    for element in englishText.lowercased() {
        if let morseChar = letterToMorse[String(element)] {
            morseText.append("\(morseChar) ")
        } else {
            morseText.append("   ")
        }
    }
    
    return morseText
}

func decodeFromMorse(secretMessage: String) -> String {
    let letterToMorse = [
        "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
        "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
        "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.",
        "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
        "y": "-.--", "z": "--.."
    ]
    
    var morseToLetter: [String: String] = [:]
    for (letter, morseChar) in letterToMorse {
        morseToLetter[morseChar] = letter
    }
    
    var decodedMessage = ""
    var morseCodeArray = [String]()
    var currMorse = ""
    
    for char in secretMessage {
        if char != " " {
            currMorse.append(char)
        } else {
            switch currMorse {
                case "":
                    currMorse += " "
                case " ":
                    morseCodeArray.append(" ")
                    currMorse = ""
                default:
                    morseCodeArray.append(currMorse)
                    currMorse = ""
            }
        }
    }
    morseCodeArray.append(currMorse)
    
    for morseValue in morseCodeArray {
        if let letterChar = morseToLetter[morseValue] {
            decodedMessage += letterChar
        } else {
            decodedMessage += " "
        }
    }
    
    return decodedMessage
}

// Encode to Morse
let morseCode = encodeToMorse(englishText: englishText)
print("Encoded Morse: \(morseCode)")

// Decode from Morse
let decodedMessage = decodeFromMorse(secretMessage: secretMessage)
print("Decoded Message: \(decodedMessage)")
