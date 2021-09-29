import { createItemDetail } from "./item.js";

const filtereditemTotalUrl = new URL("https://pkm.gg/api/item/?");
const filteredcharacterTotalUrl = new URL("https://pkm.gg/api/pokemon/?");

function createCharacterDetailTag(number, buildDiv) {
    for (let i=0; i<number; i++) { 
        const itemDiv = document.createElement("div");
        const itemImg = document.createElement("img");
        const itemName = document.createElement("p");

        itemDiv.className = "item";

        buildDiv.append(itemDiv);
        itemDiv.append(itemImg, itemName);
    }
}

function inputCharacterDetailData(dataType, startIndex, inputArr) {

    dataType.forEach((element, index) => {
    const itemImg = inputArr[startIndex+index].querySelector("img");
    const itemName = inputArr[startIndex+index].querySelector("p");

    itemImg.src = element.img;
    itemName.innerText = element.name_text;
    });
}

function inputBattleItemData(dataType, startIndex, inputArr) {

    const itemImg = inputArr[startIndex].querySelector("img");
    const itemName = inputArr[startIndex].querySelector("p");

    itemImg.src = dataType.img;
    itemName.innerText = dataType.name_text;
}

function inputItemData(profileIndex, detailIndex){
    const info = localStorage.getItem("itemInfo");
    const itemInfo = JSON.parse(info);
    const detailDivArr = document.querySelectorAll(".detail");
    const selectedDetailDiv = detailDivArr[detailIndex];
    const nameLabelP = selectedDetailDiv.querySelector(".title > .name-label");
    const typeLabelP = selectedDetailDiv.querySelector(".title > .type-label");
    const descriptionP = selectedDetailDiv.querySelector(".content > .effect > p");
    const tableHeadArr = selectedDetailDiv.querySelectorAll(".spec-table > tr > th");
    const tableDataArr = selectedDetailDiv.querySelectorAll(".spec-table > tr > td");

    nameLabelP.innerText = itemInfo[profileIndex].name_text;
    typeLabelP.innerText = itemInfo[profileIndex].type_text;
    descriptionP.innerText = itemInfo[profileIndex].description;
    tableHeadArr[0].innerText = "레벨";
    tableHeadArr[1].innerText = "효과";
    tableDataArr[0].innerText = "1";
    tableDataArr[1].innerText = itemInfo[profileIndex].status_1.replace('/','\n');
    tableDataArr[2].innerText = "10";
    tableDataArr[3].innerText = itemInfo[profileIndex].status_10.replace('/','\n');
    tableDataArr[4].innerText = "20";
    tableDataArr[5].innerText = itemInfo[profileIndex].status_20.replace('/','\n');
    tableDataArr[6].innerText = "30";
    tableDataArr[7].innerText = itemInfo[profileIndex].status_30.replace('/','\n');

    const detailViewA = selectedDetailDiv.querySelector('.content > .link > a');
    detailViewA.setAttribute("href", `./index.html?item=${itemInfo[profileIndex].id}`);
}

function inputCharacterData(profileIndex, detailIndex) {
    const info = localStorage.getItem("info");
    const characterInfo = JSON.parse(info);
    const detailDivArr = document.querySelectorAll(".detail");
    const selectedDetailDiv = detailDivArr[detailIndex];
    const selectedCharacter = characterInfo[profileIndex];

    const itemNameDiv = selectedDetailDiv.querySelector(".title > .pkm-name");
    const itemTypeDiv = selectedDetailDiv.querySelector(".title > .type-label");
    const itemDivArr = selectedDetailDiv.querySelectorAll(".item");

    // console.log(selectedCharacter);
    itemNameDiv.innerText = selectedCharacter.name_text;
    itemTypeDiv.innerText = selectedCharacter.attack_type_text + " " +selectedCharacter.damage_type_text;

    inputCharacterDetailData(selectedCharacter.skill, 0, itemDivArr);
    inputCharacterDetailData(selectedCharacter.item, 4, itemDivArr);
    inputBattleItemData(selectedCharacter.battle_item, 7, itemDivArr);

    const detailViewA = selectedDetailDiv.querySelector('.content > .link > a');
    detailViewA.setAttribute("href", `./pokemon-detail.html?pokemon=${characterInfo[profileIndex].id}`);
}

