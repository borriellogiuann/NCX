import Foundation

struct Country: Codable {
    struct Name: Codable {
        let common: String?
        let official: String?
        let nativeName: [String: NameTranslations]?
    }
    
    struct NameTranslations: Codable {
        let official: String?
        let common: String?
    }
    
    struct Currency: Codable {
        let name: String?
        let symbol: String?
    }
    
    struct IDD: Codable {
        let root: String?
        let suffixes: [String]?
    }
    
    struct Demonyms: Codable {
        struct Demonym: Codable {
            let f: String?
            let m: String?
        }
        
        let eng: Demonym?
        let fra: Demonym?
    }
    
    struct Flags: Codable {
        let png: URL?
        let svg: URL?
        let alt: String?
    }
    
    struct CoatOfArms: Codable {
        let png: URL?
        let svg: URL?
    }
    
    let name: Name?
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies: [String: Currency]?
    let idd: IDD?
    let capital: [String]?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: NameTranslations]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: [String: URL]?
    let population: Int?
    let gini: [String: Double]?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let flags: Flags?
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    
    struct Car: Codable {
        let signs: [String]?
        let side: String?
    }
    
    struct CapitalInfo: Codable {
        let latlng: [Double]?
    }
    
    struct PostalCode: Codable {
        let format: String?
        let regex: String?
    }
}
