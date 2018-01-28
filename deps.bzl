def grpc_swift_dependencies():
  _maybe(native.git_repository,
      name = "org_pubref_rules_protobuf",
      remote = "https://github.com/pubref/rules_protobuf",
      tag = "v0.8.1",
  )

def _maybe(repo_rule, name, **kwargs):
  if name not in native.existing_rules():
    repo_rule(name=name, **kwargs)
