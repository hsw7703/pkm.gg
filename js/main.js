import module from "./module.js"

function createCharacterDetail() {
    const indexDiv = document.querySelector(".content > .index");
    const detailDiv = document.createElement("div");
    const detailTitle = document.createElement("div");
    const detailPkmName = document.createElement("div");
    const detailPkmType = document.createElement("div");
    const contentDiv = document.createElement("div");
    const lineDiv = document.createElement("div");
    const buildDiv = document.createElement("div");
    
    detailDiv.className = "detail";
    detailDiv.classList.add("hidden");
    detailTitle.className = "title";
    lineDiv.className = "line";
    detailPkmName.className = "pkm-name";
    detailPkmType.className = "type-label";
    contentDiv.className = "content";
    buildDiv.className = "build";
    
    module.createCharacterDetailTag(4, buildDiv);
    module.createCharacterDetailTag(3, buildDiv);
    module.createCharacterDetailTag(1, buildDiv);
    

    detailDiv.append(contentDiv);
    contentDiv.append(detailTitle, lineDiv);
    detailTitle.append(detailPkmName, detailPkmType);
    contentDiv.append(buildDiv);
    contentDiv.append(buildDiv);
    indexDiv.append(detailDiv);
}

export function createPokemonData() {

    const myStorage = localStorage;
    const types = {
        "attacker":["어택형", "type"], "speedster":["스피드형", "type"], "defender":["디펜스형", "type"],
        "all-rounder":["밸런스형", "type"], "supporter":["서포터형", "type"], "melee":["근거리", "attack_type"],
        "ranged":["원거리", "attack_type"], "physical":["물리형", "damage_type"], "special":["특수형", "damage_type"],
        "resetFilter":["초기화",""]
    };

    fetch(`https://pkm.gg/api/pokemon/?`, {
        "method": "GET",
    }).then((response) => (
        response.json()
    )).then((data) => {
        const info = JSON.stringify(data);
        myStorage.setItem("info", info);
        module.createImg(data, createCharacterDetail);
        module.filterTagCreate(types);
        
   });
}
