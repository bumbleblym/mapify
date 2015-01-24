Template.inventory.rendered = ->
  Meteor.typeahead $('input[name="title"]'), (query, callback) ->
    Meteor.call 'acGameNames', query, {}, (err, res) ->
      if err
        console.log err
        return

      callback res.map (v) ->
        return value: v.title

AutoForm.hooks
  insertInventoryForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()

        return doc
