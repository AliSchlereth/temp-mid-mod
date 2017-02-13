
function updateLink(e){
  e.preventDefault();
  var linkID = $(this)[0].id.split('-')[1];

  $.ajax({
    url: '/api/v1/links' + linkID ,
    method: 'PATCH',
    data: {read: true}
  })
  .done(updateStatusOnPage)
  .fail(onFail);
}

function onFail(error) {
  console.error(error)
}

function updateStatusOnPage() {
  debugger;
}


$(document).ready(function(){
  $('.mark-as-read').on('click',function(e){
    e.preventDefault();
    axios.patch('/api/v1/links/1', {
      read: true
  })
  .then(function(response){
    console.log(response)
  })
  .catch(function(error){
    console.log(error)
  });
  });
})
