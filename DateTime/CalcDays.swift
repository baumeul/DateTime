import Foundation

struct CalcDays {
    
    var firstDate: String
    var secondDate: String
    var formatter = DateFormatter()
    var cal: Calendar
    var dcf: DateComponentsFormatter
    
    init(firstDate: String, secondDate: String) {
        self.firstDate = firstDate
        self.secondDate = secondDate
        self.formatter.dateFormat = "dd.MM.yyyy"
        self.cal = Calendar.current
        self.dcf = DateComponentsFormatter()
    }
    
    func daysSeconds() -> Double {
        //let formatter = DateFormatter()
        self.formatter.dateFormat = "dd.MM.yyyy"
        let first = formatter.date(from: firstDate)
        let second = formatter.date(from: secondDate)
        let seconds = second?.timeIntervalSince(first!)
        let days = seconds! / (60 * 60 * 24)
        return days
    }
    
    func daysComps() -> String {
        // #1: Datumsformat festlegen
        self.formatter.dateFormat = "dd.MM.yyyy"
        // #2: Kalenderdatum vom Typ String einer Variablen vom Typ Date zuweisen
        let first = formatter.date(from: firstDate)
        let second = formatter.date(from: secondDate)
        // #3: Kalenderdatum vom Typ Date einer Variablen vom Typ DateComponents zuweisen
        let compsStart = cal.dateComponents([.year, .month, .day], from: first!)
        let compsEnd = cal.dateComponents([.year, .month, .day], from: second!)
        // #4: Kalenderdatum von Typ DateComponents einer Variablen vom Typ Date zuweisen
        let startDate = cal.date(from: DateComponents(year: compsStart.year, month: compsStart.month, day: compsStart.day))
        let endDate = cal.date(from: DateComponents(year: compsEnd.year, month: compsEnd.month, day: compsEnd.day))
        // #5: DateComponentesFormatter konfigurieren
        self.dcf.unitsStyle = .full
        self.dcf.allowedUnits = [.day]
        // #6: Die Differenz zwischen zwei Kalenderdaten vom Typ Date berechnen
        let diffString = self.dcf.string(from: startDate!, to: endDate!)
        // #7: Rückgabewert ist vom Typ String?
        return diffString!
    }
    
    func daysDate() -> String {
        // #1: Kalenderdatum vom Typ String einer Variablen vom Typ Date zuweisen
        let firstDate = formatter.date(from: self.firstDate)
        let secondDate = formatter.date(from: self.secondDate)
        // #2: Die Differenz zwischen zwei Kalenderdaten vom Typ Date berechnen
        let diffString = self.dcf.string(from: firstDate!, to: secondDate!)
        // #3: Ergebnis ist vom Typ String?
        return diffString!
    }
    
}
