import Dispatch
import example_proto_Foo
import Foundation
import SwiftGRPC

let fooProvider = FooProvider()
let server = ServiceServer(address: "127.0.0.1:8080",
                           serviceProviders: [fooProvider])
server.start()

let sem = DispatchSemaphore(value: 0)
_ = sem.wait(timeout: DispatchTime.distantFuture)
