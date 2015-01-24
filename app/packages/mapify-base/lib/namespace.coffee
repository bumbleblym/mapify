# App namespace
Mpf = {}

# Helpers
Mpf.helpers =
  createNamespace: (name) ->
    if name of Mpf
      throw new Error "Namespace already exists: #{name}"

    Mpf[name] = {}

    return Mpf[name]
