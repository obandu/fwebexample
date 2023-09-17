function checkServer()
{
    var xhttp = new XMLHttpRequest();
    // alert('so far so good');
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        updateAppContent(this.responseText);
        // location.reload();
      }
      else
      {
        // console.log('Message is  .. ' + this.responseText + " And status is " + this.status + " : " + this.readyState);
      }
    };    
    xhttp.open("POST", "https://www.kiwavi-tech.com/fweb/fwebtest.php", true);
    xhttp.send();
}

function updateAppContent(messageText)
{
    /* console.log('so far so good');
    const contentArea = document.getElementById("webpagecontent");
    contentArea.style.display = "block";
    contentArea.innerText = messageText; */
    // console.log('so far so good .. ' + messageText);
    updateAppWithWebContent(messageText);
}

function getWebPageContent()
{
    const contentArea = document.getElementById("webpagecontent");
    return contentArea.innerText;
} 