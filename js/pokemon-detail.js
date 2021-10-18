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
	const recommendDiv = document.querySelectorAll('.build-section > .build')[0];
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

const tabMenu = document.querySelectorAll(".build-section .build-tab li");
const tabCon = document.querySelectorAll(".build");
function tabOff(items) {
    items.forEach((item) => {
        item.classList.remove("active");
    });
}

function tabHandler(tab, index) {
    tab.addEventListener("click", () => {
        tabOff(tabMenu);
        tabOff(tabCon);
        tabMenu[index].classList.add("active");
        tabCon[index].classList.add("active");
    });
}
function tabSwitch() {
    tabMenu.forEach((tab, index) => tabHandler(tab, index));
}

function selectSkillBuild(selectBox, pokemonSkillInfo) {
  const selectSkillList = selectBox.querySelectorAll('.skill-select li');

  selectSkillList.forEach((selectLevelSkill, index) => {
    const skillImgList = selectLevelSkill.querySelectorAll('img');
    const skillNameList = selectLevelSkill.querySelectorAll('p');

    for (let i = 0; i < 2; ++i) {
      skillImgList[i].src = pokemonSkillInfo[index * 2 + i]['img'];
      skillImgList[i].setAttribute('id', `${pokemonSkillInfo[index * 2 + i]['name']}`);
      skillNameList[i + 1].textContent = pokemonSkillInfo[index * 2 + i]['name_text'];
    };
  });

  const fillBuild = document.querySelectorAll('.build')[1];
  const fillSkillList = fillBuild.querySelectorAll('li');
  selectSkillList[0].querySelectorAll('img').forEach((img) => {
    img.addEventListener("click", (event) => {
      const parentNode = event.currentTarget.parentNode.querySelectorAll('img');
      const fillSkill1 = fillSkillList[0].querySelector('img');
      const fillSkill1Name = fillSkillList[0].querySelector('p');
      const fillSkill2 = fillSkillList[1].querySelector('img');
      const fillSkill2Name = fillSkillList[1].querySelector('p');

      parentNode.forEach((node) => {
        node.classList.remove("active");
      });
      event.currentTarget.classList.add("active");
      
      if (parentNode[0] == event.currentTarget) {
        fillSkill1.src = parentNode[0].src;
        fillSkill1.setAttribute('id', `selected_${parentNode[0].getAttribute('id')}`);
        fillSkill1Name.textContent = pokemonSkillInfo[0].name_text;
        fillSkill2.src = parentNode[1].src;
        fillSkill2.setAttribute('id', `selected_${parentNode[1].getAttribute('id')}`);
        fillSkill2Name.textContent = pokemonSkillInfo[1].name_text;
      } else {
        fillSkill1.src = parentNode[1].src;
        fillSkill1.setAttribute('id', `selected_${parentNode[1].getAttribute('id')}`);
        fillSkill1Name.textContent = pokemonSkillInfo[1].name_text;
        fillSkill2.src = parentNode[0].src;
        fillSkill2.setAttribute('id', `selected_${parentNode[0].getAttribute('id')}`);
        fillSkill2Name.textContent = pokemonSkillInfo[0].name_text;
      }
    })
  });
  selectSkillList[1].querySelectorAll('img').forEach((img) => {
    img.addEventListener("click", (event) => {
      const parentNode = event.currentTarget.parentNode.querySelectorAll('img');
      const fillSkill = fillSkillList[2].querySelector('img');
      const fillSkillName = fillSkillList[2].querySelector('p');

      parentNode.forEach((node) => {
        node.classList.remove("active");
      });
      event.currentTarget.classList.add("active");

      fillSkill.src = event.currentTarget.src;
      fillSkill.setAttribute('id', event.currentTarget.getAttribute('id'));
      if (parentNode[0] == event.currentTarget) {
        fillSkillName.textContent = pokemonSkillInfo[2].name_text;
      } else {
        fillSkillName.textContent = pokemonSkillInfo[3].name_text;
      }
    });
  });
  selectSkillList[2].querySelectorAll('img').forEach((img) => {
    img.addEventListener("click", (event) => {
      const parentNode = event.currentTarget.parentNode.querySelectorAll('img');
      const fillSkill = fillSkillList[3].querySelector('img');
      const fillSkillName = fillSkillList[3].querySelector('p');
      
      parentNode.forEach((node) => {
        node.classList.remove("active");
      });
      event.currentTarget.classList.add("active");

      fillSkill.src = event.currentTarget.src;
      fillSkill.setAttribute('id', event.currentTarget.getAttribute('id'));
      if (parentNode[0] == event.currentTarget) {
        fillSkillName.textContent = pokemonSkillInfo[4].name_text;
      } else {
        fillSkillName.textContent = pokemonSkillInfo[5].name_text;
      }
    });
  });
}

