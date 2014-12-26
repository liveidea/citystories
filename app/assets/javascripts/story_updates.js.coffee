ready = undefined
ready = ->
  $(document).ready ->
    $("#story_updates .page").infinitescroll
      navSelector: "ul.pagination"
      nextSelector: "ul.pagination a[rel=next]"
      itemSelector: "#story_updates div.story_update"


  return

$(document).ready ready
$(document).on "page:load", ready

