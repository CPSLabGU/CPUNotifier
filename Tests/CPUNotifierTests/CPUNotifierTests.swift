import FSMTest
import XCTest

@testable import CPUNotifier

final class CPUNotifierTests: XCTestCase {

    func testGenerateUppaalModel() throws {
        let arrangement = CPUNotifierArrangement()
        let path = URL(fileURLWithPath: #filePath, isDirectory: false)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("kripke_structures")
        let fm = FileManager()
        _ = try? fm.createDirectory(at: path, withIntermediateDirectories: true)
        let moved = fm.changeCurrentDirectoryPath(path.path)
        defer {
            if moved { _ = fm.changeCurrentDirectoryPath(path.deletingLastPathComponent().path) }
        }
        let verifier = ArrangementVerifier(arrangement: arrangement)
        let schedule = TTSchedule()
        try verifier.generateKripkeStructures(forSchedule: schedule, formats: [.uppaal])
    }

}
