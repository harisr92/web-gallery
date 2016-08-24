# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#image_photo').attr('name','image[photo]')
    $('#new_image').fileupload
        dataType: 'script'
        add: (e, data) ->
            types = /(\.|\/)(gif|jpe?g|png|mov|mpeg|mpeg4|avi)$/i
            file = data.files[0]
            if types.test(file.type) || types.test(file.name)
                data.submit()
            else
                alert("#{file.name} is not a gif, jpg or png image file")
        progress: (e, data) ->
                e.preventDefault()
                window.scrollTo(0, 0)
                progress = parseInt(data.loaded / data.total * 100, 10)
                $("#progBarMsg").parent().css("width", progress+'%').attr('aria-valuenow', progress)
