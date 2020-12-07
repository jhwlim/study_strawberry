function redirect() {
	event.preventDefault();
	window.location.href = 'list';
}

function isAllWhiteSpace(content) {
	if (content.trim().length == 0) {
		return true;
	} else {
		return false;
	}
}