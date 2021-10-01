function serachQueryParam(key) {
	return new URLSearchParams(location.search).get(key);
}

function createTypeDiv(typeArray) {
	// 포켓몬 타입 생성
	const pokeAttributeList = document.querySelector('.attribute-list');
	for (let index = 0; index < 3; index++) {
		const pokeAttributeBox = document.createElement('li')
		pokeAttributeBox.className = 'attribute';
		pokeAttributeBox.textContent = typeArray[index];
		pokeAttributeList.append(pokeAttributeBox);
	}
}

function createAbilityDiv(stateDiv) {
	const pokeAbilityList = document.querySelector('.ability-list');
	for (const property in stateDiv) {
		const ability = document.createElement('li');
		const abilityTitle = document.createElement('p')
		const abilityLevel = document.createElement('span')
		const abilityGauge = document.createElement('div');
		const activeGuage = document.createElement('div');

		ability.className = 'ability';
		abilityTitle.className = 'ability-title';
		abilityLevel.className = 'ability-level';
		abilityGauge.className = 'ability-gauge';
		activeGuage.className = 'active-gauge';

		abilityTitle.textContent = property;
		abilityLevel.textContent = stateDiv[property];
		activeGuage.style = `width: ${Number(stateDiv[property]) * 10}%`;
		activeGuage.textContent = stateDiv[property];

		ability.append(abilityTitle);
		ability.append(abilityGauge);
		abilityTitle.append(abilityLevel);
		abilityGauge.append(activeGuage);
		pokeAbilityList.append(ability);
	}
}

function createEvolutionDiv(evolutionArray) {
	const pokeEvolutionBox = document.querySelector('.evolution-list');
	evolutionArray.forEach((element) => {
		const evolutionList = document.createElement('li');
		const evolutionImg = document.createElement('img');
		const evolutionName = document.createElement('h4');
		const evolutionLevel = document.createElement('p');

		evolutionList.className = 'evolution';
		evolutionName.className = 'evolution-name';
		evolutionLevel.className = 'evolution-desc';

		evolutionImg.src = element['img'];
		evolutionName.textContent = element['name_text'];
		evolutionLevel.textContent = `${element['level']}레벨에 진화`;

		evolutionList.append(evolutionImg);
		evolutionList.append(evolutionName);
		evolutionList.append(evolutionLevel);

		pokeEvolutionBox.append(evolutionList);
	});
}

function createRecommendBuildData(itemBuild, battleItemBuild, recommendSkill) {
	// build-section 작업
	const recommendDiv = document.querySelector('.build-section > .build');
	recommendSkill.forEach((item) => {
		const rawLi = document.createElement('li');
		const img = document.createElement('img');
		const p = document.createElement('p');
		img.src = item['img'];
		p.textContent = item['name_text'];

		rawLi.append(img, p);
		recommendDiv.append(rawLi);
	});
	
	itemBuild.forEach((item) => {
		const rawLi = document.createElement('li');
		const img = document.createElement('img');
		const p = document.createElement('p');
		img.src = item['img'];
		p.textContent = item['name_text'];

		rawLi.append(img, p);
		recommendDiv.append(rawLi);
	});

	{
		const rawLi = document.createElement('li');
		const img = document.createElement('img');
		const p = document.createElement('p');
		img.src = battleItemBuild['img'];
		p.textContent = battleItemBuild['name_text'];

		rawLi.append(img, p);
		recommendDiv.append(rawLi);
	}	
}

function createSkillDiv(skillArray) {
	const skillSection = document.querySelector('.skill-section > .skill-list');
	skillArray.forEach((skill) => {
		const skillArticle = document.createElement('li');
		const skillTop = document.createElement('div');
		const skillContent = document.createElement('div');
		const skillImage = document.createElement('img');
		const skillTitle = document.createElement('div');
		const skillName = document.createElement('h3');
		const skillSummary = document.createElement('ul');
		const skillCoolTime = document.createElement('li');
		const skillType = document.createElement('li');

		skillArticle.className = 'skill';
		skillTop.className = 'skill-top';
		skillContent.className = 'skill-content';
		skillImage.className = 'skill-img';
		skillTitle.className = 'skill-title';
		skillName.className = 'skill-name';
		skillSummary.className = 'skill-summary';

		skillImage.src = skill['img'];
		// skillImage.src = "https://via.placeholder.com/140";

		skillName.textContent = skill['name_text'];
		skillCoolTime.textContent = `${skill['cooltime']}초`;
		skillType.textContent = skill['type_text'];

		const descriptionSplit = skill['description'].split('\r\n');
		for (let i in descriptionSplit) {
			const description = document.createElement('p');
			description.textContent = descriptionSplit[i];
			skillContent.append(description);
		}

		skillArticle.append(skillTop);
		skillArticle.append(skillContent);
		skillTop.append(skillImage);
		skillTop.append(skillTitle);
		skillTitle.append(skillName);
		skillTitle.append(skillSummary);
		skillSummary.append(skillType);
		if (skill['cooltime'] != 0) {
			skillSummary.append(skillCoolTime);
		}

		skillSection.append(skillArticle);
	});
}

function createPokemonData(pokemonIndex) {
	fetch(`https://pkm.gg/api/pokemon/${pokemonIndex}/`, {
		method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
		// 포켓몬 이미지
		const characterImg = document.querySelector('.character-image > img');
		characterImg.src = data['img'];

		// 포켓몬 이름
		const pokeName = document.querySelector('.character-name > h2');
		pokeName.textContent = data['name_text'];

		// 포켓몬 난이도
		const difficulty = document.querySelector('.difficulty > p');
		difficulty.textContent = data['difficulty_text'];

		// 포켓몬 타입 생성
		const typeArray = [data['type_text'], data['attack_type_text'], data['damage_type_text']];
		createTypeDiv(typeArray);

		// 포켓몬 어빌리티 생성
		const abilityDict = {
			"공격력": data['offense'],
			"방어력": data['endurance'],
			"기동성": data['mobility'],
			"득점력": data['scoring'],
			"보조능력": data['support'],
		}
		createAbilityDiv(abilityDict);
		createEvolutionDiv(data['evolution']);
		createRecommendBuildData(data['item'], data['battle_item'], data['recommend_skill']);

		const characterAttack = [
			{
				"name": data['passive_name'],
				"name_text": data['passive_name_text'],
				"type_text": "패시브",
				"img": data["passive_img"],
				"cooltime": "0",
				"description": data["passive_effect"],
			},
			{
				"name_text": "일반 공격",
				"type_text": data['damage_type_text'],
				"img": `./img/pokemon/${data['name']}/Attack.png`,
				"cooltime": "0",
				"description": data["attack_effect"],
			},
		];

		
		createSkillDiv(characterAttack);
		createSkillDiv(data['skill']);
	})
}

createPokemonData(serachQueryParam('pokemon'));