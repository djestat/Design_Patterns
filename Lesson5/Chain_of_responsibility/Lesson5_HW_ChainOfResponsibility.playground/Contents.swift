import UIKit

func data(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

let data1 = data(from: "1")
let data2 = data(from: "2")
let data3 = data(from: "3")


//MARK: - Release

struct Person: Decodable {
    var name: String
    var age: Int
    var isDeveloper: Bool
}

struct  DataDictionary: Decodable {
    let data: [Person]
}

struct  ResultDictionary: Decodable {
    let result: [Person]
}

protocol ParserHandler {
    
    var next: ParserHandler? { get set }
    
    func parserData(_ data: Data) -> [Person]
}

class DataDictionaryParserHandler: ParserHandler {
    var next: ParserHandler?
    
    func parserData(_ data: Data) -> [Person] {
        do {
            let decoder = JSONDecoder()
            let persons = try decoder.decode(DataDictionary.self, from: data).data
            return persons
        } catch {
            self.next?.parserData(data)
        }
        return (self.next?.parserData(data))!
    }
}

class ResultDictionaryParserHandler: ParserHandler {
    var next: ParserHandler?
    
    func parserData(_ data: Data) -> [Person] {
        do {
            let decoder = JSONDecoder()
            
            let persons = try decoder.decode(ResultDictionary.self, from: data).result
            return persons
        } catch {
            self.next?.parserData(data)
        }
        return (self.next?.parserData(data))!
    }
}

class ArrayParserHandler: ParserHandler {
    var next: ParserHandler?
    
    func parserData(_ data: Data) -> [Person] {
        do {
            let decoder = JSONDecoder()
            let persons = try decoder.decode([Person].self, from: data)
            return persons
        } catch {
            self.next?.parserData(data)
        }
        return []
    }
}



func parseData(_ data: Data) -> [Person] {
    
    let dataDictionaryParserHandler = DataDictionaryParserHandler()
    let resultDictionaryParserHandler = ResultDictionaryParserHandler()
    let arrayParserHandler = ArrayParserHandler()
    let parserHandler: ParserHandler = dataDictionaryParserHandler
    
    dataDictionaryParserHandler.next = resultDictionaryParserHandler
    resultDictionaryParserHandler.next = arrayParserHandler
    arrayParserHandler.next = nil
    
    return parserHandler.parserData(data)
}


let dataDict = parseData(data1)
let result = parseData(data2)
let array = parseData(data3)

func description(_ array: [Person]) {
    for i in 0..<array.count {
        print("Name: \(array[i].name) Age: \(array[i].age) Developer: \(array[i].isDeveloper)")
    }
    print("\n")
}

description(dataDict)
description(result)
description(array)
