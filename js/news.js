import module from './module.js';

function createNews(img, title, date, url) {
	const newsUl = document.querySelector('.news-list');
	const newsLi = document.createElement('li');
	const link = document.createElement('a');
	const bannerImg = document.createElement('img');
	const titleDiv = document.createElement('div');
	const dateText = document.createElement('p');
	const titleText = document.createElement('p');

	link.href = url;
	link.target = '_blank';
	newsLi.className = 'news';
	bannerImg.src = img;
	titleDiv.className = 'title-box';
	dateText.className = 'date';
	titleText.className = 'title';
	dateText.innerText = date;
	titleText.innerText = title;

	newsUl.append(newsLi);
	newsLi.append(link);
	link.append(bannerImg, titleDiv);
	titleDiv.append(dateText, titleText);
}


export function createNewsData() {

	const types = { "update":["업데이트", "type"], "now_event":["진행이벤트", "type"], "end_event":["종료이벤트", "type"], "notice":["공지", "type"], "resetFilter":["초기화", "type"] };
	fetch(`https://pkm.gg/api/news/`, {
	method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
		data.reverse();
		data.forEach((element) => {
			const img = element.img;
			const title = element.title;
			const date = element.date;
			const url = element.url;
			createNews(img, title, date, url);
		});
		module.filterSetting(types);
	});
}