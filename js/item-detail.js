function serachQueryParam(key) {
	return new URLSearchParams(location.search).get(key);
}

function createItemData(itemIndex) {
	fetch(`https://pkm.gg/api/held-items/${itemIndex}/`, {
		method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
		// 아이템 이미지
		const itemImg = document.querySelector('.item-image > img');
		itemImg.src = data['img'];

		// 아이템 이름
		const pokeName = document.querySelector('.item-name > h2');
		pokeName.textContent = data['name_text'];

		// 아이템 타입
		const type = document.querySelector('.type > p');
		type.textContent = data['type_text'];

		// 아이템 효과
		const effectDiv = document.querySelector('.effect');
		effectDiv.textContent = data['description'];

		// 아이템 스펙
		const specTableHead = document.querySelectorAll('.spec-table > thead');
		const specTableBody = document.querySelectorAll('.spec-table > tbody');
		const statusIncrease = data['status_increase'].split(' / ');
		console.log(statusIncrease);
		for (let i = 0; i <= 5; i++) {
			const headTr = specTableHead[i].querySelector('tr');
			const levelTextTd = document.createElement('th');
			levelTextTd.textContent = "레벨";
			headTr.append(levelTextTd);
			for (let j = 1; j <= 5; j++) {
				const levelTh = document.createElement('th');
				levelTh.textContent = i * 5 + j;
				headTr.append(levelTh);
			}

			for (let statusIndex = 0; statusIndex < statusIncrease.length; statusIndex++) {
				const bodyTr = document.createElement('tr');
				const statusTd = document.createElement('td');

				bodyTr.append(statusTd);
				statusTd.innerText = statusIncrease[statusIndex];

				for (let j = 1; j <= 5; j++) {
					const dataTr = document.createElement('td');
					bodyTr.append(dataTr);
					dataTr.textContent = data[`status_${i * 5 + j}`].split(' / ')[statusIndex];
				}
				specTableBody[i].append(bodyTr);
			}
		}
	});
}

createItemData(serachQueryParam('item'));