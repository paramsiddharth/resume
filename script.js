window.addEventListener('load', () => {
	const width = window.innerWidth;
	const height = document.body.clientHeight;
	const style = document.createElement('style');
	style.innerHTML = `
		@page {
			size: ${width}px ${height}px;
		}
	`;
	document.head.appendChild(style);
});