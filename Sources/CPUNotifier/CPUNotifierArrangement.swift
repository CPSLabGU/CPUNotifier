import InMemoryVariables
import Model
 
public struct CPUNotifierArrangement: Arrangement {

    @Actuator
    var cpuCount = InMemoryActuator(id: "cpuCount", initialValue: UInt8(1))

    @Machine(
        actuators: (\.$cpuCount, mapsTo: \.$cpuCount)
    )
    var notifier = CPUNotifier()

}
