import { createItemDetail } from "./item.js";
import { createCharacterDetail } from "./main.js";
import { createNews } from "./news.js";

const filtereditemTotalUrl = new URL("https://pkm.gg/api/held-items/?");
const filteredcharacterTotalUrl = new URL("https://pkm.gg/api/pokemon/?");
const filterednewsTotalUrl = new URL("https://pkm.gg/api/news/?");

function createCharacterDetailTag(number, buildDiv) {
    for (let i=0; i<number; i++) { 
        const itemDiv = document.createElement("li");
        const itemImg = document.createElement("img");
        const itemName = document.createElement("p");

        buildDiv.append(itemDiv);
        itemDiv.append(itemImg, itemName);
    }
}

function inputCharacterDetailData(dataType, startIndex, inputArr, selectedCharacterIndex = 1) {

    dataType.forEach((element, index) => {
    const itemImg = inputArr[startIndex+index].querySelector("img");
    const itemName = inputArr[startIndex+index].querySelector("p");

    if (startIndex === 0) {
        itemImg.setAttribute('onclick', `location.href='./pokemon-detail.html?pokemon=${selectedCharacterIndex}'`);
    } else if (startIndex === 4) {
        itemImg.setAttribute('onclick', `location.href='./item-detail.html?item=${element.id}'`);
    } else if (startIndex === 7) {
        itemImg.setAttribute('onclick', `location.href='./battle-item-detail.html?battle-item=${element.id}'`)
    }

    itemImg.src = element.img;
    itemName.innerText = element.name_text;
    });
}

function inputBattleItemDetailData(dataType, startIndex, inputArr) {

    const itemImg = inputArr[startIndex].querySelector("img");
    const itemName = inputArr[startIndex].querySelector("p");

    itemImg.src = dataType.img;
    itemImg.setAttribute('onclick', `location.href='./battle-item-detail.html?battle-item=${dataType['id']}'`);
    itemName.innerText = dataType.name_text;
}

function inputItemData(infoArr, selectedDetailDiv){
    const nameLabelP = selectedDetailDiv.querySelector(".title > .name-label");
    const typeLabelP = selectedDetailDiv.querySelector(".title > .type-label");
    const descriptionP = selectedDetailDiv.querySelector(".effect");
    const tableHeadArr = selectedDetailDiv.querySelectorAll(".spec-table > thead > tr > th");
    const tableDataArr = selectedDetailDiv.querySelectorAll(".spec-table > tbody > tr > td");
    
    const statusIncrease = infoArr.status_increase.split(' / ');
    nameLabelP.innerText = infoArr.name_text;
    typeLabelP.innerText = infoArr.type_text;
    descriptionP.innerText = infoArr.description;
    tableHeadArr[0].innerText = "레벨";
    tableHeadArr[1].innerText = "효과";
    tableDataArr[0].innerText = "상승 효과";
    tableDataArr[2].innerText = "10";
    tableDataArr[4].innerText = "20";
    tableDataArr[6].innerText = "30";
    tableDataArr[1].innerHTML = "";
    tableDataArr[3].innerHTML = "";
    tableDataArr[5].innerHTML = "";
    tableDataArr[7].innerHTML = "";
    statusIncrease.forEach((status, index) => {
        tableDataArr[1].innerHTML += status;
        tableDataArr[3].innerHTML += status + ' ' + infoArr.status_10.split(' / ')[index];
        tableDataArr[5].innerHTML += status + ' ' + infoArr.status_20.split(' / ')[index];
        tableDataArr[7].innerHTML += status + ' ' + infoArr.status_30.split(' / ')[index];
        if (statusIncrease.length !== index + 1) {
            tableDataArr[1].innerHTML += '<br>';
            tableDataArr[3].innerHTML += '<br>';
            tableDataArr[5].innerHTML += '<br>';
            tableDataArr[7].innerHTML += '<br>';
        }
    });

    const detailViewA = selectedDetailDiv.querySelector('.link > a');
    detailViewA.setAttribute("href", `./item-detail.html?item=${infoArr.id}`);
}

function inputBattleItemData(infoArr, selectedDetailDiv){
    const nameLabelDiv = selectedDetailDiv.querySelector(".title > .name-label");
    const typeLabelDiv = selectedDetailDiv.querySelector(".title > .type-label");
    const unlockDiv = selectedDetailDiv.querySelector('.unlock')
    const descriptionDiv = selectedDetailDiv.querySelector(".effect");

    nameLabelDiv.textContent = infoArr.name_text;
    typeLabelDiv.textContent = `${infoArr.cooltime}초`;
    unlockDiv.textContent = `트레이너 레벨 ${infoArr.level} 달성`;
    descriptionDiv.textContent = infoArr.effect;

    const detailViewA = selectedDetailDiv.querySelector('.link > a');
    detailViewA.setAttribute("href", `./battle-item-detail.html?battle-item=${infoArr.id}`);
}

function inputCharacterData(infoArr, selectedDetailDiv) {
    const selectedCharacter = infoArr;

    const itemNameDiv = selectedDetailDiv.querySelector(".title > .name-label");
    const itemTypeDiv = selectedDetailDiv.querySelector(".title > .type-label");
    const itemDivArr = selectedDetailDiv.querySelectorAll("li");

    itemNameDiv.innerText = selectedCharacter.name_text;
    itemTypeDiv.innerText = selectedCharacter.attack_type_text + " " +selectedCharacter.damage_type_text;

    inputCharacterDetailData(selectedCharacter.skill, 0, itemDivArr, selectedCharacter.id);
    inputCharacterDetailData(selectedCharacter.item, 4, itemDivArr);
    inputBattleItemDetailData(selectedCharacter.battle_item, 7, itemDivArr);

    const detailViewA = selectedDetailDiv.querySelector('.link > a');
    detailViewA.setAttribute("href", `./pokemon-detail.html?pokemon=${selectedCharacter.id}`);
}

