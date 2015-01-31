routeCodes = [
  'changePwd'
  'enrollAccount'
  'forgotPwd'
  'resetPwd'
  'signIn'
  'signUp'
  'verifyEmail'
]

routeNames = [
  'atChangePwd'
  'atEnrollAccount'
  'atForgotPwd'
  'atResetPwd'
  'atSignIn'
  'atSignUp'
  'atVerifyEmail'
]

routeTitles = [
  'Change Password'
  'Enroll Account'
  'Forgot Password'
  'Reset Password'
  'Sign In'
  'Sign Up'
  'Verify Email'
]

# Configure routes
_.each routeCodes, (routeCode, index) ->
  AccountsTemplates.configureRoute routeCode

  # Add title to routes options
  Router.onBeforeAction ->
    @route.options.title = routeTitles[index]
    @next()
  ,
    only: [routeNames[index]]

AccountsTemplates.configureRoute 'ensureSignedIn'
