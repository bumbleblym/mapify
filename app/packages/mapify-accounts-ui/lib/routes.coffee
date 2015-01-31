routes = [
  { code: 'changePwd',     name: 'atChangePwd',     title: 'Change Password' }
  { code: 'enrollAccount', name: 'atEnrollAccount', title: 'Enroll Account' }
  { code: 'forgotPwd',     name: 'atForgotPwd',     title: 'Forgot Password' }
  { code: 'resetPwd',      name: 'atResetPwd',      title: 'Reset Password' }
  { code: 'signIn',        name: 'atSignIn',        title: 'Sign In' }
  { code: 'signUp',        name: 'atSignUp',        title: 'Sign Up' }
  { code: 'verifyEmail',   name: 'atVerifyEmail',   title: 'Verify Email' }
]

# Configure routes
_.each routes, (route) ->
  AccountsTemplates.configureRoute route.code

  # Add title to route options
  Router.onBeforeAction ->
    @route.options.title = route.title
    @next()
  ,
    only: [route.name]

AccountsTemplates.configureRoute 'ensureSignedIn'