function selectHeldItemBuild(selectBox) {
  const heldItemsInfo = JSON.parse(localStorage.getItem('heldItemsInfo'));
  const heldItemList = selectBox.querySelectorAll('.held-item-list > li');
  let fillHeldsItems = Array();
  tabCon[1].childNodes.forEach((childNode) => {
    if (childNode.localName === "li")
     fillHeldsItems.push(childNode);
  })
 fillHeldsItems = fillHeldsItems.slice(4, 7);
  const selectedHeldItemsList = Array();
  
  heldItemList.forEach((heldItemBox) => {
    heldItemBox.addEventListener("click", (event) => {
      
      const isSelectedIndex = selectedHeldItemsList.indexOf(event.currentTarget);
      
      if (isSelectedIndex !== -1) {
        selectedHeldItemsList.splice(isSelectedIndex, 1);
        heldItemBox.classList.remove('active');
      } else {
        if (selectedHeldItemsList.length < 3) {
          selectedHeldItemsList.push(event.currentTarget);
          heldItemBox.classList.add('active');
        } else {
          return ;
        }
      }

      selectedHeldItemsList.forEach((selectedHeldItem, index) => {
        const selectHeldItem = heldItemsInfo.find((heldItem) => (
          heldItem['name'] === selectedHeldItem.childNodes[0].getAttribute('id')
        ));

        const viewImg = fillHeldsItems[index].querySelector('img');
        const viewName = fillHeldsItems[index].querySelector('p');
        viewImg.src = selectHeldItem['img'];
        viewImg.setAttribute('id', `selected_${selectHeldItem['name']}`);
        viewName.textContent = selectHeldItem['name_text'];
      })

      for (let i = selectedHeldItemsList.length; i < 3; ++i) {
        const viewImg = fillHeldsItems[i].querySelector('img');
        const viewName = fillHeldsItems[i].querySelector('p');
        viewImg.src = './img/plus.png';
        viewImg.removeAttribute('id');
        viewName.textContent = '';
      }
    })
  })
}

function selectBuild() {
  const myStorage = localStorage;
  const buildList = tabCon[1].querySelectorAll('.build > li');
  const selectBoxList = tabCon[1].querySelectorAll(".select-box");
  const pokemonInfo = JSON.parse(myStorage.getItem("pokemonDetailInfo"));

  const skillSelectList = selectBoxList[0].querySelectorAll('.skill-select li');
  skillSelectList.forEach((listBox, index) => {
    const levelP = listBox.querySelector('.level');
    levelP.textContent = `${pokemonInfo['skill'][index * 2]['level']}레벨`;
  });

  for (let i = 0; i < 4; ++i) {
    buildList[i].addEventListener("click", () => {
      selectBoxList.forEach((selectBox) => {
        selectBox.classList.remove("active");
      });
      selectBoxList[0].classList.add("active");
    })
  }

  for (let i = 4; i < 7; ++i) {
    buildList[i].addEventListener("click", () => {
      selectBoxList.forEach((selectBox) => {
        selectBox.classList.remove("active");
      })
      selectBoxList[1].classList.add("active");
    })
  }

  buildList[7].addEventListener("click", () => {
    selectBoxList.forEach((selectBox) => {
      selectBox.classList.remove("active");
    })
    selectBoxList[2].classList.add("active");
  })

  selectSkillBuild(selectBoxList[0], pokemonInfo['skill']);
}

