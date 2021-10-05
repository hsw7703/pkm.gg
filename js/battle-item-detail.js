function serachQueryParam(key) {
	return new URLSearchParams(location.search).get(key);
}

function createItemData(battleItemIndex) {
	fetch(`https://pkm.gg/api/battle-items/${battleItemIndex}/`, {
		method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
		const itemImage = document.querySelector('.info-section > .item-image > img');
		itemImage.src = data['img'];

		const nameBoxDiv = document.querySelector('.info-section > .name-box');
		const itemName = nameBoxDiv.querySelector('.item-name > h2');
		itemName.textContent = data['name_text'];

		const itemType = nameBoxDiv.querySelector('.type > p');
		itemType.textContent = `${data['cooltime']}초`;

		const unlockDiv = document.querySelector('.info-section > .unlock');
		unlockDiv.textContent = `트레이너 레벨 ${data['level']} 달성`;
		
		const effectDiv = document.querySelector('.info-section > .effect');
		effectDiv.textContent = data['effect'];
	});
}

createItemData(serachQueryParam('battle-item'));