function filterSetting(types) {
    const filterAllDiv = document.querySelectorAll(".filter-item");
    const filterButton = document.querySelector(".filter-button");
    const filterSection = document.querySelector(".filter-section");
    const keys = Object.keys(types);
    const values = Object.values(types);
    filterSection.classList.add("hidden");
    filterButton.onclick = filterButtonEvent;
    filterAllDiv.forEach((element, index) => {
        element.onclick = filterEvent;
        element.typeArr = types;
        element.typeName = keys[index];
        element.typeValue = values[index][1];
    });
}

function filterButtonEvent(e) {
    const target = e.currentTarget;
    const filterSection = document.querySelector(".filter-section");
    target.classList.toggle("active");
    filterSection.classList.toggle("hidden");

}

function filterData(url) {
    if (document.URL.includes("news")) {
        const newsUl = document.querySelector(".news-list");
        while (newsUl.firstChild)
            newsUl.removeChild(newsUl.firstChild);
    }
    else {
        const indexDiv = document.querySelector(".index");
        while (indexDiv.firstChild)
            indexDiv.removeChild(indexDiv.firstChild);
    }
    fetch(url, {
        "method": 'GET',
    }).then((response) => (
        response.json()
    )).then((data) => {
        if (document.URL.includes("item"))
            createImg(data, createItemDetail);
        else if (document.URL.includes("news")) {
            data.reverse();
            data.forEach((element) => {
                const img = element.img;
                const title = element.title;
                const date = element.date;
                const url = element.url;
                createNews(img, title, date, url);
            });
        }
        else
            createImg(data, createCharacterDetail);
    });
}

function filterEvent(e) {

    const target = e.currentTarget;
    const filterArr = target.parentNode.querySelectorAll("li");
    if (!(target.typeName === "resetFilter")) {
        target.classList.toggle("active");
    }
    else {
        filterArr.forEach(element => {
            element.classList.remove(("active"));
        });
    }

    const filterName = target.typeName;
    const filterTypeValue = target.typeValue;

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
    else if (document.URL.includes("news")) {
        const filterArray = filterednewsTotalUrl.searchParams.getAll("type")
        if (e.currentTarget.typeName === "resetFilter") {
            filterednewsTotalUrl.searchParams.delete("type");
        }
        else if (!filterArray.includes(filterName)) {
            filterednewsTotalUrl.searchParams.append("type", filterName);
        }
        else {
            const filters = filterArray.filter(param => param !== filterName);
            filterednewsTotalUrl.searchParams.delete("type");
            for (const param of filters)
                filterednewsTotalUrl.searchParams.append("type", param);
        }
        filterData(filterednewsTotalUrl);
    }
    else {
       const filterTypeArr = filteredcharacterTotalUrl.searchParams.getAll("type");
       const filterAttackTypeArr = filteredcharacterTotalUrl.searchParams.getAll("attack_type");
       const filterDamageTypeArr = filteredcharacterTotalUrl.searchParams.getAll("damage_type");
       const filterAllTypeArr = filterTypeArr + filterAttackTypeArr + filterDamageTypeArr;
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
       filterData(filteredcharacterTotalUrl);
    }
}
function hideToggle(e) {
    const target = e.currentTarget;
    const infoArr = target.dataArr;
    const detailBoxes = target.parentNode.querySelectorAll(".detail");
    const detailBoxIndex = parseInt(parseInt(target.dataIndex) / 4);
    const selectedDetailBox = detailBoxes[detailBoxIndex];
    detailBoxes.forEach((element) => {
        element.classList.add("hidden");
    })
    selectedDetailBox.classList.toggle("hidden");
    document.querySelectorAll('.index > .profile').forEach((element) => {
        element.classList.remove("active");
    })
    target.classList.toggle("active");
    if (target.information === "item") {
        inputItemData(infoArr, selectedDetailBox);
    }
    else if (target.information === "battle-item") {
        inputBattleItemData(infoArr, selectedDetailBox);
    }
    else {
        inputCharacterData(infoArr, selectedDetailBox);
    }
}

function createImg(info, detailFunction) {
    const indexSection = document.querySelector(".index-section");
    const indexDiv = document.querySelector(".index");
    indexSection.append(indexDiv);
    info.forEach((element, childIndex) => {
        const index = element.id;
        const profileDiv = document.createElement("li");
        const itemImg = document.createElement("img");
        const type = element.type;
        const nameLabel = document.createElement("p");
        nameLabel.className = "label";
        nameLabel.textContent = element.name_text;
        indexDiv.append(profileDiv);
        profileDiv.append(itemImg);
        profileDiv.onclick = hideToggle;
        profileDiv.className = "profile"
        profileDiv.append(nameLabel);
        profileDiv.classList.add = type;
        profileDiv.id = index;
        profileDiv.dataIndex = childIndex;
        profileDiv.dataArr = element;
        itemImg.src = element.img;
        itemImg.className = element.type;
        if ((itemImg.src).includes("held-items")) {
            profileDiv.information = "item";
        } else if ((itemImg.src).includes("battle-items")) {
            profileDiv.information = "battle-item";
        } else {
            profileDiv.information = "character";
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
    filterSetting
}