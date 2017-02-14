

$(document).ready(function(){
  $('.mark-as-read').on('click',function(e){
    e.preventDefault();
    var linkID = $(this)[0].id.split('-')[1];
    axios.patch('/api/v1/links/' + linkID, {
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
