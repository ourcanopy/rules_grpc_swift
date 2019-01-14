import example_proto_Foo

let service = Foo_FooServiceClient(address: "127.0.0.1:8080",
                             secure: false)

var request = Foo_Testy()
request.foo = "hey swift server!"
request.bar = 41

let response = try service.baz(request)
print("got response: \(response)")
