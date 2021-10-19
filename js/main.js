import module from "./module.js"

function createCharacterDetail() {
    const indexDiv = document.querySelector(".index-section > .index");
    const detailDiv = document.createElement("div");
    const detailTitle = document.createElement("div");
    const detailPkmName = document.createElement("p");
    const detailPkmType = document.createElement("p");
    const buildDiv = document.createElement("ul");
    const lineAreaImg = document.createElement("img");
    const detailButtonList = document.createElement('ul');
    const buildListLi = document.createElement('li');
    const buildListP = document.createElement('p');
    const detailViewLi = document.createElement('li');
    const detailViewP = document.createElement("p");
    
    detailDiv.className = "detail";
    detailDiv.classList.add("hidden");
    detailTitle.className = "title";
    detailPkmName.className = "name-label";
    detailPkmType.className = "type-label";
    buildDiv.className = "build";
    lineAreaImg.className = "lane-icon";
    
    module.createCharacterDetailTag(4, buildDiv);
    module.createCharacterDetailTag(3, buildDiv);
    module.createCharacterDetailTag(1, buildDiv);
    

    detailDiv.append(detailTitle, detailButtonList);
    detailTitle.append(lineAreaImg, detailPkmName, detailPkmType);
    detailDiv.append(buildDiv);
    indexDiv.append(detailDiv);


    detailButtonList.className = "detail-button-list";
    buildListP.textContent = "빌드 목록";
    detailViewP.textContent = "캐릭터 정보";
    
    buildListLi.append(buildListP);
    detailViewLi.append(detailViewP);
    detailButtonList.append(buildListLi, detailViewLi);
}

function createPokemonData() {

    const myStorage = localStorage;
    const types = {
        "attacker":["어택형", "type"],  "defender":["디펜스형", "type"], "speedster":["스피드형", "type"],
        "all-rounder":["밸런스형", "type"], "supporter":["서포터형", "type"], "physical":["물리형", "damage_type"],
        "special":["특수형", "damage_type"], "melee":["근거리", "attack_type"],  "ranged":["원거리", "attack_type"],
        "resetFilter":["초기화",""]
    };

    fetch(`https://pkm.gg/api/pokemon/?`, {
        "method": "GET",
    }).then((response) => (
        response.json()
    )).then((data) => {
        const info = JSON.stringify(data);
        myStorage.setItem("info", info);
        module.filterSetting(types);
        module.createImg(data, createCharacterDetail);
   });
}

export {
    createCharacterDetail,
    createPokemonData
}
