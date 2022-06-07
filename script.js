window.addEventListener('load', () => {
	const width = window.innerWidth;
	const height = document.body.clientHeight;
	const style = document.createElement('style');
	style.innerHTML = `
		@page {
			size: ${width}px ${height + 1}px;
		}

		.only-screen {
			display: none;
		}

		@media only screen {
			.only-screen {
				display: block;
				height: auto;
			}
		}
	`;
	document.head.appendChild(style);
	const newDiv = document.createElement('div');
	newDiv.className = 'section only-screen';
	newDiv.innerHTML = `
	Download PDF:
	[
	<a class='blue underline' download='resume.pdf' href='resume.pdf'>Full</a>
	|
	<a class='blue underline' download='resume-mini.pdf' href='resume-mini.pdf'>Mini</a>
	]
	`;
	const firstSection = document.getElementById('first-section');
	firstSection.parentNode.insertBefore(newDiv, firstSection.nextSibling);
});