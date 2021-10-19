function serachQueryParam(key) {
	return new URLSearchParams(location.search).get(key);
}

function createBuildList(pokemonIndex) {
	fetch(`https://pkm.gg/api/build-list/${pokemonIndex}/`, {
		method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
    lineMapping = {
      "top": "위 루트",
      "central": "중앙 에리어",
      "bottom": "아래 루트",
    };

    const pageTitle = document.querySelector('.page-title-section > .page-title');
    pageTitle.textContent = `${data['name_text']} 빌드 목록`;

    const buildListSection = document.querySelector('.build-list-section');
    
    data['build'].forEach((build) => {
      const buildDiv = document.createElement('div');
      const buildDesc = document.createElement('ul');
      const laneLi = document.createElement('li');
      const laneP = document.createElement('p');
      const rateOfUseLi = document.createElement('li');
      const rateOfUseP = document.createElement('p');
      const linkLi = document.createElement('li');
      const linkP = document.createElement('p');
      
      buildDiv.className = "build";
      buildDesc.className = "build-desc";
      linkLi.className = "link";
      
      laneLi.append(laneP);
      rateOfUseLi.append(rateOfUseP);
      linkLi.append(linkP);
      buildDesc.append(laneLi, rateOfUseLi, linkLi);
      
      laneP.innerHTML = `<img class="lane-icon" src="./img/positions/${build['position']}.png">${lineMapping[build['position']]}`;
      rateOfUseP.textContent = `사용률 ${parseFloat(build['percent']).toFixed(1)}%`;
      linkP.textContent = '캐릭터 정보'
      linkLi.setAttribute('onclick', `location.href='./pokemon-detail.html?pokemon=${data['id']}'`);

      const lineDiv = document.createElement('div');
      lineDiv.className = "line";
      
      const buildListUl = document.createElement('ul');
      buildListUl.className = "list";
  
      build['skill'].forEach((skill) => {
        const buildListLi = document.createElement('li');
        const buildListImg = document.createElement('img');

        buildListImg.src = skill['img'];
        buildListImg.setAttribute('onclick', `location.href='./pokemon-detail.html?pokemon=${data['id']}'`);
        buildListLi.append(buildListImg);
        buildListUl.append(buildListLi);
      });

      build['item'].forEach((skill) => {
        const buildListLi = document.createElement('li');
        const buildListImg = document.createElement('img');

        buildListImg.src = skill['img'];
        buildListImg.setAttribute('onclick', `location.href='./item-detail.html?item=${skill['id']}'`);
        buildListLi.append(buildListImg);
        buildListUl.append(buildListLi);
      });

      {
        const buildListLi = document.createElement('li');
        const buildListImg = document.createElement('img');

        buildListImg.src = build['battle_item']['img'];
        buildListImg.setAttribute('onclick', `location.href='./battle-item-detail.html?battle-item=${build['battle_item']['id']}'`);
        buildListLi.append(buildListImg);
        buildListUl.append(buildListLi);
      }
  
      buildDiv.append(buildDesc, lineDiv, buildListUl);
      buildListSection.append(buildDiv);
    })

	});
}

createBuildList(serachQueryParam('pokemon'));