function createHeldItemList() {
  fetch(`https://pkm.gg/api/held-items/`, {
    method: 'GET',
  }).then((response) => (
    response.json()
  )).then((data) => {
    const myStorage = localStorage;
    const heldItemsInfo = JSON.stringify(data);
    myStorage.setItem('heldItemsInfo', heldItemsInfo);

    const heldItemSelectBox = document.getElementById('held-item-select');
    const heldItemList = heldItemSelectBox.querySelector('.held-item-list');

    data.forEach((heldItem) => {
      const heldItemLi = document.createElement('li');
      const heldItemImg = document.createElement('img');
      const heldItemName = document.createElement('p');
      heldItemImg.setAttribute('id', heldItem['name']);
      heldItemImg.src = heldItem['img'];
      heldItemLi.append(heldItemImg, heldItemName);
      heldItemList.append(heldItemLi);
    });

    selectHeldItemBuild(heldItemSelectBox);
  })
}

function selectedBattleItemBuild(selectBox) {
  const battleItemsInfo = JSON.parse(localStorage.getItem('battleItemsInfo'));
  const battleItemList = selectBox.querySelectorAll('.battle-item-list > li');

  let fillBuild = Array();
  tabCon[1].childNodes.forEach((childNode) => {
    if (childNode.localName === "li")
     fillBuild.push(childNode);
  })
 fillBattleItem = fillBuild[7];

  battleItemList.forEach((battleItemBox) => {
    battleItemBox.addEventListener("click", (event) => {
      battleItemList.forEach((battleItemBox) => {
        battleItemBox.classList.remove("active");
      });
      battleItemBox.classList.add("active");
        const viewImg = fillBattleItem.querySelector('img');
        const viewName = fillBattleItem.querySelector('p');
        const selectBattleItem = battleItemsInfo.find((battleItem) => (
          battleItem['name'] === event.currentTarget.childNodes[0].getAttribute('id')
        ));

        viewImg.src = selectBattleItem['img'];
        viewImg.setAttribute('id', `selected_${selectBattleItem['name']}`)
        viewName.textContent = selectBattleItem['name_text'];
    });
  });
}

function createBattleItemList() {
  fetch(`https://pkm.gg/api/battle-items/`, {
    method: 'GET',
  }).then((response) => (
    response.json()
  )).then((data) => {
    const myStorage = localStorage;
    const battleItemsInfo = JSON.stringify(data);
    myStorage.setItem('battleItemsInfo', battleItemsInfo);

    const battleItemSelectBox = document.getElementById('battle-item-select');
    const battleItemList = battleItemSelectBox.querySelector('.battle-item-list');

    data.forEach((battleItem) => {
      const battleItemLi = document.createElement('li');
      const battleItemImg = document.createElement('img');
      const battleItemName = document.createElement('p');
      battleItemImg.setAttribute('id', battleItem['name']);
      battleItemImg.src = battleItem['img'];
      battleItemLi.append(battleItemImg, battleItemName);
      battleItemList.append(battleItemLi);
    });

    selectedBattleItemBuild(battleItemSelectBox);
  })
}

function createPokemonData(pokemonIndex) {
  const myStorage = localStorage;

	fetch(`https://pkm.gg/api/pokemon/${pokemonIndex}/`, {
		method: 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
    const pokemonDetailInfo = JSON.stringify(data);
    myStorage.setItem("pokemonDetailInfo", pokemonDetailInfo);

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

    createHeldItemList();
    createBattleItemList();

    tabSwitch();
    selectBuild();
	})
}

createPokemonData(serachQueryParam('pokemon'));