AccountsTemplates.removeField 'email'
AccountsTemplates.removeField 'password'

AccountsTemplates.addFields [
  _id: 'username'
  type: 'text'
  required: true
  displayName: 'Display name'
  placeholder: 'Display name'
  re: Mpf.SchemaHelpers.getSchema('users').username.regEx
  errStr: 'At least 4 characters. Must be alphanumeric; may contain _.'
,
  _id: 'email'
  type: 'email'
  required: true
  displayName: 'Email address'
  placeholder: 'Email address'
  re: SimpleSchema.RegEx.Email
  # errStr: ''
,
  _id: 'username_and_email'
  type: 'text'
  required: true
  displayName: 'Login'
  placeholder: 'Display name or email address'
  # re:
  # errStr: ''
,
  _id: 'password'
  type: 'password'
  required: true
  displayName:
    default: 'Password'
    changePwd: 'New password'
    resetPwd: 'New password'
  placeholder:
    default: 'Password'
    changePwd: 'New password'
    resetPwd: 'New password'
  re: /^[a-zA-Z0-9_]{8,}$/
  errStr: 'At least 8 characters. Must be alphanumeric; may contain _.'
,
  _id: 'password_again'
  type: 'password'
  required: true
  displayName: 'Confirm password'
  placeholder: 'Confirm password'
]
