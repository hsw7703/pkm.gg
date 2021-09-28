import module from './module.js';

function createNews(img, title, date, url) {
	const newList = document.querySelector('.news-list');
	const link = document.createElement('a');
	const newsDiv = document.createElement('div');
	const bannerImg = document.createElement('img');
	const titleDiv = document.createElement('div');
	const dateText = document.createElement('p');
	const titleText = document.createElement('p');

	link.href = url;
	link.target = '_blank';
	newsDiv.className = 'news';
	bannerImg.src = img;
	titleDiv.className = 'title-box';
	dateText.className = 'date';
	titleText.className = 'title';
	dateText.innerText = date;
	titleText.innerText = title;

	newList.append(newsDiv);
	newsDiv.append(link);
	link.append(bannerImg);
	link.append(titleDiv);
	titleDiv.append(dateText);
	titleDiv.append(titleText);
}


export function createNewsData() {

    const myStorage = localStorage;
    const types = {
        "notice":"공지", "update":"업데이트", "event":"이벤트",
		"pkmgg":"PKMGG", "resetFilter":"초기화",
    };

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
        module.filterTagCreate(types);
	});
}