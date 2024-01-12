import Model

public struct TTSchedule: Schedule {

    public let arrangement = CPUNotifierArrangement()

    @Slot(fsm: \.$notifier, timing: (startTime: 1000000, duration: 2000000))
    public var slot

    public init() {}

}
