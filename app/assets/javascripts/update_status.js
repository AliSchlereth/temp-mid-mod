
function updatedLinkStatus(linkID) {
  axios.patch('/api/v1/links/' + linkID, {
    read: true
  })
  .then(function(response){
    console.log(response)
  })
  .catch(function(error){
    console.log(error)
  });
}

function updateHotReads(linkURL) {
  axios.post('https://powerful-wave-14129.herokuapp.com/api/v1/links', {
    url: linkURL
  })
  .then(function(response){
    console.log(response)
  })
  .catch(function(error){
    console.log(error)
  })
}

$(document).ready(function(){
  $('.mark-as-read').on('click',function(e){
    e.preventDefault();
    var linkID = $(this)[0].id.split('-')[1];
    var linkURL = $(this).parents('.row').children('.URL').text();
    updatedLinkStatus(linkID);
    updateHotReads(linkURL);
  });
})
