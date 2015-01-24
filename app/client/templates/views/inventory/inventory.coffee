Template.inventory.helpers
  inventoryGames: ->
    return Mpf.Collections.inventory.find
      userId: Meteor.userId()

Template.inventory.rendered = ->
  Meteor.typeahead $('input[name="title"]'), (query, callback) ->
    Meteor.call 'acGameNames', query, {}, (err, res) ->
      if err
        console.log err
        return

      callback res.map (v) ->
        return value: v.title

  $('#show-add-inventory-modal').click ->
    $('#insertInventoryForm').css 'visibility', 'visible'

  $('.location-form-close-button').click ->
    $('#insertInventoryForm').css 'visibility', 'hidden'

AutoForm.hooks
  insertInventoryForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()
        $('#insertInventoryForm').css 'visibility', 'hidden'
        return doc
