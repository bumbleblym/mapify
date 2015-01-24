Template.wishlist.helpers
  wishlistGames: ->
    return Mpf.Collections.wishlist.find
      userId: Meteor.userId()

Template.wishlist.rendered = ->
  Meteor.typeahead $('input[name="title"]'), (query, callback) ->
    Meteor.call 'acGameNames', query, {}, (err, res) ->
      if err
        console.log err
        return

      callback res.map (v) ->
        return value: v.title

  $('#show-add-wishlist-modal').click ->
    $('#insertWishlistForm').css 'visibility', 'visible'

  $('.location-form-close-button').click ->
    $('#insertWishlistForm').css 'visibility', 'hidden'

AutoForm.hooks
  insertWishlistForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()
        $('#insertWishlistForm').css 'visibility', 'hidden'
        return doc
