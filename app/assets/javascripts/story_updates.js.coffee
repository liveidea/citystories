
$(document).ready ->
  $("#story_updates .page").infinitescroll
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: "#story_updates div.story_update"