import Dispatch
import example_proto_Foo
import Foundation
import gRPC

let fooProvider = FooProvider()
let server = Foo_FooServer(address: "127.0.0.1:8080",
                           provider: fooProvider)
server.start()

let sem = DispatchSemaphore(value: 0)
_ = sem.wait(timeout: DispatchTime.distantFuture)
