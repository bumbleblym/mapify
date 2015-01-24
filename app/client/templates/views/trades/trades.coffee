AutoForm.hooks
  insertTradeForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()
        doc.activeAt = new Date

        return doc
