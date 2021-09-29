function serachQueryParam(key) {
	return new URLSearchParams(location.search).get(key);
}

function createTypeDiv(typeArray) {
	// 포켓몬 타입 생성
	const pokeAttributeList = document.querySelector('.attribute_list');
	for (let index = 0; index < 3; index++) {
		const pokeAttributeBox = document.createElement('li')
		pokeAttributeBox.className = 'attribute';
		pokeAttributeBox.textContent = typeArray[index];
		pokeAttributeList.append(pokeAttributeBox);
	}
}

function createAbilityDiv(stateDiv) {
	const pokeAbilityList = document.querySelector('.ability_list');
	for (const property in stateDiv) {
		const ability = document.createElement('li');
		const abilityTitle = document.createElement('p')
		const abilityLevel = document.createElement('span')
		const abilityGauge = document.createElement('div');
		const activeGuage = document.createElement('div');

		ability.className = 'ability';
		abilityTitle.className = 'ability_title';
		abilityLevel.className = 'ability_level';
		abilityGauge.className = 'ability_gauge';
		activeGuage.className = 'active_gauge';

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
	const pokeEvolutionBox = document.querySelector('.evolution_box');
	evolutionArray.forEach((element) => {
		const evolutionDiv = document.createElement('div');
		const evolutionImgDiv = document.createElement('div');
		const evolutionImg = document.createElement('img');
		const evolutionName = document.createElement('h4');
		const evolutionLevel = document.createElement('p');

		const tempDiv = document.createElement('div');

		evolutionDiv.className = 'evolution';
		evolutionImgDiv.className = 'evolution_img';
		evolutionName.className = 'evolution_name';
		evolutionLevel.className = 'evolution_desc';

		evolutionImg.src = element['img'];
		evolutionName.textContent = element['name_text'];
		evolutionLevel.textContent = `${element['level']}레벨에 진화`;

		evolutionDiv.append(evolutionImgDiv);
		evolutionDiv.append(evolutionName);
		evolutionDiv.append(evolutionLevel);
		tempDiv.append(evolutionImg);
		evolutionImgDiv.append(tempDiv);

		pokeEvolutionBox.append(evolutionDiv);
	});
}

function createRecommendBuildData(itemBuild, battleItemBuild, recommendSkill) {
	const recommendDiv = document.querySelector('#recommend');
	itemBuild.forEach((item) => {
		const rawLi = document.createElement('li');
		const rawDiv = document.createElement('div');
		const img = document.createElement('img');
		img.src = item['img'];
		img.alt = item['name_text'];

		rawDiv.append(img);
		rawLi.append(rawDiv);
		recommendDiv.append(rawLi);
	});

	{
		const rawLi = document.createElement('li');
		const rawDiv = document.createElement('div');
		const img = document.createElement('img');
		img.src = battleItemBuild['img'];
		img.alt = battleItemBuild['name_text'];

		rawDiv.append(img);
		rawLi.append(rawDiv);
		recommendDiv.append(rawLi);
	}

	recommendSkill.forEach((item) => {
		const rawLi = document.createElement('li');
		const rawDiv = document.createElement('div');
		const img = document.createElement('img');
		img.src = item['img'];
		img.alt = item['name_text'];

		rawDiv.append(img);
		rawLi.append(rawDiv);
		recommendDiv.append(rawLi);
	});
}

function createSkillDiv(skillArray) {
	const skillSection = document.querySelector('.skill_section');
	skillArray.forEach((skill) => {
		const skillArticle = document.createElement('article');
		const skillTop = document.createElement('div');
		const skillContent = document.createElement('div');
		const skillImageDiv = document.createElement('div');
		const skillTitle = document.createElement('div');
		const skillImage = document.createElement('img');
		const skillName = document.createElement('h3');
		const skillSummary = document.createElement('ul');
		const skillCoolTime = document.createElement('li');
		const skillType = document.createElement('li');

		skillArticle.className = 'skill';
		skillTop.className = 'skill_top';
		skillContent.className = 'skill_content';
		skillImageDiv.className = 'skill_img';
		skillTitle.className = 'skill_title';
		skillName.className = 'skill_name';
		skillSummary.className = 'skill_summary';

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
		skillTop.append(skillImageDiv);
		skillTop.append(skillTitle);
		skillImageDiv.append(skillImage);
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
		const characterImgDiv = document.querySelector('.character_image');
		const characterImg = document.createElement('img');
		characterImg.src = data['img'];
		characterImgDiv.append(characterImg);

		// 포켓몬 이름
		const pokeNameDiv = document.querySelector('.character_name');
		const pokeName = document.createElement('h2');
		pokeName.textContent = data['name_text'];
		pokeNameDiv.appendChild(pokeName);

		// 포켓몬 난이도
		const difficultyDiv = document.querySelector('.difficulty');
		const difficulty = document.createElement('p');
		// difficulty.textContent = data['']
		difficulty.textContent = "중급자";
		difficultyDiv.append(difficulty);

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
		createSkillDiv(data['skill']);
	})
}

createPokemonData(serachQueryParam('pokemon'));

// function createPokemonDetail() {
// 	const pokemonIndex = serachQueryParam("pokemon");

// 	fetch(`http://pkm.gg/api/pokemon/${pokemonIndex}`, {
// 		method: "GET",
// 	}).then((response) => {
// 		const infoSection = document.querySelector(".info_section");

// 		// 캐릭터 이미지 생성
// 		const charImgDiv = document.createElement("div");
// 		charImgDiv.className = "character_image";

// 		const charImg = document.createElement("img");
// 		charImg.src = response["img"];
// 		charImg.alt = "캐릭터 이미지";

// 		charImgDiv.append(charImg);
// 		infoSection.append(charImgDiv);

// 		// INFOBOX 생성
// 		const infoBoxDiv = document.createElement("div");
// 		infoBoxDiv.className = "info_box";

// 		const nameBoxDiv = document.createElement("div");
// 		nameBoxDiv.className = "name_box";

// 		const charNameDiv = document.createElement("div");
// 		charNameDiv.className = "character_name";
// 		const charNameH2 = document.createElement("h2");
// 		charNameH2.textContent = response["name_text"];
// 		charNameDiv.append(charNameH2);
// 		nameBoxDiv.append(charNameDiv);

// 		const difficultyDiv = document.createElement("div");
// 		difficultyDiv.className = ""
// 	})

// }