function filterTagCreate(types) {
    Object.keys(types).forEach((element) => {
        const filterDiv = document.querySelector(".container > .content > .filter");
        const filterItemDiv = document.createElement("div");
        filterDiv.append(filterItemDiv);
        filterItemDiv.className = "filter-item";
        filterItemDiv.onclick = filterEvent;
        filterItemDiv.innerText = types[element][0];
        filterItemDiv.typeValue = types[element][1];
        filterItemDiv.typeName = element;

       // if ()
    })
}
function filterData(url) {

    const contentDiv = document.querySelector(".content");
    const indexDiv = contentDiv.lastChild;
    contentDiv.removeChild(indexDiv);
    fetch(url, {
        "method": 'GET',
    }).then((response) => (
        response.json()
    )).then((data) => {
        createImg(data, createItemDetail);
    });
}
function filterEvent(e) {

    const filterName = e.currentTarget.typeName;
    const filterTypeValue = e.currentTarget.typeValue;

    if (document.URL.includes("item")) {
        const filterArray = filtereditemTotalUrl.searchParams.getAll("type");
        if (e.currentTarget.typeName === "resetFilter") {
            filtereditemTotalUrl.searchParams.delete("type");
        }
        else if (!filterArray.includes(filterName)) {
            filtereditemTotalUrl.searchParams.append("type", filterName);
        }
        else {
            const filters = filterArray.filter(param => param !== filterName);
            filtereditemTotalUrl.searchParams.delete("type");
            for (const param of filters)
                filtereditemTotalUrl.searchParams.append("type", param);
        }
        filterData(filtereditemTotalUrl);
    }
    else {
       const filterTypeArr = filteredcharacterTotalUrl.searchParams.getAll("type");
       const filterAttackTypeArr = filteredcharacterTotalUrl.searchParams.getAll("attack_type");
       const filterDamageTypeArr = filteredcharacterTotalUrl.searchParams.getAll("damage_type");
       const filterAllTypeArr = filterTypeArr + filterAttackTypeArr + filterDamageTypeArr;
       console.log(filterName);

       if (e.currentTarget.typeName === "resetFilter") {
           filteredcharacterTotalUrl.searchParams.delete("type");
           filteredcharacterTotalUrl.searchParams.delete("attack_type");
           filteredcharacterTotalUrl.searchParams.delete("damage_type");
       }
       else if (!filterAllTypeArr.includes(filterName)) {
           if (filterTypeValue === "type")
               filteredcharacterTotalUrl.searchParams.append("type", filterName);
           else if (filterTypeValue === "attack_type")
               filteredcharacterTotalUrl.searchParams.append("attack_type", filterName);
           else
               filteredcharacterTotalUrl.searchParams.append("damage_type", filterName);
       }
       else {
           console.log(filterAllTypeArr);
           const typeFilters = filterTypeArr.filter(param => param !== filterName);
           const attackTypeFilters = filterAttackTypeArr.filter(param => param !== filterName);
           const damageTypeFilters = filterDamageTypeArr.filter(param => param !== filterName);
           filteredcharacterTotalUrl.searchParams.delete("type");
           filteredcharacterTotalUrl.searchParams.delete("attack_type");
           filteredcharacterTotalUrl.searchParams.delete("damage_type");
           for(const param of typeFilters)
               filteredcharacterTotalUrl.searchParams.append("type", param);
           for (const param of attackTypeFilters)
               filteredcharacterTotalUrl.searchParams.append("attack_type", param);
           for (const param of damageTypeFilters)
               filteredcharacterTotalUrl.searchParams.append("damage_type", param);
       }
       console.log(filteredcharacterTotalUrl);
       filterData(filteredcharacterTotalUrl);
    }
    e.currentTarget.classList.toggle('active');
}

function hideToggle(e) {
    let itemIndex = 0;
    let detailBoxIndex = 0;
    if (e.currentTarget.infomation === "item") {
        const info = localStorage.getItem("itemInfo");
        const itemInfo = JSON.parse(info);
        itemInfo.forEach((data, index) => {
            if (e.currentTarget.id == data.id) {
                itemIndex = index;
            }
        });
        detailBoxIndex = parseInt(parseInt(itemIndex) / 4);
        inputItemData(itemIndex, detailBoxIndex);
    }
    else {
        const info = localStorage.getItem("info");
        const itemInfo = JSON.parse(info);
        itemInfo.forEach((data, index) => {
            if (e.currentTarget.id == data.id) {
                itemIndex = index;
            }
        });
        detailBoxIndex = parseInt(parseInt(itemIndex) / 4);
        inputCharacterData(itemIndex, detailBoxIndex);
    }
    const detailBoxes = document.querySelectorAll(".detail");
    const selectedDetailBox = detailBoxes[detailBoxIndex];
    detailBoxes.forEach((element) => {
        element.classList.add("hidden");
    })
    selectedDetailBox.classList.toggle("hidden");
    document.querySelectorAll('.index > .profile').forEach((element) => {
        element.classList.remove("active");
    })
    e.currentTarget.classList.toggle("active");
}

function createImg(info, detailFunction) {
    const contentDiv = document.querySelector(".content");
    const indexDiv = document.createElement("div");
    contentDiv.append(indexDiv);
    indexDiv.className = "index";
    info.forEach((element, childIndex) => {
        const index = element.id;
        const profileDiv = document.createElement("div");
        const itemImg = document.createElement("img");
        const type = element.type;
        indexDiv.append(profileDiv);
        profileDiv.append(itemImg);
        profileDiv.onclick = hideToggle;
        profileDiv.className = "profile"
        profileDiv.classList.add = type;
        profileDiv.id = index;
        itemImg.src = element.img;
        itemImg.className = element.type;
        if ((itemImg.src).includes("held-items")) {
            profileDiv.infomation = "item";
        }
        else{
            profileDiv.infomation = "character";
        }
        if (childIndex !== 0 && childIndex % 4 === 3) {
            detailFunction();
        }
        else if (childIndex === info.length-1 && info.length-1 % 4 !== 0)
            detailFunction();
    });
}

export default {
    createImg,
    createCharacterDetailTag,
    filterTagCreate
}