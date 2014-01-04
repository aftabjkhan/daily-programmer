// Aftab Khan, 2014

document.addEventListener('invalid', function (e) {
	setResults("<p>The given URL is invalid!</p>");
}, true);

function processForm(form) {
	setResults(getKeyValuePairString(form.urlField.value));
}

function getKeyValuePairString (url) {
	var pairString = "<p>URL Query Key-Value Pairs:</p>\n<ul>";
	var queryStart = url.indexOf("?");
	if (queryStart > 0) {
		var queryString = url.substring(queryStart + 1);
		var pairs = queryString.split("&");
		for (var i = 0; i < pairs.length; i++){
			var keyValueArray = pairs[i].split("=");
			pairString += "<li>" + keyValueArray[0] + ": " + keyValueArray[1] + "</li>";
		}
	}
	return pairString + "</ul>";
}

function setResults (contents) {
	document.getElementById("results").innerHTML = contents;
}