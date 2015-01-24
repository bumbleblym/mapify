AutoForm.hooks
  insertInventoryForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()

        return doc
