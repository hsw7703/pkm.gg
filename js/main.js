import module from "./module.js"

function createCharacterDetail() {
    const indexDiv = document.querySelector(".index-section > .index");
    const detailDiv = document.createElement("div");
    const detailTitle = document.createElement("div");
    const detailPkmName = document.createElement("p");
    const detailPkmType = document.createElement("p");
    const lineDiv = document.createElement("div");
    const buildDiv = document.createElement("ul");
    const lineAreaImg = document.createElement("img");
    
    detailDiv.className = "detail";
    detailDiv.classList.add("hidden");
    detailTitle.className = "title";
    lineDiv.className = "line";
    detailPkmName.className = "name-label";
    detailPkmType.className = "type-label";
    buildDiv.className = "build";
    
    module.createCharacterDetailTag(4, buildDiv);
    module.createCharacterDetailTag(3, buildDiv);
    module.createCharacterDetailTag(1, buildDiv);
    

    detailDiv.append(detailTitle, lineDiv);
    detailTitle.append(lineAreaImg, detailPkmName, detailPkmType);
    detailDiv.append(buildDiv);
    indexDiv.append(detailDiv);

    const detailViewP = document.createElement("p");
    const detailViewA = document.createElement("a");

    detailViewP.className = "link";
    detailViewA.textContent = "자세히 보기 >";
    detailViewP.append(detailViewA);
    detailDiv.append(detailViewP);
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
