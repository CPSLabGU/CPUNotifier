import FSM
import LLFSMs
import Model

struct CPUNotifier: LLFSM {

    struct Environment: EnvironmentSnapshot {

        @WriteOnly
        var cpuCount: UInt8!

    }

    struct Context: ContextProtocol, EmptyInitialisable {

        var previousCPUCount: UInt8 = 0

    }

    @State(
        name: "Initial",
        uses: \.$cpuCount,
        onEntry: {
            $0.cpuCount = 1
        },
        onExit: {
            $0.previousCPUCount = $0.cpuCount
            $0.cpuCount = $0.cpuCount &+ 1
            if $0.cpuCount == 0 {
                $0.cpuCount = $0.cpuCount + 1
            }
        },
        transitions: {
            Transition(to: "Initial") { $0.after(.milliseconds(5)) }
        }
    )
    var initial

    let initialState = \Self.$initial

}
