# App namespace
Mpf = {}

# Helpers
Mpf.helpers =
  createNamespace: (name, obj = {} ) ->
    if name of Mpf
      throw new Error "Namespace already exists: #{name}"

    Mpf[name] = obj

    return Mpf[name]
