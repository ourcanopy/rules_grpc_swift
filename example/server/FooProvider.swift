import Dispatch
import example_proto_Foo
import Foundation

class FooProvider : Foo_FooProvider {
    func baz(request : Foo_Testy, session : Foo_FooBazSession) throws -> Foo_Testy {
        var response = Foo_Testy()
        response.foo = "hi from swift!"
        print("got request: \(request)")
        response.bar = request.bar + 1
        return response
    }
}
