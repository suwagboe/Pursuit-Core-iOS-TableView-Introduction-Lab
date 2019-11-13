import Foundation

struct Task {
    enum Status: String, CaseIterable {
        case notStarted
        case inProgress
        case completed
    }
    
    let name: String
    let status: Status
    let dueDate: Date    
    
    static var allTasks: [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return [
            Task(name: "Create project roadmap",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "08-13-2020")!),
            Task(name: "Source information session speakers",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "09-22-2020")!),
            Task(name: "Secure event funding",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "09-28-2020")!),
            Task(name: "Secure venue for keynote",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-23-2020")!),
            Task(name: "Identify event KPIs",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "7-04-2020")!),
            Task(name: "Create internal newsletter advertising event",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "6-09-2020")!),
            Task(name: "Submit food budget",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "6-12-2020")!),
            Task(name: "Create event logo",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "5-02-2020")!),
            Task(name: "Make companion iOS application for event",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "11-14-2020")!),
            Task(name: "Get celebrity speaker (Tim Cook?)",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "8-16-2020")!),
            Task(name: "Purchase event insurance",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "5-19-2020")!),
            Task(name: "Get event SWAG",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "8-20-2020")!),
            Task(name: "Secure seat with SpaceX",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "11-13-2020")!),
            Task(name: "Conduct brainstorming session",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-03-2020")!),
            Task(name: "Get all necessary headcount allocated",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "04-13-2020")!),
        ]
    }
    
    static func filteredTask() -> [[Task]] {
        
        // why do I need rawValue after status what does that really mean
        let sortedTask = allTasks.sorted { $0.status.rawValue < $1.status.rawValue }
        
        // is a set
        let taskStatus: Set<String> = Set(allTasks.map { $0.status.rawValue })
        
        var statusArr = Array(repeating: [Task](), count: taskStatus.count)
        
        var currentIndex = 0
        var currnetStatus = sortedTask.first?.status
        for status in sortedTask{
            if status.status == currnetStatus {
                statusArr[currentIndex].append(status)
            }
         else {
            currentIndex += 1
            currnetStatus = status.status
                statusArr[currentIndex].append(status)
//                sectionsArr[currentIndex].append(country)
        }
        }
    // filters task.allTasks to give me the array of arrays of task
    // to get 3 different arrays
    //filteredTasks -> [[Task]]
    
    return statusArr
}




}
