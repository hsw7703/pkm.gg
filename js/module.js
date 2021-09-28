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
}

function inputCharacterData(profileIndex, detailIndex) {
    const info = localStorage.getItem("info");
    const itemInfo = JSON.parse(info);
    const detailDivArr = document.querySelectorAll(".detail");
    const selectedDetailDiv = detailDivArr[detailIndex];
    const selectedCharacter = itemInfo[profileIndex];

    const itemNameDiv = selectedDetailDiv.querySelector(".title > .pkm-name");
    const itemTypeDiv = selectedDetailDiv.querySelector(".title > .type-label");
    const itemDivArr = selectedDetailDiv.querySelectorAll(".item");

    console.log(selectedCharacter);
    itemNameDiv.innerText = selectedCharacter.name_text;
    itemTypeDiv.innerText = selectedCharacter.attack_type_text + " " +selectedCharacter.damage_type_text;

    inputCharacterDetailData(selectedCharacter.skill, 0, itemDivArr);
    inputCharacterDetailData(selectedCharacter.item, 4, itemDivArr);
    inputBattleItemData(selectedCharacter.battle_item, 7, itemDivArr);
}

function filterTagCreate(types) {
    Object.keys(types).forEach((element) => {
        const filterDiv = document.querySelector(".container > .content > .filter");
        const filterItemDiv = document.createElement("div");

        filterDiv.append(filterItemDiv);
        filterItemDiv.className = "filter-item";
        filterItemDiv.onclick = filterEvent;
        filterItemDiv.innerText = types[element];
        filterItemDiv.typeName = element;
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
    if (document.URL.includes("item")) {
        const filterArray = filtereditemTotalUrl.searchParams.getAll("type")
        const filterName = e.currentTarget.typeName;
        if (e.currentTarget.typeName === "resetFilter")
            filtereditemTotalUrl.searchParams.delete("type");
        else if (!filterArray.includes(e.currentTarget.typeName))
            filtereditemTotalUrl.searchParams.append("type", e.currentTarget.typeName);
        else {
            const filters = filterArray.filter(param => param !== filterName);
            filtereditemTotalUrl.searchParams.delete("type");
            for (const param of filters)
                filtereditemTotalUrl.searchParams.append("type", param);
            filterData(filtereditemTotalUrl);
            console.log(filtereditemTotalUrl);
        }
    }
}



function hideToggle(e) {
    const itemIndex = e.currentTarget.id;
    const detailBoxIndex = parseInt(parseInt(itemIndex) / 4);
    if (e.currentTarget.infomation === "item") {
        inputItemData(itemIndex, detailBoxIndex);
    }
    else {
        inputCharacterData(itemIndex, detailBoxIndex);
    }
    const detailBoxes = document.querySelectorAll(".detail");
    const selectedDetailBox = detailBoxes[detailBoxIndex];
    detailBoxes.forEach((element) => {
        element.classList.add("hidden");
    })
    selectedDetailBox.classList.toggle("hidden");
}

function createImg(info, detailFunction) {
    const contentDiv = document.querySelector(".content");
    const indexDiv = document.createElement("div");
    contentDiv.append(indexDiv);
    indexDiv.className = "index";
    info.forEach((element, index) => {
        const profileDiv = document.createElement("div");
        const itemImg = document.createElement("img");
        const type = info[index].type;
        indexDiv.append(profileDiv);
        profileDiv.append(itemImg);
        profileDiv.onclick = hideToggle;
        profileDiv.className = "profile"
        profileDiv.classList.add = type;
        profileDiv.id = index;
        itemImg.src = info[index].img;
        itemImg.className = info[index].type;
        if ((itemImg.src).includes("held-items")) {
            profileDiv.infomation = "item";
        }
        else{
            profileDiv.infomation = "character";
        }
        if (index !== 0 && index % 4 === 3)
            detailFunction();
        else if (index === info.length-1 && info.length-1 % 4 !== 0)
            detailFunction();
    });

    const detailContent = document.querySelectorAll('.detail > .content');

    detailContent.forEach((element) => {
        const detailViewP = document.createElement("p");
        const detailViewA = document.createElement("a");
    
        detailViewP.className = "link";
        detailViewA.setAttribute("href", "./index.html");
        detailViewA.textContent = "자세히 보기 >";
    
        element.append(detailViewP);
        detailViewP.append(detailViewA);
    })
    
}

export default {
    createImg,
    createCharacterDetailTag,
    filterTagCreate
}